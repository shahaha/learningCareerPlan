package cn.jxufe.service.imp;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import cn.jxufe.dao.TargetDao;
import cn.jxufe.entity.Target;
import cn.jxufe.service.TargetService;
import cn.jxufe.vo.TargetVo;

/**
 * TargetService的实现类，实现了各种与Target有关的业务
 * @author me 
 */
@Service
public class TargetServiceImpl extends QueryServiceImpl<Target> implements TargetService {
	/**
	 * 自动注入Dao接口
	 */
	@Autowired
	private TargetDao targetDao;
	
	/* (non-Javadoc)
	 * @see cn.jxufe.service.imp.QueryServiceImpl#getDao()
	 */
	@Override
	public JpaRepository<Target, Long> getDao() {
		return targetDao;
	}

	@Override
	public List<TargetVo> selectEmployment() {
		// TODO Auto-generated method stub
		return targetDao.selectEmployment();
	}
	
	@Override
	public List<TargetVo> selectEmploymentByGrade(String grade) {
		// TODO Auto-generated method stub
		return targetDao.selectEmploymentByGrade(grade);
	}

}