package cn.jxufe.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.bean.EasyUIDataPageRequest;
import cn.jxufe.bean.Message;
import cn.jxufe.entity.MajorMembers;
import cn.jxufe.entity.Student;
import cn.jxufe.entity.Trem;
import cn.jxufe.service.MajorMembersService;
import cn.jxufe.service.StudentService;
import cn.jxufe.service.TremService;

@Controller
@RequestMapping("student")
public class StudentController{
	
	@Autowired
	StudentService studentService;
	@Autowired
	MajorMembersService majorMembersService;
	@Autowired
	TremService tremService;
	
	/**
	 * 进入学生信息编辑页面
	 * @param student 当前登录学生，通过当前登录用户的Id自动注入
	 * @param model
	 * @return
	 */
	@RequestMapping(value="eStuInfo",produces=MediaType.APPLICATION_JSON_VALUE)
    public String editStudentInfo(Long stuId,Model model){
		System.err.println(stuId);
		Student student = studentService.get(stuId);
		System.err.println(student);
		model.addAttribute("curStu", student);
        return "student/editStudentInfo";
    }
	
	@RequestMapping(value = "gridMemberData",produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public EasyUIData<MajorMembers> gridMemberData(EasyUIDataPageRequest pageRequest) {
		List<Sort.Order> orders = new ArrayList<Sort.Order>();
        if(pageRequest.getOrder().equals("asc")) {
            orders.add(new Sort.Order(Direction.ASC,pageRequest.getSort()));
        }else {
            orders.add(new Sort.Order(Direction.DESC,pageRequest.getSort()));
        }
        Pageable pageable = new PageRequest(pageRequest.getPage()-1, pageRequest.getRows(), new Sort(orders));
		return majorMembersService.findAll(pageable);
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
    public Message deleteMember(MajorMembers majorMembers,Model model){
        return majorMembersService.save(majorMembers);
    }
	
	/**
	 * 保存编辑后的信息
	 * @param student实例对象
	 * @param model
	 * @return
	 */
	@RequestMapping(value="save",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Message save(Student student,Model model){
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
    public String editTermPlanning(Long stuId,Integer semester,Model model){
		Student student = studentService.get(stuId);
		Trem tremBySS = tremService.findByStudentAndSemester(student, semester);
		Trem trem = new Trem();
		trem.setId(0);
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
        return tremService.save(trem);
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
		Student student = studentService.get(stuId);
		String url = "error/501";
		Trem trem = tremService.findByStudentAndSemester(student, semester);
		if (trem != null) {
			url = "student/editTermPlanning";
		}
		model.addAttribute("showSemester", trem);
        return url;
    }
}
