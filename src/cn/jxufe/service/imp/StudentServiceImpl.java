package cn.jxufe.service.imp;


import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CachePut;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.dao.StudentDao;
import cn.jxufe.dao.UserDao;
import cn.jxufe.entity.Classes;
import cn.jxufe.entity.Student;
import cn.jxufe.entity.Trem;
import cn.jxufe.entity.User;
import cn.jxufe.qo.TeacherQueryObject;
import cn.jxufe.service.StudentService;
import cn.jxufe.utils.StringUtils;

/**
 * StudentService的实现类，实现了各种与Student有关的业务
 * @author me 
 */
@Service
public class StudentServiceImpl extends QueryServiceImpl<Student> implements StudentService {
	/**
	 * 自动注入Dao接口
	 */
	@Autowired
	private StudentDao studentDao;
	@Autowired
	private UserDao userDao;
	
	/* (non-Javadoc)
	 * @see cn.jxufe.service.imp.QueryServiceImpl#getDao()
	 */
	@Override
	public JpaRepository<Student, Long> getDao() {
		return studentDao;
	}

	/* (non-Javadoc)
	 * @see cn.jxufe.service.StudentService#save(cn.jxufe.entity.Student)
	 */
	@Override
	@CachePut(value="myCache",keyGenerator="customKeyGenerator")
	public Student save(Student student) {
		User user = userDao.findOne(student.getId());
		student.setAccount(user.getAccount());
		student.setName(user.getName());
		student.setPassword(user.getPassword());
		student.setRoles(user.getRoles());
		return studentDao.save(student);
	}

	/* (non-Javadoc)
	 * @see cn.jxufe.service.StudentService#findByClasses(cn.jxufe.entity.Classes, org.springframework.data.domain.Pageable)
	 */
	@Override
	public EasyUIData<Student> findByClasses(Classes classes, Pageable pageable) {
		Page<Student> page = studentDao.findByClasses(classes, pageable);
		EasyUIData<Student> easyUIData = new EasyUIData<Student>();
        easyUIData.setTotal(page.getTotalElements());
        easyUIData.setRows(page.getContent());
        return easyUIData;
	}

	/* (non-Javadoc)
	 * @see cn.jxufe.service.StudentService#findByQO(cn.jxufe.qo.TeacherQueryObject, org.springframework.data.domain.Pageable)
	 */
	@Override
	public EasyUIData<Student> findByQO(TeacherQueryObject terQO, Pageable pageable) {
		EasyUIData<Student> easyUIData = new EasyUIData<Student>();         
		List<Student> sList = new ArrayList<>();		
		if (terQO.getClasses() != null) {
			if (terQO.getTarget() != null) {
				sList = studentDao.findByClassesAndTarget(terQO.getClasses(),terQO.getTarget());
				if (terQO.getTremState() != null) {
					sList = screenStudent(sList, terQO.getTremState());
				}
			}else {
				sList = studentDao.findByClasses(terQO.getClasses());
				if (terQO.getTremState() != null) {
					sList = screenStudent(sList, terQO.getTremState());
				}
			}
		}
		Page<Student> page = new PageImpl<>(sList, pageable, null != sList ? sList.size() : 0L);
		easyUIData.setTotal(page.getTotalElements());
        easyUIData.setRows(page.getContent());
		return easyUIData;
	}
	
	/**
	 * 根据查询状态筛选学生列表
	 * 用sList.remove会出现线程并发异常，所以换成iterator.remove();
	 * 具体解释https://www.cnblogs.com/snowater/p/8024776.html
	 * @param sList
	 * @param state
	 * @return
	 */
	public List<Student> screenStudent(List<Student> sList,int state) {
		Iterator<Student> iterator = sList.iterator();
		while (iterator.hasNext()) {
			Student student = (Student) iterator.next();
			List<Trem> ordeTrems = student.getOrdeTrems();
			int count = ordeTrems.size();
			Trem lastTrem = ordeTrems.get(count - 1);
			switch (state) {
			case 1:
				if (StringUtils.isNotBlank(lastTrem.getSmallTarget())) {
					iterator.remove();
					//sList.remove(student);
				}
				break;
			case 2:
				if (StringUtils.isNotBlank(lastTrem.getTeacherAudit())) {
					iterator.remove();
					//sList.remove(student);
				}
				break;
			case 3:
				if (StringUtils.isNotBlank(lastTrem.getTargetFeedback())) {
					iterator.remove();
					//sList.remove(student);
				}
				break;
			case 4:
				if (StringUtils.isNotBlank(lastTrem.getTeacherComment()) && lastTrem.getTeacherComment() != null) {
					iterator.remove();
					//sList.remove(student);
				}
				break;
			}
		}
		return sList;
		
	}
	
}