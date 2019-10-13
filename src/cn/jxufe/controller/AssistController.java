package cn.jxufe.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jxufe.entity.Classes;
import cn.jxufe.entity.College;
import cn.jxufe.entity.Economy;
import cn.jxufe.entity.Profession;
import cn.jxufe.entity.State;
import cn.jxufe.entity.Target;
import cn.jxufe.service.ClassesService;
import cn.jxufe.service.CollegeService;
import cn.jxufe.service.EconomyService;
import cn.jxufe.service.ProfessionService;
import cn.jxufe.service.StateService;
import cn.jxufe.service.StudentService;
import cn.jxufe.service.TargetService;
import cn.jxufe.service.TremService;
import cn.jxufe.service.UserService;

@Controller
@RequestMapping("assist")
public class AssistController {
	@Autowired
	UserService userService;
	@Autowired
	StudentService studentService;
	@Autowired
	TremService tremService;
	@Autowired
	CollegeService collegeService;
	@Autowired
	EconomyService economyService;
	@Autowired
	TargetService targetService;
	@Autowired
	ClassesService classesService;
	@Autowired
	StateService stateService;
	@Autowired
	ProfessionService professionService;
	
	/**
	 * 页面跳转到首页
	 * @return
	 */
	@RequestMapping(value = "/workbench")
	 public String welcome() {
	        return "base/workbench";
	}
	
	/**
	 * 查询学校列表
	 * @return
	 */
	@RequestMapping(value="collegeList",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<College> collegeList(){
        return collegeService.findAll();
    }
	
	/**
	 * 查询经济等级列表
	 * @return
	 */
	@RequestMapping(value="economyList",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<Economy> economyList(){
        return economyService.findAll();
    }
	
	/**
	 * 查询毕业目标列表
	 * @return
	 */
	@RequestMapping(value="targetList",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<Target> targetList(){
        return targetService.findAll();
    }
	
	/**
	 * 查询所有班级列表
	 * @return 班级实体集
	 */
	@RequestMapping(value="classesList",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<Classes> classesList(){
        return classesService.findAll();
    }
	
	/**
	 * 查询所有班级列表
	 * @return 班级实体集
	 */
	@RequestMapping(value="stateList",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<State> stateList(){
        return stateService.findAll();
    }
	
	/**
	 * 查询所有专业列表
	 * @return 专业实体集
	 */
	@RequestMapping(value="professionList",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<Profession> ProfessionList(){
        return professionService.findAll();
    }
	
}
