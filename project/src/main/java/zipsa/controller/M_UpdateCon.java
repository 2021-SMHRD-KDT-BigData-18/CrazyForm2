package zipsa.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import zipsa.dao.T_MemberDAO;
import zipsa.entity.T_MEMBER;


public class M_UpdateCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String M_PW = request.getParameter("pw");
		
		HttpSession session = request.getSession();
		T_MEMBER user = (T_MEMBER) session.getAttribute("user");
		String M_ID = user.getM_ID();
		
		T_MEMBER dto = new T_MEMBER();
		dto.setM_ID(M_ID);
		dto.setM_PW(M_PW);

		T_MemberDAO dao = new T_MemberDAO();
		int row = dao.update(dto);
		// 회원정보 수정완료 시 재 출력 실패 시 예약내역 재출력
		if (row > 0) {
			session.setAttribute("user", dto);
			return "redirect:/Main.do";
		} else {
			return "redirect:/goMinfo.do";
			}
	}

}
