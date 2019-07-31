package cn.jxufe.service.imp;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import cn.jxufe.dao.UserDao;
import cn.jxufe.entity.User;
import cn.jxufe.service.UserService;


/**
 * UserService的实现类，实现了各种与User有关的业务
 * @author me 
 */
@Service
public class UserServiceImpl extends QueryServiceImpl<User> implements UserService {
	/**
	 * 自动注入Dao接口
	 */
	@Autowired
	private UserDao userDao;
	
	/* (non-Javadoc)
	 * @see cn.jxufe.service.imp.QueryServiceImpl#getDao()
	 */
	@Override
	public JpaRepository<User, Long> getDao() {
		return userDao;
	}

	/* (non-Javadoc)
	 * @see cn.jxufe.service.UserService#save(cn.jxufe.entity.User)
	 */
	@Override
	@CachePut(value="myCache",keyGenerator="customKeyGenerator")
	public User save(User user) {
		return userDao.save(user);
	}

	/* (non-Javadoc)
	 * @see cn.jxufe.service.UserService#isExist(cn.jxufe.entity.User)
	 */
	@Override
	@Cacheable(value="myCache",keyGenerator="customKeyGenerator")
	public boolean isExist(User user) {
		return userDao.findByAccount(user.getAccount()) != null;
	}

	/* (non-Javadoc)
	 * @see cn.jxufe.service.UserService#findByAccount(java.lang.String)
	 */
	@Override
	public User findByAccount(String account) {
		return userDao.findByAccount(account);
	}

	/* (non-Javadoc)
	 * @see cn.jxufe.service.UserService#updatePassword(cn.jxufe.entity.User)
	 */
	@Override
	@CacheEvict(value="myCache",keyGenerator="customKeyGenerator")
	public void updatePassword(User user) {
		userDao.save(user);
	}
}