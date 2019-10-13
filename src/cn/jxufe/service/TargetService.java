package cn.jxufe.service;

import java.util.List;
import cn.jxufe.entity.Target;
import cn.jxufe.vo.TargetVo;

public interface TargetService extends QueryService<Target>{

	/**
	 * 查询所有学生目标
	 * @return TargetVo类实体集
	 */
	public List<TargetVo> selectEmployment();
	/**
	 * 根据年级查询学生目标
	 * @param grade 所在班级
	 * @return TargetVo类实体集
	 */
	public List<TargetVo> selectEmploymentByGrade(String grade);
	/**
	 * 根据班级查询学生目标
	 * @param findClass 所在班级
	 * @return TargetVo类实体集
	 */
	public List<TargetVo> selectEmploymentByClass(String findClass);

}