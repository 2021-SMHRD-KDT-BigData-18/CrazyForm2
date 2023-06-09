package zipsa.frontController;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import zipsa.controller.A_RvinfoList;
import zipsa.controller.A_RvinfoUpdate;
import zipsa.controller.A_MinfoCon;
import zipsa.controller.A_RvinfoCon;
import zipsa.controller.Controller;
import zipsa.controller.M_DeleteCon;
import zipsa.controller.M_JoinCon;
import zipsa.controller.M_LoginCon;
import zipsa.controller.M_LogoutCon;
import zipsa.controller.RvCon;
import zipsa.controller.StaffDayCon;
import zipsa.controller.M_UpdateCon;
import zipsa.controller.M_writeReviewCon;
import zipsa.controller.checkCon;
import zipsa.controller.goJoinSuccessCon;
import zipsa.controller.goLoginCon;
import zipsa.controller.goMInfoCon;
import zipsa.controller.goMainCon;
import zipsa.controller.goReviewMainCon;
import zipsa.controller.goRvCon;
import zipsa.controller.goWriteReviewCon;
import zipsa.controller.gojoinCon;
import zipsa.controller.popupCon;
import zipsa.controller.M_Rvupload;

@WebServlet("*.do")
public class FrontController extends HttpServlet {

	private HashMap<String, Controller> mappings;

	@Override
	public void init() throws ServletException {

		mappings = new HashMap<String, Controller>();

		mappings.put("/Main.do", new goMainCon());		  // 메인페이지 이동
		mappings.put("/gojoin.do", new gojoinCon());	  // 회원가입 페이지 이동
		mappings.put("/join.do", new M_JoinCon());		  // 회원가입 저장시키고 이동하는 페이지
		mappings.put("/goJoinSuccess.do", new goJoinSuccessCon());		  // 회원가입 저장시키고 이동하는 페이지
		mappings.put("/check.do", new checkCon());		  // 아이디 중복체크 ajax
		mappings.put("/gologin.do", new goLoginCon());	  // 로그인화면 이동
		mappings.put("/login.do", new M_LoginCon());	  // 로그인 후 메인으로 이동시키는 페이지
		mappings.put("/logout.do", new M_LogoutCon());	  // 로그아웃하는 페이지
		mappings.put("/goRv.do", new goRvCon()); 		  // 예약하기 페이지 이동
		mappings.put("/Rv.do", new RvCon()); 		      // 예약내용 저장시키고 메인으로 이동하는 페이지

		
		mappings.put("/goMinfo.do", new goMInfoCon());   // 회원이 보는 예약내역으로 가는 페이지(예약현황, 회원정보 포함)
		mappings.put("/update.do", new M_UpdateCon());    // 비밀번호, 회원정보 수정 후 예약내역으로 다시 가는 페이지
		mappings.put("/delete.do", new M_DeleteCon()); 	  // 회원탈퇴
		mappings.put("/Rvupload.do", new M_Rvupload());   // 이전 예약기록불러오기
		mappings.put("/StaffDay.do", new StaffDayCon());  // 직원의 휴무일,예약일 불러오기
		mappings.put("/gowriteReview.do", new goWriteReviewCon()); //리뷰작성으로 가는 페이지
		mappings.put("/writeReivew.do", new M_writeReviewCon());				// 리뷰작성내용 sql등록후 리뷰메인으로 넘기는 페이지
		mappings.put("/goreviewMain.do", new goReviewMainCon());				// 리뷰보는 게시판
		
		mappings.put("/rvInfo.do", new A_RvinfoList());		 // 관리자 예약내역관리 리스트
		mappings.put("/goRvInfo.do", new A_RvinfoCon());   // 관리자 예약내역관리 페이지 이동
		mappings.put("/updateRvInfo.do", new A_RvinfoUpdate()); // 관리자 캘린더로 예약내역관리
		mappings.put("/goM_info.do", new A_MinfoCon());		  // 관리자 회원관리페이지 이동
		
		mappings.put("/popup.do", new popupCon());		  // 팝업 이동
		
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