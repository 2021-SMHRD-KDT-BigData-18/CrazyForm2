package zipsa.controller;

import com.google.gson.Gson;
import zipsa.dao.T_MemberDAO;
import zipsa.entity.T_RESERVATION;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class A_RvinfoList implements Controller {
	
// 관리자가 보는 모든 예약현황 리스트 리턴
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		String YM = request.getParameter("YM");
		
		T_MemberDAO dao = new T_MemberDAO();
		List<T_RESERVATION> list = dao.selectAllRDate(YM);
		String listToJson= new Gson().toJson(list);
		out.print(listToJson);
		
		return null;
	}

}
