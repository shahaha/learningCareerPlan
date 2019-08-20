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
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.bean.EasyUIDataPageRequest;
import cn.jxufe.entity.Student;
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
		
		System.err.println("terQO \t" +terQO.toString());
		
		List<Sort.Order> orders = new ArrayList<Sort.Order>();
        if(pageRequest.getOrder().equals("asc")) {
            orders.add(new Sort.Order(Direction.ASC,pageRequest.getSort()));
        }else {
            orders.add(new Sort.Order(Direction.DESC,pageRequest.getSort()));
        }
        Pageable pageable = new PageRequest(pageRequest.getPage()-1, pageRequest.getRows(), new Sort(orders));       
        return studentService.findByQO(terQO,pageable);
    }
	
}
