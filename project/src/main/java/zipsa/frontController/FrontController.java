package zipsa.frontController;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import zipsa.controller.Controller;
import zipsa.controller.LoginCon;
import zipsa.controller.goMainCon;

// 모든 요청을 받을 수 있도록 url-mapping *로 지정
// @WebServlet("*.do") --> .do로 끝나는 모든 요청
@WebServlet("*.do")
public class FrontController extends HttpServlet {
	
	private HashMap<String, zipsa.controller.Controller> mappings;
	
	@Override
	public void init() throws ServletException {

		mappings = new HashMap<String, Controller>();
		
		mappings.put("/Main.do", new goMainCon());
//		mappings.put("/Join.do", new JoinCon());
		mappings.put("/login.do", new LoginCon());
//		mappings.put("/logout.do", new LogoutCon());
//		mappings.put("/goUpdate.do", new GoUpdateCon());
//		mappings.put("/update.do", new UpdateCon());
//		mappings.put("/goSelectMember.do", new SelectMemberCon()); // 관리자 회원관리
//		mappings.put("/goSelectAll.do", new SelectAllCon());    // 관리자 예약현황 확인
//		mappings.put("/goSelectRv.do", new SelectRvCon());    // 회원이 보는 예약현황 확인
//		mappings.put("/goRv.do", new GoRvCon());  // 예약하기창
//		mappings.put("/goCheckMember, new CheckCon());
//		mappings.put("/delete.do", new DeleteCon());
		
//		mappings.put("/goReviewMain.do", new GoReviewBoardMainCon());
//		mappings.put("/gowriterBoard.do", new GowriterBoardCon());
//		mappings.put("/writeBoard.do", new writeBoardCon());
//		mappings.put("/viewBoard.do", new ViewBoardCon());
//		mappings.put("/ajax.do", new AjaxCon());
//		mappings.put("/check.do", new CheckCon());
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		String cpath = request.getContextPath();
		String command = uri.substring(cpath.length());

		String nextView = null;
		Controller con = null; 

		con = mappings.get(command);
		
//		 3.페이지이동
		if (con != null) {
			nextView = con.execute(request, response); }

		if (nextView != null) {
			// redirect / forward 구분위해 규칙필요
			// 앞으로 redirect 요청은 반드시 앞에 redirect:/를 붙이는 규칙넣기
			if (nextView.contains("redirect:/")) {
				// nextView.split(":/"); --> redirect goMain 으로 나뉘어짐 → 1번인덱스가져오면됨
				response.sendRedirect(nextView.split(":/")[1]);
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/" + nextView + ".jsp");
				rd.forward(request, response);
			}

		}
	}
}