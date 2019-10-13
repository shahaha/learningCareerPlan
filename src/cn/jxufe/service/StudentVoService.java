package cn.jxufe.service;

import org.springframework.data.domain.Pageable;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.entity.Classes;
import cn.jxufe.entity.Student;
import cn.jxufe.qo.StudentInfoQueryObject;
import cn.jxufe.service.imp.QueryServiceImpl;
import cn.jxufe.vo.StudentVo;

public interface StudentVoService extends QueryService<StudentVo>   {

    
	/**
	 * 按年级、班级、个人等信息查询学生
	 * @param pageable 分页属性
	 * @param StudentVo实例对象
	 * @param StudentInfoQueryObject查询条件集和实例
	 * @return StudentVo类实体集
	 */
	public EasyUIData<StudentVo> findAll(StudentInfoQueryObject stuInfoQO, Pageable pageable);

}
