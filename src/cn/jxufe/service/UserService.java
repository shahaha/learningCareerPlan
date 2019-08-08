package cn.jxufe.service;

import cn.jxufe.entity.User;

public interface UserService extends QueryService<User>{
	/**
	 * 保存一个实例对象
	 * @param user实例对象
	 * @return Message 返回保存结果的信息，成功或失败
	 */
	public User save(User user);
	/**
	 * 判断一个对象是否已存在
	 * @param user
	 * @return 是否存在的boolean值
	 */
	public boolean isExist(User user);
	/**
	 * 根据账号查找一个对象
	 * @return 一个实例对象
	 */
	public User findByAccount(String account);
	
}