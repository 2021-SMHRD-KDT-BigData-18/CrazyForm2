package zipsa.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import zipsa.dao.T_MemberDAO;
import zipsa.dao.T_ReviewDAO;
import zipsa.entity.T_MEMBER;
import zipsa.entity.T_RESERVATION;
import zipsa.entity.T_REVIEW;


public class M_writeReviewCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 작성한 리뷰 받아서 DB에 저장하는 Controller
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		// ID,예약번호,리뷰내용,리뷰별점 내용기록
		T_MEMBER user = (T_MEMBER) session.getAttribute("user");
		String M_ID = user.getM_ID();
		int REV_SEQ = Integer.parseInt((String) session.getAttribute("REV_SEQ"));
		String REVIEW_CONTENT = request.getParameter("REVIEW_CONTENT");
		double REVIEW_RATING = Integer.parseInt(request.getParameter("REVIEW_RATING"));
		
		//예약일자 받아오기
		T_MemberDAO dao = new T_MemberDAO();
		T_RESERVATION list=dao.forReview(REV_SEQ);
		Date REV_DT = list.getREV_DT();
		
		T_REVIEW dto = new T_REVIEW();
		dto.setM_ID(M_ID);
		dto.setREV_SEQ(REV_SEQ);
		dto.setREVIEW_CONTENT(REVIEW_CONTENT);
		dto.setREVIEW_RATING(REVIEW_RATING);
		T_ReviewDAO daoR = new T_ReviewDAO();
		int row= daoR.write(dto);
		
		session.removeAttribute("REV_SEQ");
		if (row >0) {
			return "Redirect://goreviewMain.do"; //성공시 리뷰메인으로 이동
		}else {
			return "Redirect://goMinfo.do"; //나의예약내역으로
		}

	}

}
