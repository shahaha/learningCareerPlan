package cn.jxufe.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.bean.EasyUIDataPageRequest;
import cn.jxufe.entity.Classes;
import cn.jxufe.qo.StudentInfoQueryObject;
import cn.jxufe.qo.TeacherInfoQueryObject;
import cn.jxufe.service.ClassesService;
import cn.jxufe.service.StudentVoService;
import cn.jxufe.service.TargetService;
import cn.jxufe.service.TeacherVoService;
import cn.jxufe.service.TremService;
import cn.jxufe.service.UserService;
import cn.jxufe.vo.StudentVo;
import cn.jxufe.vo.TargetVo;
import cn.jxufe.vo.TeacherVo;

@Controller
@RequestMapping("manage")
public class ManageController {
	
	@Autowired
	UserService userService;
	@Autowired
	ClassesService classesService;
	@Autowired
	TremService tremService;
	@Autowired
	TargetService targetService;
	@Autowired
	StudentVoService studentVoService;
	@Autowired
	TeacherVoService teacherVoService;
	
	/**
	 *  查询总的目标分布图
	 * @return
	 */
	@RequestMapping(value = "/viewTargetChart")
    public String targetChart() {
        return "admin/viewTargetChart";
    }

	/**
	 * 查询各年级目标分布图
	 * @return
	 */
	@RequestMapping(value = "/viewTargetByGrade")
    public String viewTargetByGrade() {
        return "admin/viewTargetByGrade";
    }
	
	/**
	 * 查询各班级分布图
	 * @return
	 */
	@RequestMapping(value = "/viewTargetByClass")
    public String viewTargetByClass() {
        return "admin/viewTargetByClass";
    }
    
	/**
	 * 查询最近三个年级
	 * @return classes的grade转为字符串前4个数字
	 */ 
    @RequestMapping(value="findAllGrade",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<String> findAllGrade(){ 
    	List<Date> grades=classesService.findGradeGroup();
    	List<String> gradesString=Arrays.asList(grades.get(0).toString(),grades.get(1).toString(),grades.get(2).toString());
		return gradesString; 
    }
    
    /**
	 * 查询所有年级
	 * @return 键值对形式grade
	 */ 
    @RequestMapping(value="findAllGradeDate",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<HashMap> findAllGradeDate(){ 
    	List<Date> grades=classesService.findGradeGroup();
    	HashMap[] map=new HashMap[grades.size()];
    	for (int i = 0; i < grades.size(); i++) {
    		map[i]=new HashMap();
    		map[i].put("id", i+1);
    		map[i].put("name", grades.get(i).toString().substring(0,4));
		}
    	List<HashMap> maps=new ArrayList();
    	for (int i = 0; i < map.length; i++) {
    		maps.add(map[i]);
		}
		return maps; 
    }
	
    /**
   	 * 查询最近三个年级目标
   	 * @return TargetVo列表集
   	 */ 
    @RequestMapping(value="findAllEmployment",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<List<TargetVo>> findAllEmployment(){
    	List<String> gradesString=findAllGrade();
    	List<List<TargetVo>> targetVoListList=Arrays.asList(
    			targetService.selectEmploymentByGrade(gradesString.get(0)),
    			targetService.selectEmploymentByGrade(gradesString.get(1)),
    			targetService.selectEmploymentByGrade(gradesString.get(2))
    			);
		return targetVoListList; 
    }
    
    /**
   	 * 查询所有学生目标
   	 * @return TargetVo列表集
   	 */ 
    @RequestMapping(value="selectEmployment",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<TargetVo> selectEmployment(){
		return targetService.selectEmployment(); 
    }
    
    /**
   	 * 根据年级查询目标
   	 * @param grade所在年级
   	 * @return TargetVo列表集
   	 */ 
    @RequestMapping(value="findEmploymentByGrade",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<TargetVo> findEmploymentByGrade(String grade){
		return targetService.selectEmploymentByGrade(grade); 
    }
    
    /**
   	 * 根据班级查询目标
   	 * @param findClass所在班级
   	 * @return TargetVo列表集
   	 */ 
    @RequestMapping(value="selectEmploymentByClass",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<TargetVo> selectEmploymentByClass(String findClass){
		return targetService.selectEmploymentByClass(findClass); 
    }

	
	/**
	 * 查询学生填写情况
	 * @return
	 */
	@RequestMapping(value = "/findStudentInfo")
    public String findStudentInfo() {
        return "admin/findStudentInfo";
    }
	
	/**
	 * 查询班级填写情况
	 * @return
	 */
	@RequestMapping(value = "/findClassesInfo")
    public String findClassesInfo() {
        return "admin/findClassesInfo";
    }
    
    /**
	 * 根据查询条件返回分页列表
	 * @param pageRequest
	 * @param StudentVo列表集
	 * @return
	 */
    @RequestMapping(value="adminQueryStuInfo",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public  EasyUIData<StudentVo> AdminQueryStuInfo(StudentInfoQueryObject stuInfoQO ,EasyUIDataPageRequest pageRequest){
    	List<Sort.Order> orders = new ArrayList<Sort.Order>();
        if(pageRequest.getOrder().equals("asc")) {
            orders.add(new Sort.Order(Direction.ASC,pageRequest.getSort()));
        }else {
            orders.add(new Sort.Order(Direction.DESC,pageRequest.getSort()));
        }
        Pageable pageable = new PageRequest(pageRequest.getPage()-1,pageRequest.getRows(), new Sort(orders));       
        return studentVoService.findAll(stuInfoQO,pageable);
    }
     
    /**
   	 * 根据查询班级的基本情况
   	 * @param pageRequest
   	 * @return Classes实体集
   	 */
    @RequestMapping(value="viewClassesCondition",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public EasyUIData<Classes> viewClassesCondition(TeacherInfoQueryObject teaInfoQO,EasyUIDataPageRequest pageRequest){
    	List<Sort.Order> orders = new ArrayList<Sort.Order>();
        if(pageRequest.getOrder().equals("asc")) {
            orders.add(new Sort.Order(Direction.ASC,pageRequest.getSort()));
        }else {
            orders.add(new Sort.Order(Direction.DESC,pageRequest.getSort()));
        }
        Pageable pageable = new PageRequest(pageRequest.getPage()-1,pageRequest.getRows(), new Sort(orders));       
        return teacherVoService.findAll(pageable,teaInfoQO);
    }
    
    /**
   	 * 根据查询班级的具体情况
   	 * @param pageRequest
   	 * @return
   	 */
    @RequestMapping(value="adminQueryTeaInfo",produces=MediaType.APPLICATION_JSON_VALUE)
    public String adminQueryTeaInfo(long classId,Model model){
        TeacherVo teacherVo=teacherVoService.findTeacherVo(classId);
        model.addAttribute("teacherVo",teacherVo);
        return "admin/getClassesCondition";
    }
}
