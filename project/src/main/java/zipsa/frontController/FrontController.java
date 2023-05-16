package zipsa.frontController;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import zipsa.controller.A_RvinfoCon;
import zipsa.controller.A_MinfoCon;
import zipsa.controller.Controller;
import zipsa.controller.M_DeleteCon;
import zipsa.controller.M_JoinCon;
import zipsa.controller.M_LoginCon;
import zipsa.controller.M_LogoutCon;
import zipsa.controller.RvCon;
import zipsa.controller.M_SelectMCon;
import zipsa.controller.M_UpdateCon;
import zipsa.controller.M_RvInfoCon;
import zipsa.controller.checkCon;
import zipsa.controller.goLoginCon;
import zipsa.controller.goMainCon;
import zipsa.controller.goReviewMainCon;
import zipsa.controller.goRvCon;
import zipsa.controller.goUpdateCon;
import zipsa.controller.gojoinCon;

@WebServlet("*.do")
public class FrontController extends HttpServlet {

	private HashMap<String, Controller> mappings;

	@Override
	public void init() throws ServletException {

		mappings = new HashMap<String, Controller>();

		mappings.put("/Main.do", new goMainCon());
		mappings.put("/gologin.do", new goLoginCon());
		mappings.put("/goReservation.do", new goRvCon()); // 예약하기 페이지 이동
		mappings.put("/join.do", new gojoinCon());		  // 회원가입 페이지 이동
		mappings.put("/Rv.do",new RvCon()); 			  // 예약하기
		mappings.put("/login.do", new M_LoginCon());	  // 로그인
		mappings.put("/logout.do", new M_LogoutCon());
		mappings.put("/goUpdate.do", new goUpdateCon());
		mappings.put("/update.do", new M_UpdateCon());
		mappings.put("/goSelectAllMember.do", new A_MinfoCon()); // 관리자 회원관리
		mappings.put("/goSelectAllR.do", new A_RvinfoCon()); // 관리자 예약현황 확인
		mappings.put("/goSelectRv.do", new M_RvInfoCon()); // 회원이 보는 예약현황 확인
		mappings.put("/goRv.do", new goRvCon()); // 예약하기창
		mappings.put("/goSelectMember", new M_SelectMCon()); // 회원의 내 정보보기??
		mappings.put("/delete.do", new M_DeleteCon()); // 회원탈퇴

		mappings.put("/reviewMain.do", new goReviewMainCon()); // 리뷰게시판가기
//			mappings.put("/gowirteReview.do", new gowriteReviewCon());			// 리뷰작성하러가기
//			mappings.put("/writeReivew.do", new writeBoardCon());				// 리뷰작성하기
//			mappings.put("/viewBoard.do", new ViewBoardCon());					// 리뷰게시판
//			mappings.put("/ajax.do", new AjaxCon());							
		mappings.put("/check.do", new checkCon());
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String uri = request.getRequestURI();
		String cpath = request.getContextPath();
		String command = uri.substring(cpath.length());

		String nextView = null;
		Controller con = null;

		con = mappings.get(command);

//			 3.페이지이동
		if (con != null) {
			nextView = con.execute(request, response);
		}

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