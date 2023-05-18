package zipsa.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import zipsa.dao.T_MemberDAO;
import zipsa.entity.T_MEMBER;


public class checkCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// id중복확인
		
		request.setCharacterEncoding("UTF-8");
		String M_ID = request.getParameter("id");

		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		T_MemberDAO dao = new T_MemberDAO();
		T_MEMBER dto = dao.check(M_ID);

		// 사용 가능한 id = true , 불가능 = false 응답
		String res = "";

		if (dto == null) { // id 성공
			res = "true";
		} else {res = "false";} //id 실패
		out.print(res);
		
		
		return null;
	}

}
