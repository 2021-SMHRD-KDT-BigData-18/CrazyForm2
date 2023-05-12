package zipsa.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class goCalendarCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. 데이터 수집
		
		// 2. 기능 구현
		
		// 3. View 선택
		return "calendar"; //calendar jsp로 이동
		
	}

}
