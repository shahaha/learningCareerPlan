package cn.jxufe.service;

import java.sql.Date;
import java.util.List;

import org.springframework.data.domain.Pageable;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.entity.Classes;
import cn.jxufe.entity.Profession;
import cn.jxufe.entity.User;

public interface ClassesService extends QueryService<Classes>{
	/**
	 * 保存一个实例对象
	 * @param 实例对象
	 * @return Message 返回保存结果的信息，成功或失败
	 */
	public Classes save(Classes classes);
	/**
	 * 按名称查找班级
	 * @param cName 班级名称
	 * @param pageable 分页属性
	 * @return Classes类的实体集
	 */
	public EasyUIData<Classes> findByNameLike(String name,Pageable pageable);
	/**
	 * 按年级查找班级
	 * @param year 所在年级
	 * @param pageable 分页属性
	 * @return Classes类的实体集
	 */
	public EasyUIData<Classes> findByGrade(String year,Pageable pageable);
	/**
	 * 按专业查找班级
	 * @param profession 所在专业
	 * @param pageable 分页属性
	 * @return Classes类的实体集
	 */
	public EasyUIData<Classes> findByProfession(Profession profession,Pageable pageable);
	/**
	 * 按专业和年级查找学生
	 * @param profession 所在专业
	 * @param year 所在专业
	 * @param pageable 分页属性
	 * @return Classes类的实体集
	 */
	public EasyUIData<Classes> findByProfessionAndGrade(Profession profession,String year,Pageable pageable);
	/**
	 * 查询班主任所带班级
	 * @param teacher 班主任
	 * @param pageable 分页属性
	 * @return Classes类的实体集
	 */
	public EasyUIData<Classes> findByTeacher(User teacher,Pageable pageable);
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
	public List<Classes> findByProfessionAndGrade(String profsName,String grade);
	
	/**查询班主任所带班级
	 * @param teacher
	 * @return Classes类的实体集
	 */
	public List<Classes> findByTeacher(User teacher);
	
	/**查询年级
	 * @return Classes类的实体集
	 */
	public List<Classes> findGrade();
	
	/**通过专业找年级
	 * @return Classes类的实体集
	 */
	public List<Classes> findGrade(int id);
	
	/**查询年级
	 * @return Date列表
	 */
	public List<Date> findGradeGroup();

	
}