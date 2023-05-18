package zipsa.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import zipsa.dao.T_MemberDAO;
import zipsa.dao.T_ReviewDAO;
import zipsa.entity.T_MEMBER;


public class M_writeReviewCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 작성한 리뷰 받아서 DB에 저장하는 Controller
		HttpSession session = request.getSession();
		T_MEMBER user = (T_MEMBER) session.getAttribute("user");

		String M_ID = user.getM_ID();

		
		
		T_ReviewDAO dao = new T_ReviewDAO();
		dao.

		
		return "Redirect://goreviewMain.do"; //성공시 리뷰메인으로 이동
	}

}
