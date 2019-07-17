package cn.jxufe.service.imp;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import cn.jxufe.dao.EconomyDao;
import cn.jxufe.entity.Economy;
import cn.jxufe.service.EconomyService;

/**
 * EconomyService的实现类，实现了各种与Economy有关的业务
 * @author me 
 */
@Service
public class EconomyServiceImpl extends QueryServiceImpl<Economy> implements EconomyService {
	/**
	 * 自动注入Dao接口
	 */
	@Autowired
	private EconomyDao economyDao;
	
	/* (non-Javadoc)
	 * @see cn.jxufe.service.imp.QueryServiceImpl#getDao()
	 */
	@Override
	public JpaRepository<Economy, Long> getDao() {
		return economyDao;
	}

}