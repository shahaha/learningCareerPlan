package cn.jxufe.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jxufe.bean.Message;
import cn.jxufe.entity.Student;
import cn.jxufe.service.StudentService;

@Controller
@RequestMapping("student")
public class StudentController{
	
	@Autowired
	StudentService studentService;
	
	
	
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

}
