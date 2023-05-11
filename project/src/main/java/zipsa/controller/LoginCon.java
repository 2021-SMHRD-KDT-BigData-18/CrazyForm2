package zipsa.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import zipsa.dao.ZipsaMemberDAO;
import zipsa.entity.ZipsaMember;

public class LoginCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		ZipsaMember dto = new ZipsaMember();
		
		dto.setId(id);
		dto.setPw(pw);
		
		ZipsaMemberDAO dao = new ZipsaMemberDAO();
		ZipsaMember user = dao.login(dto);
		
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