package zipsa.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import zipsa.dao.T_MemberDAO;
import zipsa.entity.T_MEMBER;
import zipsa.entity.T_RESERVATION;


public class M_RvCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 예약하기에서 입력된 정보를 받아와서 sql에 실현시키고 메인화면으로 넘기는 컨트롤러

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		T_MEMBER user = (T_MEMBER) session.getAttribute("user");
		
		String id = user.getM_ID();
		String jobT = request.getParameter("jobT");   					// 청소내용
		String revDT = request.getParameter("revDT");
//		Date revDT = transFormat.parse(request.getParameter("revDT"));  // 예약날짜
		String pet = request.getParameter("pet");      					// 펫유무
		int staff = Integer.parseInt(request.getParameter("staff"));    // 직원번호
		String note = request.getParameter("note");
		String tel = request.getParameter("m_ADDR");
		String addr = request.getParameter("address");
		
		
		T_RESERVATION dto = new T_RESERVATION();
		dto.setM_ID(id);
		dto.setJOB_T(jobT);
		dto.setREV_DT(revDT);
		dto.setPET_YN(pet);
		dto.setSTAFF_SEQ(staff);
		dto.setREV_NOTE(note);
		dto.setM_ADDR(addr);
		
		T_MemberDAO dao = new T_MemberDAO();
		int row = dao.Reserv(dto);

		if (row > 0) {
			session.setAttribute("user", dto);
			return "redirect:/goMain.do"; // 예약성공 후 보여줄 화면
		} else {
			return "redirect:/update.do"; // 예약실패 후 보여줄 화면
			}
	}
	}
