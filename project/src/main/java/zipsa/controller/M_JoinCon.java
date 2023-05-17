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

		String M_ID = request.getParameter("id");
		String M_PW = request.getParameter("pw");
		String M_NAME = request.getParameter("name");
		String M_PHONE = request.getParameter("phone");

		T_MEMBER dto = new T_MEMBER();
		
		dto.setM_ID(M_ID);
		dto.setM_PW(M_PW);
		dto.setM_NAME(M_NAME);
		dto.setM_PHONE(M_PHONE);

		T_MemberDAO dao = new T_MemberDAO();
		int row = dao.join(dto);

		String nextView = null;
		
		if (row > 0) {
			nextView = "redirect:/goJoinSuccess.do";
		} else {
			nextView = "redirect:/Main.do";
		}
		return nextView;
		


	}

}
