package cn.jxufe.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import cn.jxufe.bean.EntityID;

@Table(name = "t_state")
@Entity
public class State extends EntityID {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 状态描述
	 */
	private String stateDes;

	/**
	 * 普通无参构造函数
	 */
	public State() {}
	/**
	 * 带String类型的id的构造函数，setId时要把id转成Long型
	 * @param id 前台传来的String类型的id
	 */
	public State(String id) {
		setId(Long.valueOf(id));
	}
	public String getStateDes() {
		return stateDes;
	}

	public void setStateDes(String stateDes) {
		this.stateDes = stateDes;
	}
	@Override
	public String toString() {
		return "State [stateDes=" + stateDes + "]";
	}
	
}
