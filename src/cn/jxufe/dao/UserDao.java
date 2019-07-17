package cn.jxufe.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import cn.jxufe.entity.User;

public interface UserDao extends JpaRepository<User, Long>{
	/**
	 * 根据账号查找一个对象
	 * @return 一个实例对象
	 */
	public User findByAccount(String account);
}
