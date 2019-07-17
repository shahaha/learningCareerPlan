package cn.jxufe.service.imp;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import cn.jxufe.bean.Message;
import cn.jxufe.dao.TremDao;
import cn.jxufe.entity.Student;
import cn.jxufe.entity.Trem;
import cn.jxufe.service.TremService;

/**
 * TremServic的实现类，实现了各种与Trem有关的业务
 * @author me 
 */
@Service
public class TremServiceImpl extends QueryServiceImpl<Trem> implements TremService {
	/**
	 * 自动注入Dao接口
	 */
	@Autowired
	private TremDao tremDao;
	
	/* (non-Javadoc)
	 * @see cn.jxufe.service.imp.QueryServiceImpl#getDao()
	 */
	@Override
	public JpaRepository<Trem, Long> getDao() {
		return tremDao;
	}

	/* (non-Javadoc)
	 * @see cn.jxufe.service.TremService#save(cn.jxufe.entity.Trem)
	 */
	@Override
	//@CachePut(value="myCache",key="#trem.id")
	public Message save(Trem trem) {
		Message message = new Message();
		try {
			tremDao.save(trem);
			message.setCode(200);
			message.setMsg("保存成功");
		} catch (Exception e) {
			message.setCode(202);
			message.setMsg("保存失败");
		}
		return message;
	}

	/* (non-Javadoc)
	 * @see cn.jxufe.service.TremService#findByStudentAndSemester(cn.jxufe.entity.Student, java.lang.Integer)
	 */
	@Override
	//@Cacheable(value="myCache")
	public Trem findByStudentAndSemester(Student student, Integer semester) {
		return tremDao.findByStudentAndSemester(student, semester);
	}
}