package zipsa.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import zipsa.entity.T_MEMBER;

public class goJoinSuccessCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 회원가입성공페이지로 연결
		HttpSession session = request.getSession();
		
		T_MEMBER user = (T_MEMBER) session.getAttribute("user");
		
		request.setAttribute("user", user);
		
		return "JoinSuccess";
	}

}
