package cn.jxufe.service.imp;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import cn.jxufe.dao.RoleDao;
import cn.jxufe.entity.Role;
import cn.jxufe.service.RoleService;

/**
 * RoleService的实现类，实现了各种与Role有关的业务
 * @author me 
 */
@Service
public class RoleServiceImpl extends QueryServiceImpl<Role> implements RoleService {
	/**
	 * 自动注入Dao接口
	 */
	@Autowired
	private RoleDao roleDao;
	
	/* (non-Javadoc)
	 * @see cn.jxufe.service.imp.QueryServiceImpl#getDao()
	 */
	@Override
	public JpaRepository<Role, Long> getDao() {
		return roleDao;
	}

}