package cn.jxufe.service.imp;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.bean.Message;
import cn.jxufe.dao.StudentDao;
import cn.jxufe.entity.Classes;
import cn.jxufe.entity.Student;
import cn.jxufe.service.StudentService;

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
	@CachePut(value="myCache",key="#student.id")
	public Message save(Student student) {
		Message message = new Message();
		try {
			studentDao.save(student);
			message.setCode(200);
			message.setMsg("保存成功");
		} catch (Exception e) {
			message.setCode(202);
			message.setMsg("保存失败");
		}
		return message;
	}

	@Override
	@Cacheable(value="myCache")
	public EasyUIData<Student> findByClasses(Classes classes, Pageable pageable) {
		Page<Student> page = studentDao.findByClasses(classes, pageable);
		EasyUIData<Student> easyUIData = new EasyUIData<Student>();
        easyUIData.setTotal(page.getTotalElements());
        easyUIData.setRows(page.getContent());
        return easyUIData;
	}
}