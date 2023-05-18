package zipsa.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import zipsa.controller.Controller;
import zipsa.dao.T_MemberDAO;

public class goWriteReviewCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 리뷰작성으로 가는 페이지
		String REV_SEQ = request.getParameter("REV_SEQ");
		HttpSession session = request.getSession();
		
		session.setAttribute("REV_SEQ", REV_SEQ);
		

		return "writeReview";
	}

}
