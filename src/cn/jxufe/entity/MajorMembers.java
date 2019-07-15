package cn.jxufe.entity;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import cn.jxufe.bean.EntityID;

/**
 * 家庭主要成员类 
 * @author me
 */
@Table(name="t_majorMembers")
@Entity
public class MajorMembers extends EntityID{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5003501984301097802L;
	/**
	 * 与该成员相关联的学生
	 */
	@ManyToOne
	@JoinColumn(name = "stuId")
	@JsonManagedReference
	private Student student;
	/**
	 * 成员姓名
	 */
	private String membersName;
	/**
	 * 与学生的关系
	 */
	private String membersRelationship;
	/**
	 * 成员工作
	 */
	private String membersJob;
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public String getMembersName() {
		return membersName;
	}
	public void setMembersName(String membersName) {
		this.membersName = membersName;
	}
	public String getMembersRelationship() {
		return membersRelationship;
	}
	public void setMembersRelationship(String membersRelationship) {
		this.membersRelationship = membersRelationship;
	}
	public String getMembersJob() {
		return membersJob;
	}
	public void setMembersJob(String membersJob) {
		this.membersJob = membersJob;
	}
	@Override
	public String toString() {
		return "MajorMembers [membersName=" + membersName + ", membersRelationship=" + membersRelationship
				+ ", membersJob=" + membersJob + "]";
	}
	
	
	
}
