package zipsa.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import zipsa.dao.T_MemberDAO;
import zipsa.entity.T_MEMBER;
import zipsa.entity.T_RESERVATION;


public class RvCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 예약하기에서 입력된 정보를 받아와서 sql에 실현시키고 메인화면으로 넘기는 컨트롤러
		
//		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		T_MEMBER user = (T_MEMBER) session.getAttribute("user");
		
		String M_id = user.getM_ID();
		String jobT = request.getParameter("jobT");   					// 청소내용
		String revDT = request.getParameter("revDT");
//		Date revDT = transFormat.parse(request.getParameter("revDT"));  // 예약날짜
		String pet_yn = request.getParameter("pet");      					// 펫유무
		String rev_note = request.getParameter("note");						// 요청사항
		String M_addr = request.getParameter("address");					// 주소등록
		
		// 예약일자만 구해서 쉬는날과 예약일이 맞지않은 직원은 배제시키기위함
		T_MemberDAO dao = new T_MemberDAO();
		int staff= dao.RandomStaff();
		
		//dto에 정보 맵핑 후 등록
		T_RESERVATION dto = new T_RESERVATION();
		dto.setM_ID(M_id);
		dto.setJOB_T(jobT);
		dto.setREV_DT(revDT);
		dto.setPET_YN(pet_yn);
		dto.setSTAFF_SEQ(staff);
		dto.setREV_NOTE(rev_note);
		dto.setM_ADDR(M_addr);

		int row = dao.Reserv(dto);

		if (row > 0) {
			session.setAttribute("user", dto);
			return "redirect:/goMain.do"; // 예약성공 후 보여줄 화면
		} else {
			return "redirect:/goRv.do"; // 예약실패 후 예약하기화면 다시 등록
			}
	}
	}