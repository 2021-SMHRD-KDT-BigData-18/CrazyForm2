package zipsa.entity;

public class T_STAFF {

	public T_STAFF() {	}
	// 집사 직원



	public T_STAFF(Double sTAFF_SEQ, String sTAFF_NAME, String sTAFF_PHONE, String aLLERGY_YN) {
		super();
		STAFF_SEQ = sTAFF_SEQ;
		STAFF_NAME = sTAFF_NAME;
		STAFF_PHONE = sTAFF_PHONE;
		ALLERGY_YN = aLLERGY_YN;
	}
	
	public Double getSTAFF_SEQ() {
		return STAFF_SEQ;
	}
	
	public void setSTAFF_SEQ(Double sTAFF_SEQ) {
		STAFF_SEQ = sTAFF_SEQ;
	}

	public String getSTAFF_NAME() {
		return STAFF_NAME;
	}

	public void setSTAFF_NAME(String sTAFF_NAME) {
		STAFF_NAME = sTAFF_NAME;
	}

	public String getSTAFF_PHONE() {
		return STAFF_PHONE;
	}

	public void setSTAFF_PHONE(String sTAFF_PHONE) {
		STAFF_PHONE = sTAFF_PHONE;
	}

	public String getALLERGY_YN() {
		return ALLERGY_YN;
	}

	public void setALLERGY_YN(String aLLERGY_YN) {
		ALLERGY_YN = aLLERGY_YN;
	}

	// 직원 번호
	private Double STAFF_SEQ;

	// 직원 이름
	private String STAFF_NAME;

	// 직원 연락처
	private String STAFF_PHONE;

	// 직원 알러지유무
	private String ALLERGY_YN;

	public Double getStaffSeq() {
		return STAFF_SEQ;
	}

	public void setStaffSeq(Double staffSeq) {
		this.STAFF_SEQ = STAFF_SEQ;
	}

	public String getStaffName() {
		return STAFF_NAME;
	}

	public void setStaffName(String staffName) {
		this.STAFF_NAME = STAFF_NAME;
	}

	public String getStaffPhone() {
		return STAFF_PHONE;
	}

	public void setStaffPhone(String staffPhone) {
		this.STAFF_PHONE = STAFF_PHONE;
	}

	public String getAllergyYn() {
		return ALLERGY_YN;
	}

	public void setAllergyYn(String allergyYn) {
		this.ALLERGY_YN = ALLERGY_YN;
	}

}
