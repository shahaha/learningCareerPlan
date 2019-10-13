package cn.jxufe.vo;

import java.util.List;

import cn.jxufe.entity.Student;

public class TeacherVo {
	
	private String teacherName;
	private String className;
	private int studentCount;   //班级人数
	private int smallTargetCount; //已填写的班级人数
	private int teacherAuditCount; //教师已填写的评论人数
	private int targetFeedbackCount;  //学生填写的学期自评人数
	private int teacherCommentCount;  //教师已打分人数；
	private List<String> lackSmallTarget; //当前学期未填写小目标的列表
	private List<String> lackTeacherAudit; //当前学期教师为评论的列表
	private List<String> lackTargetFeedback; //当前学期未填写目标反馈的列表
	private List<String> lackTeacheComment; //当前学期教师未填写学生反馈成绩的列表
	
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public int getStudentCount() {
		return studentCount;
	}
	public void setStudentCount(int studentCount) {
		this.studentCount = studentCount;
	}
	public int getSmallTargetCount() {
		return smallTargetCount;
	}
	public void setSmallTargetCount(int smallTargetCount) {
		this.smallTargetCount = smallTargetCount;
	}
	public int getTeacherAuditCount() {
		return teacherAuditCount;
	}
	public void setTeacherAuditCount(int teacherAuditCount) {
		this.teacherAuditCount = teacherAuditCount;
	}
	public int getTargetFeedbackCount() {
		return targetFeedbackCount;
	}
	public void setTargetFeedbackCount(int targetFeedbackCount) {
		this.targetFeedbackCount = targetFeedbackCount;
	}
	public int getTeacherCommentCount() {
		return teacherCommentCount;
	}
	public void setTeacherCommentCount(int teacherCommentCount) {
		this.teacherCommentCount = teacherCommentCount;
	}
	public List<String> getLackSmallTarget() {
		return lackSmallTarget;
	}
	public void setLackSmallTarget(List<String> lackSmallTarget) {
		this.lackSmallTarget = lackSmallTarget;
	}
	public List<String> getLackTeacherAudit() {
		return lackTeacherAudit;
	}
	public void setLackTeacherAudit(List<String> lackTeacherAudit) {
		this.lackTeacherAudit = lackTeacherAudit;
	}
	public List<String> getLackTargetFeedback() {
		return lackTargetFeedback;
	}
	public void setLackTargetFeedback(List<String> lackTargetFeedback) {
		this.lackTargetFeedback = lackTargetFeedback;
	}
	public List<String> getLackTeacheComment() {
		return lackTeacheComment;
	}
	public void setLackTeacheComment(List<String> lackTeacheComment) {
		this.lackTeacheComment = lackTeacheComment;
	}
	
	@Override
	public String toString() {
		return "TeacherVo [teacherName=" + teacherName + ", className=" + className + ", studentCount=" + studentCount
				+ ", smallTargetCount=" + smallTargetCount + ", teacherAuditCount=" + teacherAuditCount
				+ ", targetFeedbackCount=" + targetFeedbackCount + ", teacherCommentCount=" + teacherCommentCount
				+ ", lackSmallTarget=" + lackSmallTarget + ", lackTeacherAudit=" + lackTeacherAudit
				+ ", lackTargetFeedback=" + lackTargetFeedback + ", lackTeacheComment=" + lackTeacheComment + "]";
	}
	
	
}
