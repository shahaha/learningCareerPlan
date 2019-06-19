package cn.jxufe.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import cn.jxufe.entity.Student;
import cn.jxufe.entity.Trem;

public interface TremDao extends JpaRepository<Trem, Long>{
	/**
	 * 通过学生和学期号查找一个学期
	 * @param student 学生实例
	 * @param semester 学期号
	 * @return 学期实例
	 */
	public Trem findByStudentAndSemester(Student student,Integer semester);
}
