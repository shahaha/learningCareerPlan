package cn.jxufe.dao;

import java.sql.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import cn.jxufe.entity.Classes;
import cn.jxufe.entity.Profession;
import cn.jxufe.entity.User;

public interface ClassesDao extends JpaRepository<Classes, Long>{
	
	/**
	 * 按年级查找班级
	 * @param year 所在年级
	 * @return Classes类的实体集
	 */
	public List<Classes> findByGrade(String year);
	/**
	 * 按专业查找班级
	 * @param profession 所在专业
	 * @return Classes类的实体集
	 */
	public List<Classes> findByProfession(Profession profession);
	/**
	 * 按专业和年级查找学生
	 * @param profession 所在专业
	 * @param year 所在专业
	 * @return Classes类的实体集
	 */
	public List<Classes> findByProfessionAndGrade(Profession profession,String year);
	/**
	 * 按名称查找班级
	 * @param cName 班级名称
	 * @param pageable 分页属性
	 * @return Classes类的实体集
	 */
	public Page<Classes> findByNameLike(String name,Pageable pageable);
	/**
	 * 按年级查找班级
	 * @param year 所在年级
	 * @param pageable 分页属性
	 * @return Classes类的实体集
	 */
	public Page<Classes> findByGrade(String year,Pageable pageable);
	/**
	 * 按专业查找班级
	 * @param profession 所在专业
	 * @param pageable 分页属性
	 * @return Classes类的实体集
	 */
	public Page<Classes> findByProfession(Profession profession,Pageable pageable);
	/**
	 * 按专业和年级查找班级
	 * @param profession 所在专业
	 * @param year 所在专业
	 * @param pageable 分页属性
	 * @return Classes类的实体集
	 */
	public Page<Classes> findByProfessionAndGrade(Profession profession,String year,Pageable pageable);
	/**
	 * 查询班主任所带班级
	 * @param teacher 班主任
	 * @param pageable 分页属性
	 * @return Classes类的实体集
	 */
	public Page<Classes> findByTeacher(User teacher,Pageable pageable);
	/**查询班主任所带班级
	 * @param teacher
	 * @return
	 */
	public List<Classes> findByTeacher(User teacher);
	/**查询所有年级
	 * @return Classes类的实体集列表
	 */
	@Query(value="SELECT * FROM t_class GROUP BY grade",nativeQuery = true)
	public List<Classes> findGrade();
	/**通过班级profsId查询年级
	 * @param profsId 班级profsId
	 * @return Classes类的实体集列表
	 */
	@Query(value="SELECT * FROM t_class where t_class.profsId =:profsId  GROUP BY grade ",nativeQuery = true)
	public List<Classes> findGrade(@Param("profsId") int profsId);
	/**查询所有年级
	 * @return Date列表
	 */
	@Query(value = "SELECT grade FROM t_class GROUP BY grade", nativeQuery = true)
	public List<Date> findGradeGroup();
}
