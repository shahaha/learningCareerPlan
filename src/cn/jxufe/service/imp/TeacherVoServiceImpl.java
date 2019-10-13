package cn.jxufe.service.imp;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.dao.ClassesDao;
import cn.jxufe.dao.ProfessionDao;
import cn.jxufe.dao.StudentDao;
import cn.jxufe.dao.TremDao;
import cn.jxufe.dao.UserDao;
import cn.jxufe.entity.Classes;
import cn.jxufe.entity.Profession;
import cn.jxufe.entity.Student;
import cn.jxufe.entity.Trem;
import cn.jxufe.entity.User;
import cn.jxufe.qo.TeacherInfoQueryObject;
import cn.jxufe.service.TeacherVoService;
import cn.jxufe.vo.StudentVo;
import cn.jxufe.vo.TeacherVo;

@Service
public class TeacherVoServiceImpl extends QueryServiceImpl<TeacherVo> implements TeacherVoService {
	
	@Autowired
	private ClassesDao classesDao;
	
	@Autowired
	private StudentDao studentDao;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private TremDao tremDao;
	
	@Autowired
	private ProfessionDao professionDao;
	
	/**
	 * 根据查询状态筛选班级
	 * @param TeacherInfoQueryObject
	 * @param pageable
	 * @return 班级实体集
	 */
	@Override
	public EasyUIData<Classes> findAll(Pageable pageable, TeacherInfoQueryObject teaInfoQO) {
		// TODO Auto-generated method stub
		
		EasyUIData<Classes> easyUIData = new EasyUIData<Classes>();
		Profession profession=professionDao.findOne(teaInfoQO.getProfession().getId());
		Classes classes=classesDao.findOne(teaInfoQO.getClasses().getId());
		String grade=teaInfoQO.getGrade();   //年级
		List<Classes> classList=new ArrayList<>();
		
		 if(profession!=null) {
		   if(StringUtils.isNotBlank(grade)&&!"请选择年级".equals(grade)) {
			   classList=classesDao.findByProfessionAndGrade(profession, grade);
		   }else {
			  
			   classList=classesDao.findByProfession(profession);
		   }
		   
		   if(classes!=null) {
				classList.clear();
				classList.add(classes);
			  }
		   
		}else if(profession==null) {
			
			  if(StringUtils.isNotBlank(grade)) {
			  classList=classesDao.findByGrade(grade);
			  }else {
				  classList.clear();
				  classList.add(classes);
			  }
		}
		
		long totalElements = null != classList ? classList.size() : 0L;
		long fromIndex = pageable.getPageSize()*pageable.getPageNumber();
        long toIndex = pageable.getPageSize()*(pageable.getPageNumber()+1);
        if(toIndex>totalElements) toIndex = totalElements;
        List<Classes> content = classList.subList((int)fromIndex,(int)toIndex);
		easyUIData.setTotal(totalElements);
        easyUIData.setRows(content);
		return easyUIData;
	}
    
	/**
	 * 根据classId查询班级具体填写情况
	 * @param classId
	 * @return TeacherVo
	 */
	@Override
	public TeacherVo findTeacherVo(long classId) {
		// TODO Auto-generated method stub
		Classes classes=classesDao.findOne(classId);
		TeacherVo teacherVo=new TeacherVo();
		List<Student> studentList=new ArrayList<>();
		
		if(classes!=null) {
			  int studentNumber=0;
			  int smallTargetCount=0;      //已填写的班级人数
			  int teacherAuditCount=0;     //教师已填写的评论人数
			  int targetFeedbackCount=0;   //学生填写的学期自评人数
			  int teacherCommentCount=0;   //教师已打分人数；
			  List<String> lackSmallTarget=new ArrayList<>();  //当前学期未填写小目标的列表
			  List<String> lackTeacherAudit=new ArrayList<>();  //当前学期教师为评论的列表
			  List<String> lackTargetFeedback=new ArrayList<>(); //当前学期未填写目标反馈的列表
			  List<String> lackTeacheComment=new ArrayList<>(); //当前学期教师未填写学生反馈成绩的列表
			  
			  teacherVo.setClassName(classes.getName());
			  teacherVo.setTeacherName(classes.getTeacher().getName());
			  studentList=studentDao.findByClasses(classes);
			  studentNumber=studentList.size();
			  teacherVo.setStudentCount(studentNumber);
			  
			  for(Student student:studentList) {
				    
				   int latestTermNumber=student.getTrems().size(); //最新学期号
				   Trem trem=tremDao.findByStudentAndSemester(student,latestTermNumber);
				 
				   //小目标填写情况
				   if(StringUtils.isBlank(trem.getSmallTarget())) {
						  lackSmallTarget.add(student.getName());
				   }else {
					   smallTargetCount++;
				   }
				   
				   //教师评论情况
				   if(StringUtils.isBlank(trem.getTeacherAudit())) {
					   lackTeacherAudit.add(student.getName());
				   }else {
					   teacherAuditCount++;
				   }
				   
				   //学生目标反馈情况
				   if(StringUtils.isBlank(trem.getTargetFeedback())) {
					   lackTargetFeedback.add(student.getName());
				   }else {
					   targetFeedbackCount++;
				   }
				   
				   //教师期末打分情况
				   if(StringUtils.isBlank(trem.getTeacherComment())) {
					   lackTeacheComment.add(student.getName());
				   }else {
					   teacherCommentCount++;
				   }
			   }
			  
			   teacherVo.setSmallTargetCount(smallTargetCount);
			   teacherVo.setTeacherAuditCount(teacherAuditCount);
			   teacherVo.setTargetFeedbackCount(targetFeedbackCount);
			   teacherVo.setTeacherCommentCount(teacherCommentCount);
			   teacherVo.setLackSmallTarget(lackSmallTarget);
			   teacherVo.setLackTeacherAudit(lackTeacherAudit);
			   teacherVo.setLackTargetFeedback(lackTargetFeedback);
			   teacherVo.setLackTeacheComment(lackTeacheComment);
			   
			return teacherVo;
		}else {
			return null;
		}
		
	}

}
