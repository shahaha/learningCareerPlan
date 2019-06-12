package cn.jxufe.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import cn.jxufe.bean.EntityID;

/**
 * 专业类  
 * @author me
 */
@Table(name="t_profession")
@Entity
public class Profession extends EntityID{
	/**
	 * 
	 */
	private static final long serialVersionUID = 4862195545206243429L;
	/**
	 * 专业名称
	 */
	private String profsName;
	
	/**
	 * 普通无参构造函数
	 */
	public Profession() {}
	/**
	 * 带String类型的id的构造函数，setId时要把id转成Long型
	 * @param id 前台传来的String类型的id
	 */
	public Profession(String id) {
		setId(Long.valueOf(id));
	}
	public String getProfsName() {
		return profsName;
	}

	public void setProfsName(String profsName) {
		this.profsName = profsName;
	}
	@Override
	public String toString() {
		return "Profession [profsName=" + profsName + "]";
	}
	
}
