package cn.jxufe.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jxufe.service.TargetService;
import cn.jxufe.service.TremService;
import cn.jxufe.service.UserService;
import cn.jxufe.vo.TargetVo;

@Controller
@RequestMapping("manage")
public class ManageController {
	@Autowired
	UserService userService;
	@Autowired
	TremService tremService;
	@Autowired
	TargetService targetService;
	/**
	 * 查询目标分布图
	 * @return
	 */
	@RequestMapping(value = "/targetChart")
    public String targetChart() {
        return "admin/targetChart";
    }

    @RequestMapping(value="selectEmployment",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<TargetVo> selectEmployment(){
		return targetService.selectEmployment(); 
    }
    
    @RequestMapping(value="selectEmploymentByGrade",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<TargetVo> selectEmploymentByGrade(String grade){
		return targetService.selectEmploymentByGrade(grade); 
    }
    
    @RequestMapping(value="findAllEmployment",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<List<TargetVo>> findAllEmployment(){
    	List<List<TargetVo>> targetVoListList=Arrays.asList(
    			targetService.selectEmploymentByGrade("2016"),
    			targetService.selectEmploymentByGrade("2017"),
    			targetService.selectEmploymentByGrade("2018")
    			);
		return targetVoListList; 
    }
}
