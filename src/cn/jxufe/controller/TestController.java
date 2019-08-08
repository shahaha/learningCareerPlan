package cn.jxufe.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jxufe.bean.Message;
import cn.jxufe.bean.Result;
import cn.jxufe.entity.College;
import cn.jxufe.entity.Economy;
import cn.jxufe.entity.MajorMembers;
import cn.jxufe.entity.Student;
import cn.jxufe.entity.Target;
import cn.jxufe.entity.Trem;
import cn.jxufe.service.CollegeService;
import cn.jxufe.service.EconomyService;
import cn.jxufe.service.MajorMembersService;
import cn.jxufe.service.StudentService;
import cn.jxufe.service.TargetService;
import cn.jxufe.service.TremService;
import cn.jxufe.service.UserService;

@Controller
@RequestMapping("test")
public class TestController{
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
	MajorMembersService majorMembersService;
	
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
	 * 删除一个家庭成员
	 * @param majorMembers实例对象
	 * @param model
	 * @return
	 */
	@RequestMapping(value="deleteMember",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Message deleteMember(Long id,Model model){
        return majorMembersService.delete(id);
    }
	
	@RequestMapping(value="findAllStu",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<Student> findAllStu(){
        return studentService.findAll();
    }
	
	@RequestMapping(value="memberList",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<MajorMembers> memberList(){
        return majorMembersService.findAll();
    }
	
	@RequestMapping(value="addMember",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Message addMember(MajorMembers majorMembers,Model model){
		Message message = new Message();
		try {
			majorMembersService.save(majorMembers);
			message.success("保存成功！");
		} catch (Exception e) {
			message.error500("保存失败！");
		}
        return message;
    }
	
	@RequestMapping(value="gridStudentTrem",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Trem gridStudentTrem(Long stuId,int semester){
		Student student = studentService.get(stuId);
        return tremService.findByStudentAndSemester(student, semester);
    }
	
	/**
	 * 进入学期规划页面
	 * @param stuId 学生Id
	 * @param semester 当前学期号，即要编辑的学期号
	 * @param model
	 * @return
	 */
	@RequestMapping(value="eTermPlan",produces=MediaType.APPLICATION_JSON_VALUE)
    public String editTermPlanning(Long stuId,@RequestParam(defaultValue="1")Integer semester,Model model){
		Student student = studentService.get(stuId);
		Trem tremBySS = tremService.findByStudentAndSemester(student, semester);
		Trem trem = new Trem();
		trem.setId(0);
		trem.setStudent(student);
		trem.setSemester(semester);
		if (tremBySS != null) {
			trem = tremBySS;
		}
		model.addAttribute("editSemester", trem);
        return "student/editTermPlanning";
    }
	
	/**
	 * 保存用户录入的学期规划
	 * @param trem实例对象
	 * @param model
	 * @return
	 */
	@RequestMapping(value="saveTrem",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Message saveTrem(Trem trem,Model model){
		Message message = new Message();
		if(trem.getId()!=0) {
			Trem trems = tremService.get(trem.getId());
			trems.setSmallTarget(trem.getSmallTarget());
			trems.setTargetFeedback(trem.getTargetFeedback());
			trem = trems;
		}
		try {
			tremService.save(trem);
			message.success("保存成功！");
		} catch (Exception e) {
			message.error500("保存失败！");
		}
		return message;
    }
	
	@RequestMapping(value="getStudent",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Student getStudent(Long stuId){
		System.out.println(stuId);
		Student student = studentService.get(stuId);
        return student;
    }
	
	@RequestMapping(value="save",method = { RequestMethod.POST })
    @ResponseBody
    public Result save(Student student,Model model){
		Message message = new Message();
		Result result = new Result();
		try {
			Student student2 = studentService.save(student);
			result.setMessage(message.success("保存成功！"));
			result.setData(student2);
		} catch (Exception e) {
			result.setMessage(message.error500("保存失败！"));
		}
        return result;
    }
	
	/**
	 * 查询学生家庭成员
	 * @param stuId 学生id
	 * @return
	 */
	@RequestMapping(value = "gridOneStuMemberData",produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<MajorMembers> gridOneStuMemberData(Long stuId) {
		Student student = studentService.get(stuId);
		return majorMembersService.findByStudent(student);
	}
	
}
