package cn.jxufe.qo;

import cn.jxufe.entity.Classes;
import cn.jxufe.entity.Profession;

public class TeacherInfoQueryObject {
	
	/**
	 * 查询专业
	 */
	private Profession profession;
	
	/**
	 * 查询年级
	 */
	private String grade;
	

	/**
	 * 查询班级
	 */
	private Classes classes;
	

	public Profession getProfession() {
		return profession;
	}

	public void setProfession(Profession profession) {
		this.profession = profession;
	}
   
	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}
	

	public Classes getClasses() {
		return classes;
	}

	public void setClasses(Classes classes) {
		this.classes = classes;
	}
	
	@Override
	public String toString() {
		return "TeacherInfoQueryObject [profession=" + profession + ", grade=" + grade + ", classes=" + classes + "]";
	}
	

}
