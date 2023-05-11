package zipsa.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import zipsa.entity.ZipsaMember;

public class ZipsaMemberDAO {
	private SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();

	// 회원가입
	public int join(ZipsaMember dto) {
		SqlSession session = factory.openSession(true);
		int row = session.insert("join", dto);
		session.close();
		return row;

	}

	// 로그인
	public ZipsaMember login(ZipsaMember dto) {
		SqlSession session = factory.openSession(true);
		ZipsaMember user = session.selectOne("login", dto);
		session.close();
		return user;
	}
	
	// 회원정보 수정
	public int update(ZipsaMember dto) {
		SqlSession session = factory.openSession(true);
		int row = session.update("update", dto);
		session.close();
		return row;
	}
	// 주소 수정   → 예약하기 페이지에서 주소 수정시에 JSP에서 id 와 address update시켜줘야함
	public int updateAddr(ZipsaMember dto) {
		SqlSession session = factory.openSession(true);
		int row = session.update("update", dto);
		session.close();
		return row;
		}
	
	// 관리자의 회원관리창
	public List<ZipsaMember> selectMember() {
		SqlSession session = factory.openSession(true);
		List<ZipsaMember> list = session.selectList("selectMember");
		session.close();
		return list;
	}
	// 관리자가 보는 회원예약현황
	public List<ZipsaMember> selectAll() {
		SqlSession session = factory.openSession(true);
		List<ZipsaReservation> list = session.selectList("selectAll");
		session.close();
		return list;
	}
	
	// 내 예약현황 확인
	public List<ZipsaReservation> selectRv(ZipsaMember dto) {
		SqlSession session = factory.openSession(true);
		List<ZipsaReservation> reserv = session.selectList("selectRv", dto);
		session.close();
		return reserv;
	}
	
	// 회원 탈퇴  → deleteCon에서 id와 pw dto로 묶어줘야함
	public int delete(ZipsaMember dto) {
		SqlSession session = factory.openSession(true);
		int row = session.delete("delete", dto);
		session.close();
		return row;
	}
	
	// 회원정보 확인
	public ZipsaMember check(String id) {
		SqlSession session = factory.openSession(true);
		ZipsaMember dto = session.selectOne("check", id);
		session.close();
		return dto;
	}

	
}
