package cn.jxufe.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import cn.jxufe.bean.EntityID;

/**
 * 班级类
 * 
 * @author me
 */
@Table(name = "t_class")
@Entity
public class Classes extends EntityID {
	/**
	 * 
	 */
	private static final long serialVersionUID = 8727328353924574043L;
	/**
	 * 班级名称
	 */
	@Column(name="name")
	private String name;
	/**
	 * 所属专业
	 */
	@ManyToOne
	@JoinColumn(name = "profsId")
	private Profession profession;
	/**
	 * 年级 因为不存在单纯的Year类型，而用Data类型代替会因为字段长度问题导致不能保存
	 * 所以用String来存储Year类型，而且在数据库中Year类型也是字符串或整型
	 */

	// @DateTimeFormat(pattern = "yyyy")
	@Column(name="grade")
	private String grade;
	/**
	 * 该班班主任
	 */
	@ManyToOne
	@JoinColumn(name = "headmasterId")
	private User teacher;

	/**
	 * 普通无参构造函数
	 */
	public Classes() {
	}

	/**
	 * 带String类型的id的构造函数，setId时要把id转成Long型
	 * 
	 * @param id
	 *            前台传来的String类型的id
	 */
	public Classes(String id) {
		setId(Long.valueOf(id));
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

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

	public User getTeacher() {
		return teacher;
	}

	public void setTeacher(User teacher) {
		this.teacher = teacher;
	}

	@Override
	public String toString() {
		return "Classes [name=" + name + ", profession=" + profession + ", grade=" + grade + ", teacher=" + teacher
				+ "]";
	}

}
