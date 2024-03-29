package cn.jxufe.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import cn.jxufe.bean.EntityID;

/**
 * 角色类
 * @author me
 */
@Table(name="t_role")
@Entity
public class Role extends EntityID{
	
	//public static final Role STUDENT = 

	/**
	 * 
	 */
	private static final long serialVersionUID = -7443727733139180120L;
	/**
	 * 角色名
	 */
	private String role;
	/**
	 * 一个角色都对应了多个用户
	 * joinColumns 用来指定中间表中关联自己ID的字段 inverseJoinColumns 用来指定中间表中关联对方ID的字段
	 */
	@JsonIgnore
	@ManyToMany(mappedBy = "roles")
	private Set<User> users = new HashSet<User>();
	
	/**
	 * 普通无参构造函数
	 */
	public Role() {}
	/**
	 * 带String类型的id的构造函数，setId时要把id转成Long型
	 * @param id 前台传来的String类型的id
	 */
	public Role(String id) {
		setId(Long.valueOf(id));
	}
	
	
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public Set<User> getUsers() {
		return users;
	}
	public void setUsers(Set<User> users) {
		this.users = users;
	}
	@Override
	public String toString() {
		return "Role [role=" + role + "]";
	}
}
