package zipsa.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import zipsa.dao.T_MemberDAO;
import zipsa.entity.T_HOLIDAY;
import zipsa.entity.T_RESERVATION;

public class StaffDayCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		"/StaffDay.do"
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();

		// 직원선택 후 직원번호에 맞는 휴무일,예약일 list에 담아서 보내주기
		int STAFF_SEQ = Integer.parseInt(request.getParameter("STAFF_SEQ"));
		T_MemberDAO dao = new T_MemberDAO();

		List<T_RESERVATION> Rlist = dao.staffRDay(STAFF_SEQ); // 직원 예약일 리스트 Rlist
		List<T_HOLIDAY> Hlist = dao.staffHDay(STAFF_SEQ); // 직원 휴무일 리스트 Hlist

		// REV_DT, HOLI_DT 달력에 입력가능한 형식으로 바꿔서 list에 새로 담아서 보내주기
		ArrayList<String> Slist = new ArrayList<String>();

	      DateFormat dateFomatter = new SimpleDateFormat("dd.MM.yyyy");
		for (T_HOLIDAY dto : Hlist) {
			Slist.add(dateFomatter.format(dto.getHOLI_DT().getTime()));
		}
		for (T_RESERVATION dto : Rlist) {
			Slist.add(dateFomatter.format(dto.getREV_DT().getTime()));
		}

		Gson gson = new Gson();
		String json = gson.toJson(Slist);

		out.print(json);

		return null;
	}

}
