package zipsa.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import zipsa.dao.T_MemberDAO;
import zipsa.entity.T_MEMBER;
import zipsa.entity.T_RESERVATION;

public class A_RvinfoUpdate implements Controller {
	
// 관리자가 보는 모든 예약현황 521

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String seq = request.getParameter("seq");
		String date = request.getParameter("date");
		
		// update
		T_RESERVATION rev = new T_RESERVATION();			
		rev.setREV_SEQ(Integer.parseInt(seq));
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
		try {
			rev.setREV_DT(sdf.parse(date));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		T_MemberDAO dao = new T_MemberDAO();
		dao.updateReservation(rev);
		return null;    
	}

}
