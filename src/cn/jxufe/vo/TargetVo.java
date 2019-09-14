package cn.jxufe.vo;

public class TargetVo {

	String employment;
	long count;
	public TargetVo( String employment, long count) {
		super();
		this.employment = employment;
		this.count = count;
	}
	public String getEmployment() {
		return employment;
	}
	public void setEmployment(String employment) {
		this.employment = employment;
	}
	
	public long getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
}
