package cn.jxufe.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jxufe.bean.Message;
import cn.jxufe.entity.Student;
import cn.jxufe.entity.User;
import cn.jxufe.service.StudentService;
import cn.jxufe.service.UserService;

@Controller
@RequestMapping("student")
public class StudentController{
	
	@Autowired
	StudentService studentService;
	/**
	 * 自动注入Service接口
	 */
	@Autowired
	UserService userService;
	
	
	
	@RequestMapping(value="findAll",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Student findAll(){
		//System.err.println(student.toString());
        return studentService.get(2l);
    }
	
	@RequestMapping(value="save",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Message save(Student student,Model model){
		//System.err.println(student.toString());
        return studentService.save(student);
    }
	
	/**
	 * 页面跳转到首页
	 * @return
	 */
	@RequestMapping(value = "/workbench")
	 public String welcome() {
		
        return "student/workbench";
    }
	/**
	 * 页面跳转到信息录入
	 * @return
	 */
	@RequestMapping(value = "/basic_info/{account}")
	 public String basic_info(@PathVariable String account,Model model) {
		User user=userService.findByAccount(account);
		model.addAttribute("curUser", user);
        return "student/basic_info";
    }
	

}
