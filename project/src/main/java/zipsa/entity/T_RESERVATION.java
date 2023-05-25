package zipsa.entity;

import java.util.Date;

public class T_RESERVATION {
	// 집사 예약 현황
	public T_RESERVATION() {	}

	// 회원 아이디
	private String M_ID;
	// 청소 내용
	private String JOB_T;
	// 예약 일자
	private Date REV_DT;
	// 펫유무
	private String PET_YN;
	// 직원번호
	private int STAFF_SEQ;
	// 요청사항
	private String REV_NOTE;
	// 회원 주소
	private String M_ADDR;
	// 직원 이름
	private String STAFF_NAME;
	// 예약 번호
	private int REV_SEQ;
	
	private Date HOLI_DT;
	
	
	


	public T_RESERVATION(String m_ID, String jOB_T, Date rEV_DT, String pET_YN, int sTAFF_SEQ, String rEV_NOTE,
			String m_ADDR, String sTAFF_NAME, int rEV_SEQ, Date hOLI_DT) {
		super();
		M_ID = m_ID;
		JOB_T = jOB_T;
		REV_DT = rEV_DT;
		PET_YN = pET_YN;
		STAFF_SEQ = sTAFF_SEQ;
		REV_NOTE = rEV_NOTE;
		M_ADDR = m_ADDR;
		STAFF_NAME = sTAFF_NAME;
		REV_SEQ = rEV_SEQ;
		HOLI_DT = hOLI_DT;
	}

	public T_RESERVATION(String m_ID, String jOB_T, Date rEV_DT, String pET_YN, int sTAFF_SEQ, String rEV_NOTE,
			String m_ADDR, int rEV_SEQ) {
		super();
		M_ID = m_ID;
		JOB_T = jOB_T;
		REV_DT = rEV_DT;
		PET_YN = pET_YN;
		STAFF_SEQ = sTAFF_SEQ;
		REV_NOTE = rEV_NOTE;
		M_ADDR = m_ADDR;
		REV_SEQ = rEV_SEQ;
	}
	
	//직원이름 연동된 뷰에서 보는 화면
	public T_RESERVATION(String m_ID, String jOB_T, Date rEV_DT, String pET_YN, int sTAFF_SEQ, String rEV_NOTE,
			String m_ADDR, String sTAFF_NAME, int rEV_SEQ) {
		super();
		M_ID = m_ID;
		JOB_T = jOB_T;
		REV_DT = rEV_DT;
		PET_YN = pET_YN;
		STAFF_SEQ = sTAFF_SEQ;
		REV_NOTE = rEV_NOTE;
		M_ADDR = m_ADDR;
		STAFF_NAME = sTAFF_NAME;
		REV_SEQ = rEV_SEQ;
	}

	public String getM_ID() {
		return M_ID;
	}

	public void setM_ID(String m_ID) {
		M_ID = m_ID;
	}

	public String getJOB_T() {
		return JOB_T;
	}

	public void setJOB_T(String jOB_T) {
		JOB_T = jOB_T;
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

	public int getSTAFF_SEQ() {
		return STAFF_SEQ;
	}

	public void setSTAFF_SEQ(int sTAFF_SEQ) {
		STAFF_SEQ = sTAFF_SEQ;
	}

	public String getREV_NOTE() {
		return REV_NOTE;
	}

	public void setREV_NOTE(String rEV_NOTE) {
		REV_NOTE = rEV_NOTE;
	}

	public String getM_ADDR() {
		return M_ADDR;
	}

	public void setM_ADDR(String m_ADDR) {
		M_ADDR = m_ADDR;
	}

	public String getSTAFF_NAME() {
		return STAFF_NAME;
	}

	public void setSTAFF_NAME(String sTAFF_NAME) {
		STAFF_NAME = sTAFF_NAME;
	}

	public int getREV_SEQ() {
		return REV_SEQ;
	}

	public void setREV_SEQ(int rEV_SEQ) {
		REV_SEQ = rEV_SEQ;
	}
	
	public Date getHOLI_DT() {
		return HOLI_DT;
	}

	public void setHOLI_DT(Date hOLI_DT) {
		HOLI_DT = hOLI_DT;
	}
	
}