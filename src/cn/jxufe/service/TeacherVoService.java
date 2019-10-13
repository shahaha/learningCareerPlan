package cn.jxufe.service;

import org.springframework.data.domain.Pageable;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.entity.Classes;
import cn.jxufe.qo.TeacherInfoQueryObject;
import cn.jxufe.vo.TeacherVo;


public interface TeacherVoService extends QueryService<TeacherVo> {
    

    
	/**
	 * 查询班级基本情况
	 * @param pageable 分页属性
	 * @param TeacherVo实例对象
	 * @param TeacherInfoQueryObject实例对象
	 * @Return Classes实体集
	 */
	EasyUIData<Classes> findAll(Pageable pageable, TeacherInfoQueryObject teaInfoQO);
   
	/**
	 * 查询班级填写具体情况
	 * @param classId
	 * @Return TeacherVo实例对象
	 */
	TeacherVo findTeacherVo(long classId);
}