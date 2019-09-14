package cn.jxufe.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import cn.jxufe.vo.TargetVo;
import cn.jxufe.entity.Target;

public interface TargetDao extends JpaRepository<Target, Long>{

    @Query(value = "SELECT " + 
	"t_employmentsituation.employment, " + 
	"COUNT( t_student.id ) " + 
	"FROM  " + 
	" t_student,  " + 
	" t_employmentsituation,  " + 
	" t_class   " + 
	"	WHERE  " + 
	" t_student.targetId = t_employmentsituation.id   " + 
	" AND t_student.classId = t_class.id   " + 
	"	GROUP BY  " + 
	"t_employmentsituation.employment  " + 
	"	ORDER BY  " + 
	"COUNT( t_student.id ) DESC " , nativeQuery = true)
    List<TargetVo> selectEmployment();
    
    @Query(value = "SELECT    " + 
    		"t_employmentsituation.employment,    " + 
    		"	COUNT( t_student.id )     " + 
    		"FROM    " + 
    		"	t_student,    " + 
    		"	t_employmentsituation,    " + 
    		"	t_class     " + 
    		"WHERE    " + 
    		"	t_student.targetId = t_employmentsituation.id     " + 
    		"AND t_student.classId = t_class.id     " + 
    		"AND t_employmentsituation.employment !='尚未填写'"+
    		"AND t_class.grade = :findGrade " + 
    		"GROUP BY    " + 
    		"t_employmentsituation.employment  " + 
    		"ORDER BY t_employmentsituation.employment DESC" , nativeQuery = true)
    List<TargetVo> selectEmploymentByGrade(@Param("findGrade") String find_Grade);

}
