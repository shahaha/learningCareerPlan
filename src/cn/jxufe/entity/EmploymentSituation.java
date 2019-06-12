package cn.jxufe.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import cn.jxufe.bean.EntityID;

/**
 * 毕业后实际就业情况类 
 * @author me
 */
@Table(name="t_employmentSituation")
@Entity
public class EmploymentSituation extends EntityID{
	/**
	 * 
	 */
	private static final long serialVersionUID = -9144482900492711794L;
	/**
	 * 实际职业
	 */
	private String employment;

	public String getEmployment() {
		return employment;
	}

	public void setEmployment(String employment) {
		this.employment = employment;
	}

	@Override
	public String toString() {
		return "EmploymentSituation [employment=" + employment + "]";
	}
	
}
