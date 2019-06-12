package cn.jxufe.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import cn.jxufe.entity.Student;

public interface StudentDao extends JpaRepository<Student, Long>{

}
