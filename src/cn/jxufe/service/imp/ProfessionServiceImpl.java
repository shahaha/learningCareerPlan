package cn.jxufe.service.imp;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import cn.jxufe.dao.ProfessionDao;
import cn.jxufe.entity.Profession;
import cn.jxufe.service.ProfessionService;

/**
 * ProfessionService的实现类，实现了各种与Profession有关的业务
 * @author me 
 */
@Service
public class ProfessionServiceImpl extends QueryServiceImpl<Profession> implements ProfessionService {
	/**
	 * 自动注入Dao接口
	 */
	@Autowired
	private ProfessionDao professionDao;
	
	/* (non-Javadoc)
	 * @see cn.jxufe.service.imp.QueryServiceImpl#getDao()
	 */
	@Override
	public JpaRepository<Profession, Long> getDao() {
		return professionDao;
	}

}