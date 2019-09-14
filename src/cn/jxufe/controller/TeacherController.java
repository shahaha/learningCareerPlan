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
import cn.jxufe.entity.Student;
import cn.jxufe.entity.Trem;
import cn.jxufe.entity.User;
import cn.jxufe.qo.TeacherQueryObject;
import cn.jxufe.service.ClassesService;
import cn.jxufe.service.StudentService;
import cn.jxufe.service.TremService;
import cn.jxufe.service.UserService;

@Controller
@RequestMapping("teacher")
public class TeacherController {
	@Autowired
	StudentService studentService;
	@Autowired
	TremService tremService;
	@Autowired
	UserService userService;
	@Autowired
	ClassesService classesService;
	
	/**
	 * 页面跳转到首页
	 * @return
	 */
	@RequestMapping(value = "/workbench")
	 public String welcome() {
	        return "teacher/workbench";
	}
	
	/**
	 * 进入评审学生目标页面
	 * @param terId
	 * @param model
	 * @return
	 */
	@RequestMapping(value="eStuReviews",produces=MediaType.APPLICATION_JSON_VALUE)
    public String editStudentReviews(Long terId,Model model){
		User teacher = userService.get(terId);
		model.addAttribute("curter", teacher);
        return "teacher/editStudentReviews";
    }
	
	/**
	 * 根据查询条件返回分页列表
	 * @param pageRequest
	 * @param terQO
	 * @return
	 */
	@RequestMapping(value="terQueryStuList",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public EasyUIData<Student> mngFdByProfsAdGrade(EasyUIDataPageRequest pageRequest,TeacherQueryObject terQO){		
		List<Sort.Order> orders = new ArrayList<Sort.Order>();
        if(pageRequest.getOrder().equals("asc")) {
            orders.add(new Sort.Order(Direction.ASC,pageRequest.getSort()));
        }else {
            orders.add(new Sort.Order(Direction.DESC,pageRequest.getSort()));
        }
        Pageable pageable = new PageRequest(pageRequest.getPage()-1, pageRequest.getRows(), new Sort(orders));       
        return studentService.findByQO(terQO,pageable);
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
        return "teacher/viewComments";
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
}
