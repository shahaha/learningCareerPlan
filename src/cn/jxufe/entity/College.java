package cn.jxufe.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import cn.jxufe.bean.EntityID;

/**
 * 大学类  
 * @author me
 */
@Table(name="t_college")
@Entity
public class College extends EntityID{
	/**
	 * 
	 */
	private static final long serialVersionUID = -2898027353461363564L;
	/**
	 * 大学名称
	 */
	private String collegeName;
	
	/**
	 * 普通无参构造函数
	 */
	public College() {}
	/**
	 * 带String类型的id的构造函数，setId时要把id转成Long型
	 * @param id 前台传来的String类型的id
	 */
	public College(String id) {
		setId(Long.valueOf(id));
	}
	
	public String getCollegeName() {
		return collegeName;
	}

	public void setCollegeName(String collegeName) {
		this.collegeName = collegeName;
	}
	@Override
	public String toString() {
		return "College [collegeName=" + collegeName + "]";
	}
	
	
	
}
