package zipsa.entity;

import java.util.Date;

public class T_MEMBER {
	// 회원 정보테이블
	
	// 회원 아이디
	private String M_id;
	// 회원 비밀번호
	private String M_pw;
	// 회원 이름
	private String M_name;
	// 회원 전화번호
	private String M_phone;
	// 회원 가입일자
	private Date M_joindate;
	// 회원 유형
	private String M_type;
	
	public T_MEMBER() {}


	public T_MEMBER(String m_id, String m_pw, String m_name, String m_phone, Date m_joindate, String m_type) {
		super();
		M_id = m_id;
		M_pw = m_pw;
		M_name = m_name;
		M_phone = m_phone;
		M_joindate = m_joindate;
		M_type = m_type;
	}



	public String getM_id() {
		return M_id;
	}

	public void setM_id(String m_id) {
		M_id = m_id;
	}

	public String getM_pw() {
		return M_pw;
	}

	public void setM_pw(String m_pw) {
		M_pw = m_pw;
	}

	public String getM_name() {
		return M_name;
	}

	public void setM_name(String m_name) {
		M_name = m_name;
	}

	public String getM_phone() {
		return M_phone;
	}

	public void setM_phone(String m_phone) {
		M_phone = m_phone;
	}

	public Date getM_joindate() {
		return M_joindate;
	}

	public void setM_joindate(Date m_joindate) {
		M_joindate = m_joindate;
	}

	public String getM_type() {
		return M_type;
	}

	public void setM_type(String m_type) {
		M_type = m_type;
	}

}

	