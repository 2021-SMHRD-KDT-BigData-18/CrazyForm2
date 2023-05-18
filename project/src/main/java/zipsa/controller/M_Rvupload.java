package zipsa.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import zipsa.dao.T_MemberDAO;
import zipsa.entity.T_MEMBER;
import zipsa.entity.T_RESERVATION;

public class M_Rvupload implements Controller {
//
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 예약하기에서 직원선택 Y시 내 예약일 보내주는 컨트롤러
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		T_MEMBER user = (T_MEMBER) session.getAttribute("user");
		String M_ID = user.getM_ID();
		
		T_MemberDAO dao = new T_MemberDAO();
		List<T_RESERVATION> list = dao.selectRv(M_ID);
		
		Gson gson = new Gson();
		String json = gson.toJson(list);

		out.print(json);

		return null;
	}

}
