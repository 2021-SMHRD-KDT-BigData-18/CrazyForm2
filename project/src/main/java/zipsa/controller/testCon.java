package zipsa.controller;

import java.io.IOException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import zipsa.dao.T_MemberDAO;
import zipsa.entity.T_RESERVATION;

public class testCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		SimpleDateFormat fmt_in = new SimpleDateFormat("EEE MMM dd yyyy kk:mm:ss", Locale.ENGLISH);
		SimpleDateFormat fmt_out = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
		
		String date_in = "Thu May 25 2023 14:00:00 GMT+0900(한국표준시)";
		ParsePosition pos = new ParsePosition(0);		
		Date outTime = fmt_in.parse(date_in, pos); // 영어+숫자된 날짜 date type으로 변경
		
		
		T_RESERVATION dto = new T_RESERVATION();
		dto.setM_ID("test1");
		dto.setJOB_T("가사도우미");
		dto.setPET_YN("Y");
		dto.setSTAFF_SEQ(1);
		dto.setREV_NOTE("깨끗이해주세용");
		dto.setM_ADDR("광주북구");
		dto.setREV_DT(outTime);
		
		
		T_MemberDAO dao = new T_MemberDAO();
		int row = dao.Reserv(dto);
		
		if (row >0) {
			System.out.println("성공~");
		}else {
			System.out.println("실패");
		}
		
	return "Redirect://Main.do";

}
}
