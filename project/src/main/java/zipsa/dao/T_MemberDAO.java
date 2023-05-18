package zipsa.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import zipsa.entity.T_HOLIDAY;
import zipsa.entity.T_MEMBER;
import zipsa.entity.T_RESERVATION;

public class T_MemberDAO {

	private SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();

	// 회원가입 ) id,pw,name, phone joindate, type은 sysdate, m 으로 고정값
	public int join(T_MEMBER dto) {
		SqlSession session = factory.openSession(true);
		int row = session.insert("join", dto);
		session.close();
		return row;

	}
	// 로그인 ) id,pw입력
	public T_MEMBER login(T_MEMBER dto) {
		SqlSession session = factory.openSession(true);
		T_MEMBER user = session.selectOne("login", dto);
		session.close();
		return user;
	}
	
	// 예약할때 직원 중복되지 않도록 랜덤배정 후 스태프 번호 받아서 입력
	public int RandomStaff(Date REV_DT) {
		SqlSession session = factory.openSession(true);
		T_RESERVATION dto = session.selectOne("reserv",REV_DT);
		int staff=dto.getSTAFF_SEQ();
		session.close();
		return staff;	
	}
	
	// 예약하기
	public int Reserv(T_RESERVATION dto) {
		SqlSession session = factory.openSession(true);
		int row = session.update("reserv", dto);
		session.close();
		return row;
	}
	
	// 회원의 내정보 확인
	public T_MEMBER check(String M_ID) {
		SqlSession session = factory.openSession(true);
		T_MEMBER dto = session.selectOne("check", M_ID);
		session.close();
		return dto;
	}
	// 내 예약현황 확인 -> jsp에서 보여줄 땐
	public List<T_RESERVATION> selectRv(String M_ID) {
		SqlSession session = factory.openSession(true);
		List<T_RESERVATION> list = session.selectList("selectRv", M_ID);
		session.close();
		return list;
	}

	// 회원 탈퇴 → deleteCon에서 id와 pw dto로 묶어줘야함
	public int delete(String M_ID) {
		SqlSession session = factory.openSession(true);
		int row = session.delete("delete", M_ID);
		session.close();
		return row;
	}
	// 회원정보 수정) pw만 수정가능
	public int update(T_MEMBER dto) {
		SqlSession session = factory.openSession(true);
		int row = session.update("update", dto);
		session.close();
		return row;
	}

	// 관리자의 회원관리창
	public List<T_MEMBER> selectMember() {
		SqlSession session = factory.openSession(true);
		List<T_MEMBER> list = session.selectList("selectMember");
		session.close();
		return list;
	}

	// 관리자가 보는 회원예약현황
	public List<T_RESERVATION> selectAllR() {
		SqlSession session = factory.openSession(true);
		List<T_RESERVATION> list = session.selectList("selectAllR");
		session.close();
		return list;
	}	
	
	// 예약시 선택한 직원번호 예약일
	public List<T_RESERVATION> staffRDay(int STAFF_SEQ) {
		SqlSession session = factory.openSession(true);
		List<T_RESERVATION> list = session.selectList("StaffRDay",STAFF_SEQ);
		session.close();
		return list;
	}
	// 예약시 선택한 직원번호 휴무일
	public List<T_HOLIDAY> staffHDay(int STAFF_SEQ) {
		SqlSession session = factory.openSession(true);
		List<T_HOLIDAY> list = session.selectList("staffHDay",STAFF_SEQ);
		session.close();
		return list;
	}

}