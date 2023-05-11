package zipsa.entity;

import java.util.Date;

public class T_REVIEW {

	public T_REVIEW() {

	}

	// 고객 리뷰

	public Double getREVIEW_SEQ() {
		return REVIEW_SEQ;
	}

	public void setREVIEW_SEQ(Double rEVIEW_SEQ) {
		REVIEW_SEQ = rEVIEW_SEQ;
	}

	public Double getREV_SEQ() {
		return REV_SEQ;
	}

	public void setREV_SEQ(Double rEV_SEQ) {
		REV_SEQ = rEV_SEQ;
	}

	public String getREVIEW_CONTENT() {
		return REVIEW_CONTENT;
	}

	public void setREVIEW_CONTENT(String rEVIEW_CONTENT) {
		REVIEW_CONTENT = rEVIEW_CONTENT;
	}

	public String getREVIEW_IMG() {
		return REVIEW_IMG;
	}

	public void setREVIEW_IMG(String rEVIEW_IMG) {
		REVIEW_IMG = rEVIEW_IMG;
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

	// 리뷰 순번
	private Double REVIEW_SEQ;

	// 예약 번호
	private Double REV_SEQ;

	// 리뷰 내용
	private String REVIEW_CONTENT;

	// 리뷰 사진
	private String REVIEW_IMG;

	// 리뷰 별점
	private Double REVIEW_RATING;

	// 리뷰 날짜
	private Date REVIEW_DT;

	// 리뷰 작성자
	private String M_ID;

	public Double getReviewSeq() {
		return REVIEW_SEQ;
	}

	public void setReviewSeq(Double reviewSeq) {
		this.REVIEW_SEQ = REVIEW_SEQ;
	}

	public Double getRevSeq() {
		return REV_SEQ;
	}

	public void setRevSeq(Double revSeq) {
		this.REV_SEQ = REV_SEQ;
	}

	public String getReviewContent() {
		return REVIEW_CONTENT;
	}

	public void setReviewContent(String reviewContent) {
		this.REVIEW_CONTENT = REVIEW_CONTENT;
	}

	public String getReviewImg() {
		return REVIEW_IMG;
	}

	public void setReviewImg(String reviewImg) {
		this.REVIEW_IMG = REVIEW_IMG;
	}

	public Double getReviewRating() {
		return REVIEW_RATING;
	}

	public void setReviewRating(Double reviewRating) {
		this.REVIEW_RATING = REVIEW_RATING;
	}

	public Date getReviewDt() {
		return REVIEW_DT;
	}

	public void setReviewDt(Date reviewDt) {
		this.REVIEW_DT = REVIEW_DT;
	}

	public String getMId() {
		return M_ID;
	}

	public void setMId(String mId) {
		this.M_ID = M_ID;
	}

	// T_REVIEW 모델 복사
	public void CopyData(T_REVIEW param) {
		this.REVIEW_SEQ = param.getReviewSeq();
		this.REV_SEQ = param.getRevSeq();
		this.REVIEW_CONTENT = param.getReviewContent();
		this.REVIEW_IMG = param.getReviewImg();
		this.REVIEW_RATING = param.getReviewRating();
		this.REVIEW_DT = param.getReviewDt();
		this.M_ID = param.getMId();
	}

}
