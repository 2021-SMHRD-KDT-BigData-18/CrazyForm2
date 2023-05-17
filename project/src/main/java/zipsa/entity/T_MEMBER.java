package zipsa.entity;

import java.sql.Date;

public class T_MEMBER {
	// 회원 정보테이블

	// 회원 아이디
	private String M_ID;
	// 회원 비밀번호
	private String M_PW;
	// 회원 이름
	private String M_NAME;
	// 회원 전화번호
	private String M_PHONE;
	// 회원 가입일자
	private Date M_JOINDATE;
	// 회원 유형
	private String M_TYPE;

	public T_MEMBER() {
	}

	public T_MEMBER(String m_ID, String m_PW, String m_NAME, String m_PHONE, Date m_JOINDATE, String m_TYPE) {
		super();
		M_ID = m_ID;
		M_PW = m_PW;
		M_NAME = m_NAME;
		M_PHONE = m_PHONE;
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

}
