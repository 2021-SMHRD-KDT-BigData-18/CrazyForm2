package zipsa.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import zipsa.dao.T_MemberDAO;
import zipsa.entity.T_MEMBER;

public class M_LoginCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		T_MEMBER dto = new T_MEMBER();
		dto.setM_ID(id);
		dto.setM_PW(pw);
		
		T_MemberDAO dao = new T_MemberDAO();
		
		T_MEMBER user = dao.login(dto);
		
		String nextView = null;
		
		if (user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			nextView = "redirect:/Main.do";
		} else {
			nextView = "redirect:/login.do";
		}
		return nextView;
	}
}