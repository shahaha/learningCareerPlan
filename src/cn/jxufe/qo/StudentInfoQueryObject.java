package cn.jxufe.qo;

import java.time.Year;

import cn.jxufe.entity.Classes;


public class StudentInfoQueryObject {
   
	/**
	 * 查询年级
	 */
	private String grade;
	
	/**
	 * 查询班级
	 */
	private Classes classes;
	
	/**
	 * 查询个人
	 */
	private String account;
	
	public String getAccount() {
		return account;
	}


	public void setAccount(String account) {
		this.account = account;
	}


	public Classes getClasses() {
		return classes;
	}


	public void setClasses(Classes classes) {
		this.classes = classes;
	}
	
	public String getGrade() {
		return grade;
	}


	public void setGrade(String grade) {
		this.grade = grade;
	}


}
