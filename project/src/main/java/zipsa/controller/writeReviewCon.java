package zipsa.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import zipsa.dao.T_MemberDAO;
import zipsa.entity.T_MEMBER;
import zipsa.entity.T_REVIEW;

public class writeReviewCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 작성된 리뷰 등록하는 컨트롤러
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		T_MEMBER user = (T_MEMBER) session.getAttribute("user");
		String id = user.getM_ID();
		
		T_MemberDAO dao = new T_MemberDAO();
		
		T_MEMBER dto  = dao.selectM(id);
		request.setAttribute("dto",dto);
		return "selectM";    //selectM.jsp 보여줌
		
		
		REVIEW_SEQ = rEVIEW_SEQ;
		REV_SEQ = rEV_SEQ;
		REVIEW_CONTENT = rEVIEW_CONTENT;
		REVIEW_IMG = rEVIEW_IMG;
		REVIEW_RATING = rEVIEW_RATING;
		REVIEW_DT = rEVIEW_DT;
		M_ID = m_ID;
		
		
		
		
		
		// MultipartRequest -> cos.jar 업로드

		// ■ MultipartRequest(request, 경로, 사진size, 인코딩방법, 저장할file명)

		// - 업로드 된 파일 저장할 경로(DB에 이미지를 저장하지 않고 경로만 저장)
		String path = request.getServletContext().getRealPath("file");

		// - 파일 max size (byte)
		int maxSize = 10 * 1024 * 1024; // 10MB
		// - rename : 자동 rename기능
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();

		MultipartRequest multi = new MultipartRequest(request, path, maxSize, "UTF-8", rename);

		String title = multi.getParameter("title");
		String writer = multi.getParameter("writer");
		String content = multi.getParameter("content");
		String filename = multi.getFilesystemName("filename");

		T_REVIEW dto = new T_REVIEW();
		dto.setTitle(title);
		dto.setWriter(writer);
		dto.setFilename(filename);
		dto.setContent(content);

		// 기능구현

		T_REVIEWDAO dao = new T_reivewDAO();
		int row = dao.write(dto);

		// 뷰선택

		if (row > 0) {
			return "redirect:/goBoardMain.do";
		} else {
			return "redirect:/writeBoard.do";
		}

	}

}
