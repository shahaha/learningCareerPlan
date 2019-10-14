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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.bean.EasyUIDataPageRequest;
import cn.jxufe.bean.Message;
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
	
	/**
	 * 班主任进入学生信息页面
	 * @param student 当前详情按钮的学生，通过当前选择的学生的Id自动注入
	 * @param model
	 * @return
	 */
	@RequestMapping(value="viewStudent/{stuId}",produces=MediaType.APPLICATION_JSON_VALUE)
    public String viewStudentInfo(@PathVariable("stuId")Long stuId,Model model){
		Student student = studentService.get(stuId);
		model.addAttribute("curStu", student);
		List<Trem> ordeTrems = student.getOrdeTrems();
		int count = ordeTrems.size();
		Trem curTrem = null;
		if(count != 0) {
			curTrem = ordeTrems.get(count - 1);
		}
		model.addAttribute("trem", curTrem);
        return "teacher/viewStudentInfo";
    }
	
	/**
	 * 班主任审核学生的学期规划
	 * @param trem实例对象
	 * @param model
	 * @return
	 */
	@RequestMapping(value="teacherSaveTrem",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Message teacherSaveTrem(Trem trem,Model model){
		Message message = new Message();
//		System.err.println("Semester \t"+trem.getSemester()+" \t Id : \t"+trem.getId());
//		System.err.println("Audit \t"+trem.getTeacherAudit()+" \t Comment : \t"+trem.getTeacherComment());
		Trem trems = tremService.get(trem.getId());
		if(trem.getTeacherComment()==null || trem.getTeacherComment().isEmpty()) {
			trems.setTeacherAudit(trem.getTeacherAudit());
		}else if(trem.getTeacherAudit()==null || trem.getTeacherAudit().isEmpty()) {
			trems.setTeacherComment(trem.getTeacherComment());
			trems.setScore(trem.getScore());
		}
		trem = trems;
		try {
			tremService.save(trem);
			message.success("保存成功！");
		} catch (Exception e) {
			message.error500("保存失败！");
		}
		return message;
       
    }
	
	/**
	 * 班主任查询某学生某个学期的学期规划
	 * @param id
	 * @return
	 */
	@RequestMapping(value="queryTrem",produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
    public Trem queryTrem(Long id){
		Trem trem = tremService.get(id);
        return trem;
    }
}
