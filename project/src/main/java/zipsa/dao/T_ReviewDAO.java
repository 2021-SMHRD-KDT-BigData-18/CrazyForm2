package zipsa.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;


import zipsa.entity.T_REVIEW;


public class T_ReviewDAO {
	private SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();

// 리뷰보기
	public List<T_REVIEW> select() {
		SqlSession session = factory.openSession(true);
		List<T_REVIEW> list = session.selectList("reviewselect");
		session.close();
		return list;
	}
// 리뷰 작성
	public int write(T_REVIEW dto) {
		SqlSession session = factory.openSession(true);
		int row = session.insert("reviewWrite", dto);
		session.close();
		return row;

	}
	
//	리뷰하나하나 보는곳
//	public T_REVIEW view(int num) {
//		SqlSession session = factory.openSession(true);
//		T_REVIEW dto = session.selectOne("view",num);
//		session.close();
//		return dto; }
	

	
	
}