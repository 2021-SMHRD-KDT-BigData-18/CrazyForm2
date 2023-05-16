package zipsa.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import zipsa.dao.T_MemberDAO;
import zipsa.entity.T_MEMBER;

public class M_infoCon implements Controller {
	// 회원이 보는 예약내역(예약현황, 회원정보 포함)
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		T_MEMBER user = (T_MEMBER) session.getAttribute("user");

		String id = user.getM_ID();
		
		T_MemberDAO dao = new T_MemberDAO();
		
		T_MEMBER dto  = dao.selectM(id);
		request.setAttribute("dto",dto);
		return "selectM";    //selectM.jsp 보여줌
		
	}

}
