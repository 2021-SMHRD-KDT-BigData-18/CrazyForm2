package zipsa.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import zipsa.dao.T_MemberDAO;

public class M_DeleteCon implements Controller {
	//페이지 넘겨줄때 jsp에서 버튼클릭시 페이지 넘겨줄때 delete.do?M_ID=\${M_ID}로 넘겨주기
	
	// 회원탈퇴버튼 클릭 시 불러오는 페이지 
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String M_ID= request.getParameter("id");
		T_MemberDAO dao = new T_MemberDAO();
		int row = dao.delete(M_ID);
		if (row > 0) {
			return "redirect:/goMain.do";     // 성공 시 메인페이지로
		} else {
			return "redirect:/goMain.do";	  // 실패 시 메인페이지로???
		}
	}
}
