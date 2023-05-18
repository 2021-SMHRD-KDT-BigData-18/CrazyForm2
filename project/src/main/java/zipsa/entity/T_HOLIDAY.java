package zipsa.entity;

import java.util.Date;

public class T_HOLIDAY {
	// 집사직원 휴무일
	
	public T_HOLIDAY() {	}
	
	
	// 휴무 순번
	private int HOLI_SEQ;
	
	// 직원 번호
	private int STAFF_SEQ;
	// 휴무 날짜
	private Date HOLI_DT;
	
	
	public int getHOLI_SEQ() {
		return HOLI_SEQ;
	}
	public void setHOLI_SEQ(int hOLI_SEQ) {
		HOLI_SEQ = hOLI_SEQ;
	}
	public int getSTAFF_SEQ() {
		return STAFF_SEQ;
	}
	public void setSTAFF_SEQ(int sTAFF_SEQ) {
		STAFF_SEQ = sTAFF_SEQ;
	}
	public Date getHOLI_DT() {
		return HOLI_DT;
	}
	public void setHOLI_DT(Date hOLI_DT) {
		HOLI_DT = hOLI_DT;
	}
	public T_HOLIDAY(int hOLI_SEQ, int sTAFF_SEQ, Date hOLI_DT) {
		super();
		HOLI_SEQ = hOLI_SEQ;
		STAFF_SEQ = sTAFF_SEQ;
		HOLI_DT = hOLI_DT;
	}
	
	
	
	
}
