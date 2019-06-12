package cn.jxufe.service.imp;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import cn.jxufe.dao.TremDao;
import cn.jxufe.entity.Trem;
import cn.jxufe.service.TremService;

/**
 * TremServic的实现类，实现了各种与Trem有关的业务
 * @author me 
 */
@Service
public class TremServiceImpl extends QueryServiceImpl<Trem> implements TremService {
	/**
	 * 自动注入Dao接口
	 */
	@Autowired
	private TremDao tremDao;
	
	/* (non-Javadoc)
	 * @see cn.jxufe.service.imp.QueryServiceImpl#getDao()
	 */
	@Override
	public JpaRepository<Trem, Long> getDao() {
		return tremDao;
	}
}