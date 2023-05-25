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
		T_RESERVATION dto = session.selectOne("RandomStaff", REV_DT);
		session.close();
		int staff = dto.getSTAFF_SEQ();
		return staff;
	}

	// 펫이 있을경우 알러지 없는 직원 랜덤배정
	public int RandomStaffY(Date REV_DT) {
		SqlSession session = factory.openSession(true);
		T_RESERVATION dto = session.selectOne("RandomStaffY", REV_DT);
		session.close();
		int staff = dto.getSTAFF_SEQ();
		return staff;
	}

	// 예약하기
	public int Reserv(T_RESERVATION dto) {
		SqlSession session = factory.openSession(true);
		int row = session.insert("reserv", dto);
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
	// 예약현황 하나만 불러오기

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

	public List<T_RESERVATION> selectAllR() {
		SqlSession session = factory.openSession(true);
		List<T_RESERVATION> list = session.selectList("selectAllR");
		session.close();
		return list;
	}

	// 관리자가 캘린더로 보는 회원예약현황
	public List<T_RESERVATION> selectAllRDate(String YM) {
		SqlSession session = factory.openSession(true);
		List<T_RESERVATION> list = session.selectList("selectAllRDate", YM);
		session.close();
		return list;
	}

	// 관리자가 캘린더로 드래그해서 예약현황변경
	public int updateReservation(T_RESERVATION dto) {
		SqlSession session = factory.openSession(true);
		int result = session.update("updateReservationDate", dto);
		session.close();
		return result;
	}

	// 예약시 선택한 직원번호 예약일
	public List<T_RESERVATION> staffRDay(int STAFF_SEQ) {
		SqlSession session = factory.openSession(true);
		List<T_RESERVATION> list = session.selectList("StaffRDay", STAFF_SEQ);
		session.close();
		return list;
	}

	// 예약시 선택한 직원번호 휴무일
	public List<T_HOLIDAY> staffHDay(int STAFF_SEQ) {
		SqlSession session = factory.openSession(true);
		List<T_HOLIDAY> list = session.selectList("staffHDay", STAFF_SEQ);
		session.close();
		return list;
	}

	// 리뷰작성위해 회원이 선택한 예약번호로 예약일자 불러오기
	public List<T_RESERVATION> sameRevSeq(String M_ID) {
		SqlSession session = factory.openSession(true);
		List<T_RESERVATION> list = session.selectList("sameRevSeq", M_ID);
		session.close();
		return list;

	}

	// 리뷰작성위해 회원이 선택한 예약번호로 예약일자 불러오기
	public List<T_RESERVATION> forReview(String M_ID) {
		SqlSession session = factory.openSession(true);
		List<T_RESERVATION> list = session.selectList("forReview", M_ID);
		session.close();
		return list;

	}
	
	// 예약수정 시 선택한 직원번호 휴무일이 아닌지 확인하는 기능
	public T_HOLIDAY confirmholi(T_HOLIDAY dto) {
		SqlSession session = factory.openSession(true);
		T_HOLIDAY list = session.selectOne("confirmholi",dto);
		session.close();
		return list;
	}
	// 예약수정 시 예약일자와 직원 예약일이 겹치는 row 갯수확인  사용X
	public T_RESERVATION confirmRv(T_RESERVATION dto) {
		SqlSession session = factory.openSession(true);
		T_RESERVATION Rdto = session.selectOne("confirmRv",dto);
		session.close();
		return Rdto;
	}
	
	// 예약수정시 직원 중복되지 않도록 랜덤배정 후 스태프 번호 받아서 입력
	public int RandomStaff(T_RESERVATION dto) {
		SqlSession session = factory.openSession(true);
		T_RESERVATION list = session.selectOne("rdStaff", dto);
		session.close();
		int staff = list.getSTAFF_SEQ();
		return staff;
	}

	// 펫이 있을경우 알러지 없는 직원 랜덤배정
	public int RandomStaffY(T_RESERVATION dto) {
		SqlSession session = factory.openSession(true);
		T_RESERVATION list = session.selectOne("rdStaffY", dto);
		session.close();
		int staff = list.getSTAFF_SEQ();
		return staff;
	}

}