package cn.jxufe.service.imp;

import java.time.Year;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.dao.ClassesDao;
import cn.jxufe.dao.StudentDao;
import cn.jxufe.entity.Classes;
import cn.jxufe.entity.Student;
import cn.jxufe.entity.Trem;
import cn.jxufe.entity.User;
import cn.jxufe.qo.StudentInfoQueryObject;
import cn.jxufe.service.StudentService;
import cn.jxufe.service.StudentVoService;
import cn.jxufe.vo.StudentVo;

@Service
public class StudentVoServiceImpl extends QueryServiceImpl<StudentVo> implements StudentVoService {
	
	/**
	 * 自动注入Dao接口
	 */
	@Autowired
	private StudentDao studentDao;
	
	@Autowired
	private ClassesDao classesDao;
	

	/**
	 * 根据查询状态筛选学生列表
	 * @param stuInfoQQ
	 * @param pageable
	 * @return studentVo集
	 */
	@Override
	public EasyUIData<StudentVo> findAll(StudentInfoQueryObject stuInfoQO,Pageable pageable) {
		// TODO Auto-generated method stub
		EasyUIData<StudentVo> easyUIData = new EasyUIData<StudentVo>();
		List<Student> studentList = new ArrayList<>();
		List<StudentVo> studentVoList = new ArrayList<>();
		
		Classes classes=new Classes();
		String year=stuInfoQO.getGrade();
		if(!"".equals(stuInfoQO.getClasses().getId())) {
		 classes = classesDao.findOne(stuInfoQO.getClasses().getId());}
		String account=stuInfoQO.getAccount();
		
		
		StudentVo studentVo = new StudentVo();
		if(StringUtils.isNotBlank(account)) {
			Student student=studentDao.findByAccount(account);
			studentVo=getStudentVo(student);
			studentVoList.add(studentVo);
		}
		else if(StringUtils.isNotBlank(year)&&classes!=null) {	
				studentList=studentDao.findByClasses(classes);
				for(Student student:studentList) {
					studentVo=getStudentVo(student);
					studentVoList.add(studentVo);
			}
		}
		
		long totalElements = null != studentVoList ? studentVoList.size() : 0L;
		long fromIndex = pageable.getPageSize()*pageable.getPageNumber();
        long toIndex = pageable.getPageSize()*(pageable.getPageNumber()+1);
        if(toIndex>totalElements) toIndex = totalElements;
        List<StudentVo> content = studentVoList.subList((int)fromIndex,(int)toIndex);
        
		easyUIData.setTotal(totalElements);
        easyUIData.setRows(content);
		return easyUIData;
	}
	
	

	/**
	 * 获取学生信息列表
	 * @param stuent
	 * @return studentVo
	 */
  public StudentVo getStudentVo(Student student) {
	    StudentVo studentVo = new StudentVo();
	  
	    List<Trem> trems = student.getOrdeTrems();
		int count = trems.size();
		Trem lastTrem = trems.get(count - 1);
		int smallTargetCount=0;
	    int targetFeedbackCount=0;
	    
		if(!StringUtils.isBlank(lastTrem.getSmallTarget())){
			smallTargetCount=count;
		}else {
			smallTargetCount=count-1;
		}
		
		if(!StringUtils.isBlank(lastTrem.getTargetFeedback())){
			targetFeedbackCount=count;
		}else {
			targetFeedbackCount=count-1;
		}
		
		//studentVo.setStudent(student);
		studentVo.setAccount(student.getAccount());
		studentVo.setName(student.getName());
		studentVo.setStuSex(student.getStuSex());
		studentVo.setSmallTargetCount(smallTargetCount);
		studentVo.setTargetFeedbackCount(targetFeedbackCount);
	    return studentVo;
  }
	

}
