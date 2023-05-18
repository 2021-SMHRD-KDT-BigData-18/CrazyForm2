package zipsa.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import zipsa.controller.Controller;
import zipsa.dao.T_MemberDAO;
import zipsa.entity.T_MEMBER;
import zipsa.entity.T_RESERVATION;

public class M_Rvupload implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 예약하기에서 직원선택 누를 시 내 예약일 보내주는 컨트롤러
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		T_MEMBER user = (T_MEMBER) session.getAttribute("user");
		System.out.println(user);
		String M_ID = user.getM_ID();
		System.out.println(M_ID);
		
		T_MemberDAO dao = new T_MemberDAO();
		List<T_RESERVATION> list = dao.selectRv(M_ID);
		System.out.println(list);
		
		request.setAttribute("list", list);
		return "test";
	}

}
