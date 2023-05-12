package zipsa.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import zipsa.dao.T_ReviewDAO;
import zipsa.entity.T_REVIEW;

public class goReviewMainCon implements Controller {
	// 리뷰메인으로 가는 컨트롤러 & 리뷰리스트 가지고감
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		T_ReviewDAO dao = new T_ReviewDAO();
		List<T_REVIEW> list = dao.select();
		
		request.setAttribute("list", list);
		
		return "reviewMain";

	}

}
