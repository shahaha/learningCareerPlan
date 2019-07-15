package cn.jxufe.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;



/**
 * 学生类，存储学生基本信息
 * 该类继承了User类
 * @author me
 */
@Table(name="t_student")
@Entity
public class Student extends User{
	/**
	 * 
	 */
	private static final long serialVersionUID = -6976433406698998544L;
	/**
	 * 性别（1表示男，0表示女）
	 */
	private Boolean stuSex;
	/**
	 * 生日
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd")
	private Date stuBirthday;
	/**
	 * 生源地
	 */
	private String stuOrgin;
	/**
	 * 户籍（1表示城镇户口，0表示农村户口）
	 */
	private Boolean registeredResidence;
	/**
	 * 毕业后的职业理想
	 */
	private String stuIdeal;
	/**
	 * 家庭经济情况
	 */
	@ManyToOne
	@JoinColumn(name = "economyId")
	private Economy economy;
	/**
	 * 毕业后目标
	 */
	@ManyToOne
	@JoinColumn(name = "targetId")
	private Target target;
	/**
	 * 毕业后实际职业情况
	 */
	@ManyToOne
	@JoinColumn(name = "employmentId")
	private Target employment;
	/**
	 * 所在班级
	 */
	@ManyToOne
	@JoinColumn(name = "classId")
	private Classes classes;
	/**
	 * 所在大学
	 */
	@ManyToOne
	@JoinColumn(name = "collegeId")
	private College college;
	/**
	 * 该生的主要家庭成员
	 */
	@OneToMany(mappedBy="student",cascade = {CascadeType.MERGE},fetch = FetchType.EAGER)
	@JsonBackReference
	private Set<MajorMembers> members = new HashSet<MajorMembers>();
	/**
	 * 该生各个学期信息
	 */
	@OneToMany(mappedBy="student",cascade = {CascadeType.REMOVE,CascadeType.PERSIST}, fetch = FetchType.EAGER)
	@JsonIgnore
	private Set<Trem> trems = new HashSet<Trem>();
	
	public Student() {};
	
	public Student(String id) {
		setId(Long.valueOf(id));
	};
	
	public Boolean getStuSex() {
		return stuSex;
	}
	public void setStuSex(Boolean stuSex) {
		this.stuSex = stuSex;
	}
	public Date getStuBirthday() {
		System.err.println("getter:" + stuBirthday);
		return stuBirthday;
	}
	public void setStuBirthday(Date stuBirthday) {
		System.err.println("setter:" + stuBirthday);
		this.stuBirthday = stuBirthday;
	}
	public String getStuOrgin() {
		return stuOrgin;
	}
	public void setStuOrgin(String stuOrgin) {
		this.stuOrgin = stuOrgin;
	}
	public Boolean getRegisteredResidence() {
		return registeredResidence;
	}
	public void setRegisteredResidence(Boolean registeredResidence) {
		this.registeredResidence = registeredResidence;
	}
	public String getStuIdeal() {
		return stuIdeal;
	}
	public void setStuIdeal(String stuIdeal) {
		this.stuIdeal = stuIdeal;
	}
	public Economy getEconomy() {
		return economy;
	}
	public void setEconomy(Economy economy) {
		this.economy = economy;
	}
	public Target getTarget() {
		return target;
	}
	public void setTarget(Target target) {
		this.target = target;
	}
	public Classes getClasses() {
		return classes;
	}
	public void setClasses(Classes classes) {
		this.classes = classes;
	}
	public College getCollege() {
		return college;
	}
	public void setCollege(College college) {
		this.college = college;
	}
	public Set<MajorMembers> getMembers() {
		return members;
	}
	public void setMembers(Set<MajorMembers> members) {
		this.members = members;
	}
	public Set<Trem> getTrems() {
		return trems;
	}
	public void setTrems(Set<Trem> trems) {
		this.trems = trems;
	}
	@Override
	public String toString() {
		return "Student [stuSex=" + stuSex + ", stuBirthday=" + stuBirthday + ", stuOrgin=" + stuOrgin
				+ ", registeredResidence=" + registeredResidence + ", stuIdeal=" + stuIdeal + ", economy=" + economy
				+ ", target=" + target + ", classes=" + classes + ", college=" + college + ", members=" + members
				+ ", trems=" + trems + "]";
	}
	
}
