package cn.jxufe.service;

import java.util.List;
import cn.jxufe.entity.Target;
import cn.jxufe.vo.TargetVo;

public interface TargetService extends QueryService<Target>{

	public List<TargetVo> selectEmployment();
	public List<TargetVo> selectEmploymentByGrade(String grade);
}