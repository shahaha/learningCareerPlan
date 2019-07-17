package cn.jxufe.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import cn.jxufe.entity.Classes;
import cn.jxufe.entity.Student;

public interface StudentDao extends JpaRepository<Student, Long>{
	/**
	 * 根据班级查询学生
	 * @param classes 班级实例对象
	 * @param pageable 分页属性
	 * @return Student类实体集
	 */
	public Page<Student> findByClasses(Classes classes, Pageable pageable);
}
