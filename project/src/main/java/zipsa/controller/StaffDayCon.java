package zipsa.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import zipsa.dao.T_MemberDAO;
import zipsa.entity.T_HOLIDAY;
import zipsa.entity.T_RESERVATION;

public class StaffDayCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 직원선택 후 직원번호에 맞는 휴무일,예약일 보내주기
		
		request.setCharacterEncoding("UTF-8");
		
		int STAFF_SEQ =Integer.parseInt(request.getParameter("STAFF_SEQ"));
		T_MemberDAO dao = new T_MemberDAO();
		
		List<T_RESERVATION> Rlist=dao.staffRDay(STAFF_SEQ);
		List<T_HOLIDAY> Hlist=dao.staffHDay(STAFF_SEQ); //직원 휴무일 리스트 Hlist
		
		// 요청에 Hlist에 휴무일 Rlist에 예약일 넘겨주기
		request.setAttribute("Rlist", Rlist);		
		request.setAttribute("Hlist", Hlist);
		
		return "test2";
	}

}
