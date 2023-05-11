package zipsa.entity;

import java.sql.Date;

public class T_RESERVATION {
	// 집사 예약 현황

	public T_RESERVATION() {	}

	public T_RESERVATION(Double rEV_SEQ, String m_ID, Double jOB_SEQ, Date rEV_DT, String pET_YN, Double sTAFF_SEQ,
			String rEV_NOTE, Date rEG_DT) {
		super();
		REV_SEQ = rEV_SEQ;
		M_ID = m_ID;
		JOB_SEQ = jOB_SEQ;
		REV_DT = rEV_DT;
		PET_YN = pET_YN;
		STAFF_SEQ = sTAFF_SEQ;
		REV_NOTE = rEV_NOTE;
		REG_DT = rEG_DT;
	}

	public Double getREV_SEQ() {
		return REV_SEQ;
	}

	public void setREV_SEQ(Double rEV_SEQ) {
		REV_SEQ = rEV_SEQ;
	}

	public String getM_ID() {
		return M_ID;
	}

	public void setM_ID(String m_ID) {
		M_ID = m_ID;
	}

	public Double getJOB_SEQ() {
		return JOB_SEQ;
	}

	public void setJOB_SEQ(Double jOB_SEQ) {
		JOB_SEQ = jOB_SEQ;
	}

	public Date getREV_DT() {
		return REV_DT;
	}

	public void setREV_DT(Date rEV_DT) {
		REV_DT = rEV_DT;
	}

	public String getPET_YN() {
		return PET_YN;
	}

	public void setPET_YN(String pET_YN) {
		PET_YN = pET_YN;
	}

	public Double getSTAFF_SEQ() {
		return STAFF_SEQ;
	}

	public void setSTAFF_SEQ(Double sTAFF_SEQ) {
		STAFF_SEQ = sTAFF_SEQ;
	}

	public String getREV_NOTE() {
		return REV_NOTE;
	}

	public void setREV_NOTE(String rEV_NOTE) {
		REV_NOTE = rEV_NOTE;
	}

	public Date getREG_DT() {
		return REG_DT;
	}

	public void setREG_DT(Date rEG_DT) {
		REG_DT = rEG_DT;
	}

	// 예약 번호
	private Double REV_SEQ;

	// 회원 아이디
	private String M_ID;

	// 청소 순번
	private Double JOB_SEQ;

	// 예약 일자
	private Date REV_DT;

	// 펫유무
	private String PET_YN;

	// 직원번호
	private Double STAFF_SEQ;

	// 요청사항
	private String REV_NOTE;

	// 등록 일자
	private Date REG_DT;

	public Double getRevSeq() {
		return REV_SEQ;
	}

	public void setRevSeq(Double revSeq) {
		this.REV_SEQ = REV_SEQ;
	}

	public String getMId() {
		return M_ID;
	}

	public void setMId(String mId) {
		this.M_ID = M_ID;
	}

	public Double getJobSeq() {
		return JOB_SEQ;
	}

	public void setJobSeq(Double jobSeq) {
		this.JOB_SEQ = JOB_SEQ;
	}

	public Date getRevDt() {
		return REV_DT;
	}

	public void setRevDt(Date revDt) {
		this.REV_DT = REV_DT;
	}

	public String getPetYn() {
		return PET_YN;
	}

	public void setPetYn(String petYn) {
		this.PET_YN = PET_YN;
	}

	public Double getStaffSeq() {
		return STAFF_SEQ;
	}

	public void setStaffSeq(Double staffSeq) {
		this.STAFF_SEQ = STAFF_SEQ;
	}

	public String getRevNote() {
		return REV_NOTE;
	}

	public void setRevNote(String revNote) {
		this.REV_NOTE = REV_NOTE;
	}

	public Date getRegDt() {
		return REG_DT;
	}

	public void setRegDt(Date regDt) {
		this.REG_DT = REG_DT;
	}

}
