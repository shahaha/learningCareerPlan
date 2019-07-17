package cn.jxufe.service.imp;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import cn.jxufe.dao.EmploymentSituationDao;
import cn.jxufe.entity.EmploymentSituation;
import cn.jxufe.service.EmploymentSituationService;

/**
 * EmploymentSituationService的实现类，实现了各种与EmploymentSituation有关的业务
 * @author me 
 */
@Service
public class EmploymentSituationServiceImpl extends QueryServiceImpl<EmploymentSituation> implements EmploymentSituationService {
	/**
	 * 自动注入Dao接口
	 */
	@Autowired
	private EmploymentSituationDao employmentSituationDao;
	
	/* (non-Javadoc)
	 * @see cn.jxufe.service.imp.QueryServiceImpl#getDao()
	 */
	@Override
	public JpaRepository<EmploymentSituation, Long> getDao() {
		return employmentSituationDao;
	}

}