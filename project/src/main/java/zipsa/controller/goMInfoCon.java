package zipsa.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import zipsa.dao.T_MemberDAO;
import zipsa.entity.T_MEMBER;
import zipsa.entity.T_RESERVATION;

public class goMInfoCon implements Controller {
	
	// 회원이 보는 예약내역(예약현황, 회원정보 포함)
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	// Mdto에 회원 정보 챙겨가기
		HttpSession session = request.getSession();
		T_MEMBER user = (T_MEMBER) session.getAttribute("user");
		String M_id = user.getM_ID();
		
		T_MemberDAO dao = new T_MemberDAO();
		T_MEMBER dto  = dao.check(M_id);
		request.setAttribute("Mdto",dto);		
		
	// Rlist에 예약현황 챙겨가기
			List<T_RESERVATION> list = dao.selectRv(M_id);
			request.setAttribute("Rlist", list);
			return "M_info"; 
			

}
	
	
}