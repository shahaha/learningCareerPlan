package cn.jxufe.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import cn.jxufe.bean.EntityID;

/**
 * 家庭经济情况类 
 * @author me
 */
@Table(name="t_economy")
@Entity
public class Economy extends EntityID{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5698785384567973455L;
	/**
	 * 情况描述（贫困、一般、富裕...）
	 */
	private String economyState;
	
	/**
	 * 普通无参构造函数
	 */
	public Economy() {}
	/**
	 * 带String类型的id的构造函数，setId时要把id转成Long型
	 * @param id 前台传来的String类型的id
	 */
	public Economy(String id) {
		setId(Long.valueOf(id));
	}
	public String getEconomyState() {
		return economyState;
	}

	public void setEconomyState(String economyState) {
		this.economyState = economyState;
	}
	@Override
	public String toString() {
		return "Economy [economyState=" + economyState + "]";
	}
	
}
