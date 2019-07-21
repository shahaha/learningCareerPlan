package cn.jxufe.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
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
import cn.jxufe.entity.MajorMembers;
import cn.jxufe.entity.Student;
import cn.jxufe.entity.Trem;
import cn.jxufe.entity.User;
import cn.jxufe.service.MajorMembersService;
import cn.jxufe.service.StudentService;
import cn.jxufe.service.TremService;
import cn.jxufe.service.UserService;

@Controller
@RequestMapping("student")
public class StudentController{
	
	@Autowired
	StudentService studentService;
	@Autowired
	MajorMembersService majorMembersService;
	@Autowired
	TremService tremService;
	@Autowired
	UserService userService;
	
	/**
	 * 进入学生信息编辑页面
	 * @param student 当前登录学生，通过当前登录用户的Id自动注入
	 * @param model
	 * @return
	 */
	@RequestMapping(value="eStuInfo",produces=MediaType.APPLICATION_JSON_VALUE)
    public String editStudentInfo(Long stuId,Model model){
		Student student = studentService.get(stuId);
		model.addAttribute("curStu", student);
        return "student/editStudentInfo";
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
	
	/**
	 * 添加一个家庭成员
	 * @param majorMembers实例对象
	 * @param model
	 * @return
	 */
	@RequestMapping(value="addMember",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Message addMember(MajorMembers majorMembers,Model model){
        return majorMembersService.save(majorMembers);
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
	
	/**
	 * 保存编辑后的信息
	 * @param student实例对象
	 * @param model
	 * @return
	 */
	@RequestMapping(value="save",method = { RequestMethod.POST })
    @ResponseBody
    public Result save(Student student,Model model){
		User user = userService.get(student.getId());
		student.setAccount(user.getAccount());
		student.setName(user.getName());
		student.setPassword(user.getPassword());
		student.setRoles(user.getRoles());
        return studentService.save(student);
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
		//System.err.println("规划记录 ID"+ "\t"+trem.getId()+" \t传入的trem对象："+"\t"+trem);
		if(trem.getId()!=0) {
			Trem trems = tremService.get(trem.getId());
			trems.setSmallTarget(trem.getSmallTarget());
			trems.setTargetFeedback(trem.getTargetFeedback());
			 return tremService.save(trems);
		}else {
			return tremService.save(trem);
		}
		
       
    }
	
	/**
	 * 进入查看教师评语页面
	 * @param stuId 学生Id
	 * @param semester 当前学期号，即要查看的学期号
	 * @param model
	 * @return
	 */
	@RequestMapping(value="viewComments",produces=MediaType.APPLICATION_JSON_VALUE)
    public String viewComments(Long stuId,@RequestParam(defaultValue="1")Integer semester,Model model){
		model.addAttribute("stuId", stuId);
		model.addAttribute("semester", semester);
        return "student/viewComments";
    }
	
	/**
	 * 查询单个学期的评语
	 * @param stuId
	 * @param semester
	 * @return
	 */
	@RequestMapping(value="gridComments",produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
    public Trem gridComments(Long stuId,@RequestParam(defaultValue="1")Integer semester){
		Student student = studentService.get(stuId);
        return tremService.findByStudentAndSemester(student, semester);
    }
	/**
	 * 打印基本信息页面
	 * @param stuId 学生Id
	 * @param semester 当前学期
	 * @param request
	 * @return
	 */
	@RequestMapping(value="printBasicInfo",produces=MediaType.APPLICATION_JSON_VALUE)
	public String printBasicInfo(Long stuId,Integer semester,HttpServletRequest request){
	  Student student = studentService.get(stuId);
	  request.getSession().setAttribute("curStu", student);
	  String url="student/printBasicInfo";
	  return url;
	}
	/**
	 * 打印学期信息页面
	 * @param stuId 学生Id
	 * @param semester 当前学期
	 * @param request
	 * @return
	 */
	@RequestMapping(value="printTermInfo",produces=MediaType.APPLICATION_JSON_VALUE)
	public String printTermInfo(Long stuId,Integer semester,HttpServletRequest request){
		
	    String url="student/printTermInfo";
	    return url;
	}
	
	
}
