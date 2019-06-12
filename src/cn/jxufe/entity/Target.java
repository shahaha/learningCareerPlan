package cn.jxufe.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import cn.jxufe.bean.EntityID;

/**
 * 目标类
 * @author me
 */
@Table(name="t_target")
@Entity
public class Target extends EntityID{
	/**
	 * 
	 */
	private static final long serialVersionUID = -3878061320451267241L;
	/**
	 * 目标描述（考研、考公、就业、创业...）
	 */
	private String targetCaption;
	
	/**
	 * 普通无参构造函数
	 */
	public Target() {}
	/**
	 * 带String类型的id的构造函数，setId时要把id转成Long型
	 * @param id 前台传来的String类型的id
	 */
	public Target(String id) {
		setId(Long.valueOf(id));
	}
	public String getTargetCaption() {
		return targetCaption;
	}

	public void setTargetCaption(String targetCaption) {
		this.targetCaption = targetCaption;
	}
	@Override
	public String toString() {
		return "Target [targetCaption=" + targetCaption + "]";
	}
	
}
