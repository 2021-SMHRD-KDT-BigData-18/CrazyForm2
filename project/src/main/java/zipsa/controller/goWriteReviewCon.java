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

public class goWriteReviewCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 리뷰작성으로 가는 페이지 ( 예약내역 가져가야함 sysdsate기준 이후로)
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		T_MEMBER user = (T_MEMBER) session.getAttribute("user");
		String M_ID = user.getM_ID();
		
		//예약일자 받아오기
		T_MemberDAO dao = new T_MemberDAO();
		List<T_RESERVATION> list=dao.sameRevSeq(M_ID);
		
		// list에 예약list담아주기
		session.setAttribute("list", list);
		
		// list에 아무것도 없으면 메인으로
		if(list == null) { 
			return "Redirect://Main.do";
		}else return "writeReview"; //있으면 작성하기페이지로
	}

}
