package zipsa.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/main")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		// 1. 데이터 수집
		
		// 2. 기능 구현
				
		// 3. view 선택
		// redirect -> 다시 요청 : c -> c
		// forward -> c -> jsp 이동
		String nextView = "Main.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(nextView);
		rd.forward(request, response);
		
				
		
		
		
		
	}

}
