package cn.jxufe.service.imp;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import cn.jxufe.dao.StateDao;
import cn.jxufe.entity.State;
import cn.jxufe.service.StateService;

/**
 * StateService的实现类，实现了各种与State有关的业务
 * @author me 
 */
@Service
public class StateServiceImpl extends QueryServiceImpl<State> implements StateService {
	/**
	 * 自动注入Dao接口
	 */
	@Autowired
	private StateDao stateDao;
	/* (non-Javadoc)
	 * @see cn.jxufe.service.imp.QueryServiceImpl#getDao()
	 */
	@Override
	public JpaRepository<State, Long> getDao() {
		return stateDao;
	}

}