package cn.jxufe.vo;

import cn.jxufe.entity.Student;
import cn.jxufe.entity.User;


/**
 * 管理界面学生填写情况的相关信息
 */
public class StudentVo {
 
	private Student student;
	
	private String account;
	
	
	private String name;
	
	private boolean stuSex;

	//小目标填写数量
	private int smallTargetCount;
	
	//目标反馈数量
	private int targetFeedbackCount;
	
	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}


	public int getSmallTargetCount() {
		return smallTargetCount;
	}

	public void setSmallTargetCount(int smallTargetCount) {
		this.smallTargetCount = smallTargetCount;
	}

	public int getTargetFeedbackCount() {
		return targetFeedbackCount;
	}

	public void setTargetFeedbackCount(int taegetFeedbackCount) {
		this.targetFeedbackCount = taegetFeedbackCount;
	}

	@Override
	public String toString() {
		return "StudentVo [student=" + student + ", smallTargetCount=" + smallTargetCount + ", targetFeedbackCount="
				+ targetFeedbackCount + "]";
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean isStuSex() {
		return stuSex;
	}

	public void setStuSex(boolean stuSex) {
		this.stuSex = stuSex;
	}

	

}
