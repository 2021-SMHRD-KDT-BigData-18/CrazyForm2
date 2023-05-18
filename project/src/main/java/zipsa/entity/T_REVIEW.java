package zipsa.entity;

import java.util.Date;

public class T_REVIEW {

	// 고객 리뷰
	
	// 리뷰 순번
	private int REVIEW_SEQ;

	// 예약 번호
	private int REV_SEQ;

	// 리뷰 내용
	private String REVIEW_CONTENT;

	// 리뷰 별점
	private Double REVIEW_RATING;

	// 리뷰 날짜
	private Date REVIEW_DT;

	// 리뷰 작성자
	private String M_ID;
	
	public int getREVIEW_SEQ() {
		return REVIEW_SEQ;
	}

	public void setREVIEW_SEQ(int rEVIEW_SEQ) {
		REVIEW_SEQ = rEVIEW_SEQ;
	}

	public int getREV_SEQ() {
		return REV_SEQ;
	}

	public void setREV_SEQ(int rEV_SEQ) {
		REV_SEQ = rEV_SEQ;
	}

	public String getREVIEW_CONTENT() {
		return REVIEW_CONTENT;
	}

	public void setREVIEW_CONTENT(String rEVIEW_CONTENT) {
		REVIEW_CONTENT = rEVIEW_CONTENT;
	}

	public Double getREVIEW_RATING() {
		return REVIEW_RATING;
	}

	public void setREVIEW_RATING(Double rEVIEW_RATING) {
		REVIEW_RATING = rEVIEW_RATING;
	}

	public Date getREVIEW_DT() {
		return REVIEW_DT;
	}

	public void setREVIEW_DT(Date rEVIEW_DT) {
		REVIEW_DT = rEVIEW_DT;
	}

	public String getM_ID() {
		return M_ID;
	}

	public void setM_ID(String m_ID) {
		M_ID = m_ID;
	}

	public T_REVIEW(int rEVIEW_SEQ, int rEV_SEQ, String rEVIEW_CONTENT, Double rEVIEW_RATING, Date rEVIEW_DT,
			String m_ID) {
		super();
		REVIEW_SEQ = rEVIEW_SEQ;
		REV_SEQ = rEV_SEQ;
		REVIEW_CONTENT = rEVIEW_CONTENT;
		REVIEW_RATING = rEVIEW_RATING;
		REVIEW_DT = rEVIEW_DT;
		M_ID = m_ID;
	
    }


	
}