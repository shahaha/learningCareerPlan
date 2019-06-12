package cn.jxufe.service.imp;

import java.util.List;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.service.QueryService;

/**
 * QueryService接口的实现类，实现了接口中的各种查询方法
 * 新增了dao属性
 * @author me 
 * @param <T> 实体Bean类型
 */
public class QueryServiceImpl<T> implements QueryService<T>{
	/**
	 * 用于接收各类型的Dao接口
	 * 每个继承该类的Impl类最好都重写getDao方法
	 */
	protected JpaRepository<T, Long> dao;

	/**
	 * 获取实例化的DAO对象
	 * @return 实现了JpaRepository<T, Long>的子类对象
	 */
	public JpaRepository<T, Long> getDao() {
		return dao;
	}
	
	/* (non-Javadoc)
	 * @see cn.jxufe.service.QueryService#findAll(org.springframework.data.domain.Pageable)
	 */
	@Override
	@Cacheable(value="myCache")
	public EasyUIData<T> findAll(Pageable pageable) {
		Page<T> page = getDao().findAll(pageable);
		EasyUIData<T> easyUIData = new EasyUIData<T>();
        easyUIData.setTotal(page.getTotalElements());
        easyUIData.setRows(page.getContent());
		return easyUIData;
	}

	/* (non-Javadoc)
	 * @see cn.jxufe.service.QueryService#findAll()
	 */
	@Override
	@Cacheable(value="myCache")
	public List<T> findAll() {
		return getDao().findAll();
	}

	/* (non-Javadoc)
	 * @see cn.jxufe.service.QueryService#get(java.lang.Long)
	 */
	@Override
	@Cacheable(value="myCache",key="#id")
	public T get(Long id) {
		return getDao().findOne(id);
	}

}
