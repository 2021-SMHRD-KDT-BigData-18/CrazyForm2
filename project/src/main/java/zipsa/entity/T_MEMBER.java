package zipsa.entity;

import java.util.Date;

public class T_MEMBER {
	
	// 고객 정보
	public T_MEMBER() {	}
	
	public T_MEMBER(String m_ID, String m_PW, String m_NAME, String m_PHONE, String m_ADDR, Date m_JOINDATE,
			String m_TYPE) {
		super();
		M_ID = m_ID;
		M_PW = m_PW;
		M_NAME = m_NAME;
		M_PHONE = m_PHONE;
		M_ADDR = m_ADDR;
		M_JOINDATE = m_JOINDATE;
		M_TYPE = m_TYPE;
	}


	public String getM_ID() {
		return M_ID;
	}

	public void setM_ID(String m_ID) {
		M_ID = m_ID;
	}

	public String getM_PW() {
		return M_PW;
	}

	public void setM_PW(String m_PW) {
		M_PW = m_PW;
	}

	public String getM_NAME() {
		return M_NAME;
	}

	public void setM_NAME(String m_NAME) {
		M_NAME = m_NAME;
	}

	public String getM_PHONE() {
		return M_PHONE;
	}

	public void setM_PHONE(String m_PHONE) {
		M_PHONE = m_PHONE;
	}

	public String getM_ADDR() {
		return M_ADDR;
	}

	public void setM_ADDR(String m_ADDR) {
		M_ADDR = m_ADDR;
	}

	public Date getM_JOINDATE() {
		return M_JOINDATE;
	}

	public void setM_JOINDATE(Date m_JOINDATE) {
		M_JOINDATE = m_JOINDATE;
	}

	public String getM_TYPE() {
		return M_TYPE;
	}

	public void setM_TYPE(String m_TYPE) {
		M_TYPE = m_TYPE;
	}

	// 회원 아이디
	private String M_ID;

	// 회원 비밀번호
	private String M_PW;

	// 회원 이름
	private String M_NAME;

	// 회원 전화번호
	private String M_PHONE;

	// 회원 주소
	private String M_ADDR;

	// 회원 가입일자
	private Date M_JOINDATE;

	// 회원 유형
	private String M_TYPE;

	public String getMId() {
		return M_ID;
	}

	public void setMId(String mId) {
		this.M_ID = M_ID;
	}

	public String getMPw() {
		return M_PW;
	}

	public void setMPw(String mPw) {
		this.M_PW = M_PW;
	}

	public String getMName() {
		return M_NAME;
	}

	public void setMName(String mName) {
		this.M_NAME = M_NAME;
	}

	public String getMPhone() {
		return M_PHONE;
	}

	public void setMPhone(String mPhone) {
		this.M_PHONE = M_PHONE;
	}

	public String getMAddr() {
		return M_ADDR;
	}

	public void setMAddr(String mAddr) {
		this.M_ADDR = M_ADDR;
	}

	public Date getMJoindate() {
		return M_JOINDATE;
	}

	public void setMJoindate(Date mJoindate) {
		this.M_JOINDATE = M_JOINDATE;
	}

	public String getMType() {
		return M_TYPE;
	}

	public void setMType(String mType) {
		this.M_TYPE = M_TYPE;
	}



}
