package cn.jxufe.service.imp;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.bean.Message;
import cn.jxufe.dao.ClassesDao;
import cn.jxufe.entity.Classes;
import cn.jxufe.entity.Profession;
import cn.jxufe.entity.User;
import cn.jxufe.service.ClassesService;

/**
 * ClassesService的实现类，实现了各种与Classes有关的业务
 * @author me 
 */
@Service
public class ClassesServiceImpl extends QueryServiceImpl<Classes> implements ClassesService {
	/**
	 * 自动注入Dao接口
	 */
	@Autowired
	private ClassesDao classesDao;
	
	/* (non-Javadoc)
	 * @see cn.jxufe.service.imp.QueryServiceImpl#getDao()
	 */
	@Override
	public JpaRepository<Classes, Long> getDao() {
		return classesDao;
	}

	/* (non-Javadoc)
	 * @see cn.jxufe.service.ClassesService#save(cn.jxufe.entity.Classes)
	 */
	@Override
	@CachePut(value="myCache",key="#classes.id")
	public Message save(Classes classes) {
		Message message = new Message();
		try {
			classesDao.save(classes);
			message.setCode(200);
			message.setMsg("保存成功");
		} catch (Exception e) {
			message.setCode(202);
			message.setMsg("保存失败，请检查信息是否正确。");
		}
		return message;
	}
	//===================管理==================================================================
	

	/* (non-Javadoc)
	 * @see cn.jxufe.service.ClassesService#findByGrade(java.lang.String, org.springframework.data.domain.Pageable)
	 */
	@Override
	@Cacheable(value="myCache")
	public EasyUIData<Classes> findByGrade(String year, Pageable pageable) {
		Page<Classes> page = classesDao.findByGrade(year, pageable);
		EasyUIData<Classes> easyUIData = new EasyUIData<Classes>();
        easyUIData.setTotal(page.getTotalElements());
        easyUIData.setRows(page.getContent());
        return easyUIData;
	}

	/* (non-Javadoc)
	 * @see cn.jxufe.service.ClassesService#findByProfession(cn.jxufe.entity.Profession, org.springframework.data.domain.Pageable)
	 */
	@Override
	@Cacheable(value="myCache")
	public EasyUIData<Classes> findByProfession(Profession profession, Pageable pageable) {
		Page<Classes> page = classesDao.findByProfession(profession, pageable);
		EasyUIData<Classes> easyUIData = new EasyUIData<Classes>();
        easyUIData.setTotal(page.getTotalElements());
        easyUIData.setRows(page.getContent());
        return easyUIData;
	}

	/* (non-Javadoc)
	 * @see cn.jxufe.service.ClassesService#findByProfessionAndGrade(cn.jxufe.entity.Profession, java.lang.String, org.springframework.data.domain.Pageable)
	 */
	@Override
	@Cacheable(value="myCache")
	public EasyUIData<Classes> findByProfessionAndGrade(Profession profession, String year, Pageable pageable) {
		Page<Classes> page = classesDao.findByProfessionAndGrade(profession, year, pageable);
		EasyUIData<Classes> easyUIData = new EasyUIData<Classes>();
        easyUIData.setTotal(page.getTotalElements());
        easyUIData.setRows(page.getContent());
        return easyUIData;
	}
	/* (non-Javadoc)
	 * @see cn.jxufe.service.ClassesService#findByNameLike(java.lang.String, org.springframework.data.domain.Pageable)
	 */
	@Override
	@Cacheable(value="myCache")
	public EasyUIData<Classes> findByNameLike(String name, Pageable pageable) {
		Page<Classes> page = classesDao.findByNameLike(name, pageable);
		EasyUIData<Classes> easyUIData = new EasyUIData<Classes>();
        easyUIData.setTotal(page.getTotalElements());
        easyUIData.setRows(page.getContent());
        return easyUIData;
	}
	/* (non-Javadoc)
	 * @see cn.jxufe.service.ClassesService#findByTeacher(cn.jxufe.entity.User, org.springframework.data.domain.Pageable)
	 */
	@Override
	@Cacheable(value="myCache")
	public EasyUIData<Classes> findByTeacher(User teacher, Pageable pageable) {
		Page<Classes> page = classesDao.findByTeacher(teacher, pageable);
		EasyUIData<Classes> easyUIData = new EasyUIData<Classes>();
        easyUIData.setTotal(page.getTotalElements());
        easyUIData.setRows(page.getContent());
        return easyUIData;
	}
	//===============查询=====================================================================================
	/* (non-Javadoc)
	 * @see cn.jxufe.service.ClassesService#findByGrade(java.lang.String)
	 */
	@Override
	@Cacheable(value="myCache",key="#year")
	public List<Classes> findByGrade(String year) {
		return classesDao.findByGrade(year);
	}

	/* (non-Javadoc)
	 * @see cn.jxufe.service.ClassesService#findByProfession(cn.jxufe.entity.Profession)
	 */
	@Override
	@Cacheable(value="myCache",key="#profession.id")
	public List<Classes> findByProfession(Profession profession) {
		return classesDao.findByProfession(profession);
	}

	/* (non-Javadoc)
	 * @see cn.jxufe.service.ClassesService#findByProfessionAndGrade(cn.jxufe.entity.Profession, java.lang.String)
	 */
	@Override
	@Cacheable(value="myCache")
	public List<Classes> findByProfessionAndGrade(Profession profession, String year) {
		return findByProfessionAndGrade(profession, year);
	}

	
}