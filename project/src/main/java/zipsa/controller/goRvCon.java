package zipsa.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import zipsa.dao.T_MemberDAO;
import zipsa.entity.T_MEMBER;
import zipsa.entity.T_RESERVATION;

public class goRvCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 예약하기 페이지로 이동하는 컨트롤러

		response.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		T_MEMBER user = (T_MEMBER) session.getAttribute("user");
		String M_ID = user.getM_ID();
		
		T_MemberDAO dao = new T_MemberDAO();
		List<T_RESERVATION> list = dao.selectRv(M_ID);
		
		request.setAttribute("list", list);
		
		return "reservation";
	}

}
