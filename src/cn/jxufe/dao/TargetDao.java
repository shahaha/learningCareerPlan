package cn.jxufe.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import cn.jxufe.vo.TargetVo;
import cn.jxufe.entity.Target;

public interface TargetDao extends JpaRepository<Target, Long>{

    @Query(value = "SELECT " + 
	"t_target.targetCaption, " + 
	"COUNT( t_student.id ) " + 
	"FROM  " + 
	" t_student,  " + 
	" t_target,  " + 
	" t_class   " + 
	"	WHERE  " + 
	" t_student.targetId = t_target.id   " + 
	" AND t_student.classId = t_class.id   " + 
	"	GROUP BY  " + 
	"t_target.targetCaption  " + 
	"	ORDER BY  " + 
	"COUNT( t_student.id ) DESC " , nativeQuery = true)
    List<TargetVo> selectEmployment();
    
    @Query(value = "SELECT    " + 
    		"t_target.targetCaption,    " + 
    		"	COUNT( t_student.id )     " + 
    		"FROM    " + 
    		"	t_student,    " + 
    		"	t_target,    " + 
    		"	t_class     " + 
    		"WHERE    " + 
    		"	t_student.targetId = t_target.id     " + 
    		"AND t_student.classId = t_class.id     " + 
    		"AND t_target.targetCaption !='还未录入'"+
    		"AND t_class.grade = :findGrade " + 
    		"GROUP BY    " + 
    		"t_target.targetCaption  " + 
    		"ORDER BY t_target.targetCaption DESC" , nativeQuery = true)
    List<TargetVo> selectEmploymentByGrade(@Param("findGrade") String find_Grade);

}
