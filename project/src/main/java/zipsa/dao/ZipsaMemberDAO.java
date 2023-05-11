package zipsa.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import zipsa.entity.T_MEMBER;

public class ZipsaMemberDAO {
	private SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();

	// 회원가입
	public int join(T_MEMBER dto) {
		SqlSession session = factory.openSession(true);
		int row = session.insert("join", dto);
		session.close();
		return row;

	}

	// 로그인
	public T_MEMBER login(T_MEMBER dto) {
		SqlSession session = factory.openSession(true);
		T_MEMBER user = session.selectOne("login", dto);
		session.close();
		return user;
	}
	
	// 회원정보 수정
	public int update(T_MEMBER dto) {
		SqlSession session = factory.openSession(true);
		int row = session.update("update", dto);
		session.close();
		return row;
	}
	// 주소 수정   → 예약하기 페이지에서 주소 수정시에 JSP에서 id 와 address update시켜줘야함
	public int updateAddr(T_MEMBER dto) {
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
	public List<T_MEMBER> selectAll() {
		SqlSession session = factory.openSession(true);
		List<T_MEMBER> list = session.selectList("selectAll");
		session.close();
		return list;
	}
	
	// 내 예약현황 확인
	public List<T_MEMBER> selectRv(T_MEMBER dto) {
		SqlSession session = factory.openSession(true);
		List<T_MEMBER> reserv = session.selectList("selectRv", dto);
		session.close();
		return reserv;
	}
	
	// 회원 탈퇴  → deleteCon에서 id와 pw dto로 묶어줘야함
	public int delete(T_MEMBER dto) {
		SqlSession session = factory.openSession(true);
		int row = session.delete("delete", dto);
		session.close();
		return row;
	}
	
	// 회원정보 확인
	public T_MEMBER check(String id) {
		SqlSession session = factory.openSession(true);
		T_MEMBER dto = session.selectOne("check", id);
		session.close();
		return dto;
	}

	
}
