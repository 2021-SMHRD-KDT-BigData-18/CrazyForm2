package zipsa.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import zipsa.dao.T_MemberDAO;
import zipsa.entity.T_HOLIDAY;
import zipsa.entity.T_RESERVATION;

public class A_RvinfoUpdate implements Controller {
	
// 관리자가 보는 모든 예약현황 521

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		int REV_SEQ = Integer.parseInt(request.getParameter("seq")); 		//예약번호
		String RVDT = request.getParameter("date"); 						//변경날짜
		int STAFF_SEQ = Integer.parseInt(request.getParameter("staffSeq"));  //직원번호
		String PET_YN = request.getParameter("petYn");						//펫유무
System.out.println(REV_SEQ);
System.out.println(RVDT);
System.out.println(STAFF_SEQ);
System.out.println(PET_YN);
		String RVDT1 = RVDT.substring(0,10);
		
		// update
		T_RESERVATION dto = new T_RESERVATION();			
		dto.setREV_SEQ(REV_SEQ);
		
		// SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
		// ParsePosition pos = new ParsePosition (0);
		// Date REV_DT = fmt.parse(RVDT, pos); // 영어+숫자된 날짜 date type으로 변경	
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat fmt1 = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date REV_DT = fmt.parse(RVDT);
System.out.println(REV_DT);
			dto.setREV_DT(REV_DT);
			
			T_MemberDAO dao = new T_MemberDAO();
			int row =0;
			
			//휴무일이 변경될 날짜와 겹치진 않는지 확인
			Date HOLI_DT = fmt1.parse(RVDT1);
System.out.println(HOLI_DT);
			T_HOLIDAY Hdto = new T_HOLIDAY();
			Hdto.setSTAFF_SEQ(STAFF_SEQ);
			Hdto.setHOLI_DT(HOLI_DT);
			
			T_HOLIDAY list = dao.confirmholi(Hdto);
			if (list != null) {
				// 펫유무 확인 후 랜덤
				if (PET_YN.equals('Y')) {
		    		  STAFF_SEQ=dao.RandomStaffY(REV_DT);
		    	  }else  { STAFF_SEQ=dao.RandomStaff(REV_DT);   }
				System.out.println("스태프 변경할게용");
				}
			dto.setSTAFF_SEQ(STAFF_SEQ);
			row = dao.updateReservation(dto);
			if (row>0) {
				System.out.println("변경성공");
			}
				
			
		} catch (ParseException e) {
			e.printStackTrace();
		}			
		
		return null;    
	}

}
