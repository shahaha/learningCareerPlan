package cn.jxufe.service.imp;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import cn.jxufe.dao.CollegeDao;
import cn.jxufe.entity.College;
import cn.jxufe.service.CollegeService;

/**
 * CollegeService的实现类，实现了各种与College有关的业务
 * @author me 
 */
@Service
public class CollegeServiceImpl extends QueryServiceImpl<College> implements CollegeService {
	/**
	 * 自动注入Dao接口
	 */
	@Autowired
	private CollegeDao collegeDao;
	/* (non-Javadoc)
	 * @see cn.jxufe.service.imp.QueryServiceImpl#getDao()
	 */
	@Override
	public JpaRepository<College, Long> getDao() {
		return collegeDao;
	}

}