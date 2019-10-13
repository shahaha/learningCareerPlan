package cn.jxufe.service.imp;


import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.dao.ClassesDao;
import cn.jxufe.dao.ProfessionDao;
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
	
	@Autowired
	private ProfessionDao ProfessionDao;
	
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
	@CachePut(value="myCache",keyGenerator="customKeyGenerator")
	public Classes save(Classes classes) {
		return classesDao.save(classes);
	}
	//===================管理==================================================================
	

	/* (non-Javadoc)
	 * @see cn.jxufe.service.ClassesService#findByGrade(java.lang.String, org.springframework.data.domain.Pageable)
	 */
	@Override
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
	@Cacheable(value="myCache",keyGenerator="customKeyGenerator")
	public List<Classes> findByGrade(String year) {
		return classesDao.findByGrade(year);
	}

	/* (non-Javadoc)
	 * @see cn.jxufe.service.ClassesService#findByProfession(cn.jxufe.entity.Profession)
	 */
	@Override
	@Cacheable(value="myCache",keyGenerator="customKeyGenerator")
	public List<Classes> findByProfession(Profession profession) {
		return classesDao.findByProfession(profession);
	}

	/* (non-Javadoc)
	 * @see cn.jxufe.service.ClassesService#findByProfessionAndGrade(cn.jxufe.entity.Profession, java.lang.String)
	 */
	@Override
	@Cacheable(value="myCache",keyGenerator="customKeyGenerator")
	public List<Classes> findByProfessionAndGrade(String profsName, String grade) {
		List<Classes> classList=new ArrayList<>();
		Profession profession=ProfessionDao.findByProfsName(profsName);
		if(profession!=null&&grade!=null) {
			classList=classesDao.findByProfessionAndGrade(profession, grade);
		}else if(profession!=null) {
			classList=classesDao.findByProfession(profession);
		}else if(grade!=null) {
			classList=classesDao.findByGrade(grade);
		}
		
			return classList;
	}

	/* (non-Javadoc)
	 * @see cn.jxufe.service.ClassesService#findByTeacher(cn.jxufe.entity.User)
	 */
	@Override
	public List<Classes> findByTeacher(User teacher) {
		return classesDao.findByTeacher(teacher);
	}

	@Override
	public List<Classes> findGrade() {
		// TODO Auto-generated method stub
		return classesDao.findGrade();
	}

	@Override
	public List<Classes> findGrade(int id) {
		// TODO Auto-generated method stub
		return classesDao.findGrade(id);
	}
	
	@Override
	public List<Date> findGradeGroup() {
		return classesDao.findGradeGroup();
	}


	
}