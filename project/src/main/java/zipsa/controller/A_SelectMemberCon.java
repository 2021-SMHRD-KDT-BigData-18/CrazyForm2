package zipsa.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import zipsa.dao.T_MemberDAO;
import zipsa.entity.T_MEMBER;


public class A_SelectMemberCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		T_MemberDAO dao = new T_MemberDAO();
		List<T_MEMBER> list = dao.selectMember();
		request.setAttribute("list", list);
		return "select";
	}

}
