package cn.jxufe.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import cn.jxufe.entity.MajorMembers;
import cn.jxufe.entity.Student;

public interface MajorMembersDao extends JpaRepository<MajorMembers, Long>{
	/**
	 * 按学生查找家庭成员
	 * @param student 学生
	 * @return Student类的实体集
	 */
	public List<MajorMembers> findByStudent(Student student);
	
}
