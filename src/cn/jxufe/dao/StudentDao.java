package cn.jxufe.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import cn.jxufe.entity.Classes;
import cn.jxufe.entity.Student;
import cn.jxufe.entity.Target;

public interface StudentDao extends JpaRepository<Student, Long>{
	/**
	 * 根据班级查询学生
	 * @param classes 班级实例对象
	 * @param pageable 分页属性
	 * @return Student类实体集
	 */
	public Page<Student> findByClasses(Classes classes, Pageable pageable);

	/**
	 * 根据班级和目标查询学生列表
	 * @param classes
	 * @param target
	 * @return
	 */
	public List<Student> findByClassesAndTarget(Classes classes, Target target);
	
	/**
	 * 根据班级查询学生
	 * @param classes 班级实例对象
	 * @return Student类实体集
	 */
	public List<Student> findByClasses(Classes classes);
	
	public Student findByAccount(String account);
}
