package cn.jxufe.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import cn.jxufe.vo.TargetVo;
import cn.jxufe.entity.Target;

public interface TargetDao extends JpaRepository<Target, Long>{
	
	/**
	 * 查询所有学生目标
	 * @return TargetVo类的实体集
	 */
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
		"COUNT( t_student.id ) DESC "
		, nativeQuery = true)
    public List<TargetVo> selectEmployment();
    
	/**
	 * 按年级查询学生目标
	 * @param find_Grade 所在年级
	 * @return TargetVo类的实体集
	 */
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
    		"ORDER BY t_target.targetCaption DESC" 
    		, nativeQuery = true)
    public List<TargetVo> selectEmploymentByGrade(@Param("findGrade") String find_Grade);
    
    /**
	 * 按班级查询学生目标
	 * @param findClass 所在班级
	 * @return TargetVo类的实体集
	 */
    @Query(value =
    		"SELECT b.targetCaption,IFNULL(a.num,0)" + 
    		"FROM" + 
    		"(" + 
    		"SELECT     " + 
    		"t_target.targetCaption,     " + 
    		"COUNT( t_student.id ) AS num     " + 
    		"FROM     " + 
    		"t_student,     " + 
    		"t_target,     " + 
    		"t_class      " + 
    		"WHERE     " + 
    		"t_student.targetId = t_target.id      " + 
    		"AND t_student.classId = t_class.id      " + 
    		"AND t_class.name= :findClass " + 
    		"GROUP BY t_target.targetCaption   " + 
    		"ORDER BY t_target.targetCaption DESC" + 
    		")" + 
    		"AS a " + 
    		"RIGHT JOIN" + 
    		"(SELECT targetCaption,0 AS num from t_target ) b " + 
    		"on a.targetCaption=b.targetCaption"
    		, nativeQuery = true)
    public List<TargetVo> selectEmploymentByClass(@Param("findClass") String findClass);

}
