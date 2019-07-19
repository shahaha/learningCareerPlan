package cn.jxufe.entity;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import cn.jxufe.bean.EntityID;

/**
 * 学期类
 * @author me
 */
@Table(name="t_trem")
@Entity
public class Trem extends EntityID{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4067128589255974255L;
	/**
	 * 学期号
	 */
	private Integer semester;
	/**
	 * 学生每个学期的小目标
	 */
	private String smallTarget;
	/**
	 * 老师对小目标的审核结果
	 */
	private String teacherAudit;
	/**
	 * 学生学期末对小目标执行情况的反馈
	 */
	private String targetFeedback;
	/**
	 * 老师对反馈的评语及建议
	 */
	private String teacherComment;
	/**
	 * 老师对学生本学期的打分
	 */
	private Integer score;
	/**
	 * 多每个学期对应一个学生
	 * 每个修学正常的学生都有七个学期
	 */
	@ManyToOne
	@JoinColumn(name = "stuId")
	private Student student;
	
	public Integer getSemester() {
		return semester;
	}
	public void setSemester(Integer semester) {
		this.semester = semester;
	}
	public String getSmallTarget() {
		return smallTarget;
	}
	public void setSmallTarget(String smallTarget) {
		this.smallTarget = smallTarget;
	}
	public String getTeacherAudit() {
		return teacherAudit;
	}
	public void setTeacherAudit(String teacherAudit) {
		this.teacherAudit = teacherAudit;
	}
	public String getTargetFeedback() {
		return targetFeedback;
	}
	public void setTargetFeedback(String targetFeedback) {
		this.targetFeedback = targetFeedback;
	}
	public String getTeacherComment() {
		return teacherComment;
	}
	public void setTeacherComment(String teacherComment) {
		this.teacherComment = teacherComment;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	/**
	 * 判断该学期有没有结束
	 * @return true 已结束 false 未结束
	 */
	@Transient
	public Boolean isEnd() {
		if ((this.teacherComment != null && !("".equals(this.teacherComment))) || this.score != null) {
			return true;
		}
		return false;
	}
	
	@Override
	public String toString() {
		return "Trem [semester=" + semester + ", smallTarget=" + smallTarget + ", teacherAudit=" + teacherAudit
				+ ", targetFeedback=" + targetFeedback + ", teacherComment=" + teacherComment + ", score=" + score
				+ "]";
	}
	
}
