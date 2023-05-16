package zipsa.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import zipsa.dao.T_MemberDAO;
import zipsa.entity.T_RESERVATION;

public class goA_Rv implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
// 관리자가 보는 예약현황 보러 가는 창
		T_MemberDAO dao = new T_MemberDAO();
		List<T_RESERVATION> list =dao.selectAllR();

/*jsp에서 실행할 list불러서 담기
		for(T_RESERVATION dto : list) {
			int Revnum=dto.getREV_SEQ();
			String revDt=dto.getREV_DT();
			String id = dto.getM_ID();
			String job_t =dto.getJOB_T();
			String addr =dto.getM_ADDR();
			String pet=dto.getPET_YN();
			String revNote=	dto.getREV_NOTE();
			String staffName=dto.getSTAFF_NAME();
		System.out.println(dto);
		}
		*/
		System.out.println(list);
		request.setAttribute("list", list);
		
		return "A_Rv";
	}

}
