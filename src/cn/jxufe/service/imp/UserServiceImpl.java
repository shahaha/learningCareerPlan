package cn.jxufe.service.imp;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import cn.jxufe.bean.Message;
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
	@CachePut(value="myCache",key="#user.id")
	public Message save(User user) {
		Message message = new Message();
		try {
			userDao.save(user);
			message.setCode(200);
			message.setMsg("保存成功");
		} catch (Exception e) {
			message.setCode(202);
			message.setMsg("保存失败");
		}
		return message;
	}

	/* (non-Javadoc)
	 * @see cn.jxufe.service.UserService#isExist(cn.jxufe.entity.User)
	 */
	@Override
	@Cacheable(value="myCache",key="#user.account")
	public boolean isExist(User user) {
		return userDao.findByAccount(user.getAccount()) != null;
	}

	/* (non-Javadoc)
	 * @see cn.jxufe.service.UserService#findByAccount(java.lang.String)
	 */
	@Override
	@Cacheable(value="myCache",key="#account")
	public User findByAccount(String account) {
		return userDao.findByAccount(account);
	}
}