package cn.jxufe.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import cn.jxufe.bean.EasyUIData;

/**
 * 包含各种查询方法的service接口
 * @author me
 * @param <T> 实体Bean类型
 */
public interface QueryService<T> {
	/**
	 * 查询记录所有并分页
	 * @param pageable 分页属性
	 * @return 回实体集合
	 */
	public EasyUIData<T> findAll(Pageable pageable);
	/**
	 * 查询所有记录
	 * @return 返回实体集合
	 */
	public List<T> findAll();
	/**
	 * 根据主键获取一条记录
	 * @param ID 主键（Long型）
	 * @return 返回一个实体
	 */
	public T get(Long id);
}
