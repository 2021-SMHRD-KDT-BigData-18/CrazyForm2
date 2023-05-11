package zipsa.entity;

import java.util.Date;

public class T_HOLIDAY {

	public T_HOLIDAY() {

	}

	// 집사직원 휴무일

	public Double getHOLI_SEQ() {
		return HOLI_SEQ;
	}

	public void setHOLI_SEQ(Double hOLI_SEQ) {
		HOLI_SEQ = hOLI_SEQ;
	}

	public Double getSTAFF_SEQ() {
		return STAFF_SEQ;
	}

	public void setSTAFF_SEQ(Double sTAFF_SEQ) {
		STAFF_SEQ = sTAFF_SEQ;
	}

	public Date getHOLI_DT() {
		return HOLI_DT;
	}

	public void setHOLI_DT(Date hOLI_DT) {
		HOLI_DT = hOLI_DT;
	}

	// 휴무 순번
	private Double HOLI_SEQ;

	// 직원 번호
	private Double STAFF_SEQ;

	// 휴무 날짜
	private Date HOLI_DT;

	public Double getHoliSeq() {
		return HOLI_SEQ;
	}

	public void setHoliSeq(Double holiSeq) {
		this.HOLI_SEQ = HOLI_SEQ;
	}

	public Double getStaffSeq() {
		return STAFF_SEQ;
	}

	public void setStaffSeq(Double staffSeq) {
		this.STAFF_SEQ = STAFF_SEQ;
	}

	public Date getHoliDt() {
		return HOLI_DT;
	}

	public void setHoliDt(Date holiDt) {
		this.HOLI_DT = HOLI_DT;
	}

	// T_HOLIDAY 모델 복사
	public void CopyData(T_HOLIDAY param) {
		this.HOLI_SEQ = param.getHoliSeq();
		this.STAFF_SEQ = param.getStaffSeq();
		this.HOLI_DT = param.getHoliDt();
	}

}
