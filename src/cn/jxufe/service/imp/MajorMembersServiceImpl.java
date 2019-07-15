package cn.jxufe.service.imp;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CachePut;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.jxufe.bean.Message;
import cn.jxufe.dao.MajorMembersDao;
import cn.jxufe.entity.MajorMembers;
import cn.jxufe.entity.Student;
import cn.jxufe.service.MajorMembersService;

/**
 * MajorMembersService的实现类，实现了各种与MajorMembers有关的业务
 * @author me 
 */
@Service
public class MajorMembersServiceImpl extends QueryServiceImpl<MajorMembers> implements MajorMembersService {
	/**
	 * 自动注入Dao接口
	 */
	@Autowired
	private MajorMembersDao majorMembersDao;
	
	/* (non-Javadoc)
	 * @see cn.jxufe.service.imp.QueryServiceImpl#getDao()
	 */
	@Override
	public JpaRepository<MajorMembers, Long> getDao() {
		return majorMembersDao;
	}
	/* (non-Javadoc)
	 * @see cn.jxufe.service.MajorMembersService#save(cn.jxufe.entity.MajorMembers)
	 */
	@Override
	//@CachePut(value="myCache",key="#majorMembers.id")
	public Message save(MajorMembers majorMembers) {
		Message message = new Message();
		try {
			majorMembersDao.save(majorMembers);
			message.setCode(200);
			message.setMsg("保存成功");
		} catch (Exception e) {
			message.setCode(202);
			message.setMsg("保存失败");
		}
		return message;
	}

	/* (non-Javadoc)
	 * @see cn.jxufe.service.MajorMembersService#delete(java.lang.Long)
	 */
	@Override
	@Transactional
	public Message delete(Long id) {
		Message message = new Message();
		MajorMembers majorMember = majorMembersDao.findOne(id);
		try {
			majorMembersDao.delete(majorMember);
			message.setCode(200);
			message.setMsg("删除成功");
		} catch (Exception e) {
			message.setCode(202);
			message.setMsg("删除失败");
		}
		return message;
	}
	/* (non-Javadoc)
	 * @see cn.jxufe.service.MajorMembersService#findByStudent(cn.jxufe.entity.Student)
	 */
	@Override
	public List<MajorMembers> findByStudent(Student student) {
		return majorMembersDao.findByStudent(student);
	}

}