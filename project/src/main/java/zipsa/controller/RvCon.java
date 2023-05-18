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


public class RvCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 예약하기에서 입력된 정보를 받아와서 sql에 실현시키고 메인화면으로 넘기는 컨트롤러
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		
		
		 
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		T_MEMBER user = (T_MEMBER) session.getAttribute("user");
		
		String M_ID = user.getM_ID();
		String JOB_T = request.getParameter("JOB_T");// 청소내용
		
		String PET_YN = request.getParameter("PET_YN");      					// 펫유무
		String REV_NOTE = request.getParameter("REV_NOTE");						// 요청사항
		String M_ADDR = request.getParameter("M_ADDR");					// 주소등록
		
		// RVDT를 date타입으로 변환시켜서 REV_DT에 저장 
		String RvDT = format.format(request.getParameter("REV_DT"));
		Date REV_DT = format.parse(RvDT);
		
		//직원번호 null로 받아오는지 확인
		String STAFFSEQ = request.getParameter("STAFF_SEQ");
		int STAFF_SEQ = 0;
		
		// 예약일자만 구해서 쉬는날과 예약일이 맞지않은 직원은 배제시키기위함
		T_MemberDAO dao = new T_MemberDAO();
		if (STAFFSEQ == null) {
		STAFF_SEQ=dao.RandomStaff(REV_DT);	
		}else {
		STAFF_SEQ=Integer.parseInt(STAFFSEQ);
		}
		
		//dto에 정보 맵핑 후 등록
		T_RESERVATION dto = new T_RESERVATION();
		dto.setM_ID(M_ID);
		dto.setJOB_T(JOB_T);
		dto.setREV_DT(REV_DT);
		dto.setPET_YN(PET_YN);
		dto.setSTAFF_SEQ(STAFF_SEQ);
		dto.setREV_NOTE(REV_NOTE);
		dto.setM_ADDR(M_ADDR);

		int row = dao.Reserv(dto);

		if (row > 0) {
			session.setAttribute("user", dto);
			return "redirect:/goMain.do"; // 예약성공 후 보여줄 화면
		} else {
			return "redirect:/goRv.do"; // 예약실패 후 예약하기화면 다시 등록
			}
	}
	}