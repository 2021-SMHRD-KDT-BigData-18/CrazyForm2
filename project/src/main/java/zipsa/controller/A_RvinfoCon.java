package zipsa.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import zipsa.dao.T_MemberDAO;
import zipsa.entity.T_MEMBER;
import zipsa.entity.T_RESERVATION;

public class A_RvinfoCon implements Controller {
	
// 관리자가 보는 모든 예약현황

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		T_MemberDAO dao = new T_MemberDAO();
		List<T_RESERVATION> list = dao.selectAllR();
		request.setAttribute("list", list);
		return "selectAllRv";    
	}

}
