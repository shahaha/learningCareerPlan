package cn.jxufe.service.imp;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import cn.jxufe.dao.MajorMembersDao;
import cn.jxufe.entity.MajorMembers;
import cn.jxufe.service.MajorMembersService;

/**
 * MajorMembersService的实现类，实现了各种与MajorMembers有关的业务
 * @author me 
 */
@Service
public class MajorMembersServiceImpl extends QueryServiceImpl<MajorMembers> implements MajorMembersService {
	/**
	 * 自动注入Dao接口
	 */
	@Autowired
	private MajorMembersDao majorMembersDao;
	
	/* (non-Javadoc)
	 * @see cn.jxufe.service.imp.QueryServiceImpl#getDao()
	 */
	@Override
	public JpaRepository<MajorMembers, Long> getDao() {
		return majorMembersDao;
	}

}