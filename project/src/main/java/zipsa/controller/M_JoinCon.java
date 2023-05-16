package zipsa.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import zipsa.dao.T_MemberDAO;
import zipsa.entity.T_MEMBER;

public class M_JoinCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");

		T_MEMBER dto = new T_MEMBER();
		dto.setM_ID(id);
		dto.setM_PW(pw);
		dto.setM_NAME(name);
		dto.setM_PHONE(phone);

		T_MemberDAO dao = new T_MemberDAO();
		int row = dao.join(dto);

		String nextView = null;
		if (row > 0) {
			nextView = "JoinSuccess";
		} else {
			nextView = "redirect:/Main.do";
		}
		return nextView;

	}

}
