package zipsa.entity;

public class T_JOB {

	public T_JOB() {

	}

	// 집사 청소 분류

	public Double getJOB_SEQ() {
		return JOB_SEQ;
	}

	public void setJOB_SEQ(Double jOB_SEQ) {
		JOB_SEQ = jOB_SEQ;
	}

	public String getJOB_T() {
		return JOB_T;
	}

	public void setJOB_T(String jOB_T) {
		JOB_T = jOB_T;
	}

	// 청소 순번
	private Double JOB_SEQ;

	// 청소 내용
	private String JOB_T;

	public Double getJobSeq() {
		return JOB_SEQ;
	}

	public void setJobSeq(Double jobSeq) {
		this.JOB_SEQ = JOB_SEQ;
	}

	public String getJobT() {
		return JOB_T;
	}

	public void setJobT(String jobT) {
		this.JOB_T = JOB_T;
	}

	// T_JOB 모델 복사
	public void CopyData(T_JOB param) {
		this.JOB_SEQ = param.getJobSeq();
		this.JOB_T = param.getJobT();
	}

}
