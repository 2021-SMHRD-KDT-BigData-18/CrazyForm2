package zipsa.entity;

public class ZipsaMember {

	private String id;
	private String pw;
	private String name;
	private String tel;
	private String address;

	// 기본 생성자
	public ZipsaMember() {

	}

	public ZipsaMember(String id, String pw, String name, String tel, String address) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.tel = tel;
		this.address = address;
	}

	// getter / setter
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAdress() {
		return address;
	}

	public void setAdress(String adress) {
		this.address = adress;
	}

}
