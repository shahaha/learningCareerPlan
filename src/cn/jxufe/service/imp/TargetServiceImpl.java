package cn.jxufe.service.imp;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import cn.jxufe.dao.TargetDao;
import cn.jxufe.entity.Target;
import cn.jxufe.service.TargetService;

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

}