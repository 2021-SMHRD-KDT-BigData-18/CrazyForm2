package zipsa.entity;

import java.util.Date;

public class ZipsaReservation {
	
	private int 예약번호;
	private String id;
	private int 청소번호;
	private Date 예약일자;
	private String 펫유무;
	private int 직원번호;
	private String 요청사항;
	
	public ZipsaReservation() {}
	
	public ZipsaReservation(int 예약번호, String id, int 청소번호, Date 예약일자, String 펫유무, int 직원번호, String 요청사항) {
		super();
		this.예약번호 = 예약번호;
		this.id = id;
		this.청소번호 = 청소번호;
		this.예약일자 = 예약일자;
		this.펫유무 = 펫유무;
		this.직원번호 = 직원번호;
		this.요청사항 = 요청사항;
	}
	public int get예약번호() {
		return 예약번호;
	}
	public void set예약번호(int 예약번호) {
		this.예약번호 = 예약번호;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int get청소번호() {
		return 청소번호;
	}
	public void set청소번호(int 청소번호) {
		this.청소번호 = 청소번호;
	}
	public Date get예약일자() {
		return 예약일자;
	}
	public void set예약일자(Date 예약일자) {
		this.예약일자 = 예약일자;
	}
	public String get펫유무() {
		return 펫유무;
	}
	public void set펫유무(String 펫유무) {
		this.펫유무 = 펫유무;
	}
	public int get직원번호() {
		return 직원번호;
	}
	public void set직원번호(int 직원번호) {
		this.직원번호 = 직원번호;
	}
	public String get요청사항() {
		return 요청사항;
	}
	public void set요청사항(String 요청사항) {
		this.요청사항 = 요청사항;
	}
	
	
	
	
	
	
	
	
	

}
