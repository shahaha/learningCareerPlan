package cn.jxufe.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import cn.jxufe.bean.EntityID;

/**
 * 用户类
 * @author me
 */
@Table(name="t_user")
@Entity
@Inheritance(strategy=InheritanceType.JOINED)
public class User extends EntityID{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5733155952405323542L;
	/**
	 * 账号
	 */
	private String account;
	/**
	 * 密码
	 */
	private String password;
	/**
	 * 姓名
	 */
	private String name;
	/**
	 * 一个用户都对应了多个角色
	 * joinColumns 用来指定中间表中关联自己ID的字段 inverseJoinColumns 用来指定中间表中关联对方ID的字段
	 */
	@ManyToMany(cascade = CascadeType.PERSIST, fetch = FetchType.EAGER)
	@JoinTable(name="user_role",joinColumns=@JoinColumn(name="userId"),inverseJoinColumns=@JoinColumn(name="roleId"))
	private Set<Role> roles = new HashSet<Role>();
	
	
	/**
	 * 普通无参构造函数
	 */
	public User() {
		
		
	}
	/**
	 * 带String类型的id的构造函数，setId时要把id转成Long型
	 * @param id 前台传来的String类型的id
	 */
	public User(String id) {
		setId(Long.valueOf(id));
	}
	
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Set<Role> getRoles() {
		return roles;
	}
	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}
	@Override
	public String toString() {
		return "User [account=" + account + ", password=" + password + ", name=" + name + ", roles=" + roles + "]";
	}
	
}
