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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.bean.EasyUIDataPageRequest;
import cn.jxufe.bean.Message;
import cn.jxufe.entity.Classes;
import cn.jxufe.entity.Profession;
import cn.jxufe.entity.User;
import cn.jxufe.service.ClassesService;
import cn.jxufe.service.UserService;

@Controller
@RequestMapping("classes")
public class ClassesController {
	
	@Autowired
	ClassesService classesService;
	@Autowired
	UserService userService;
	
	/**
	 * 保存或修改一个Classes
	 * @param classes 要保存或修改的Classes对象
	 * @return 提示信息
	 */
	@RequestMapping(value="save",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Message save(Classes classes){
		Message message = new Message();
		try {
			classesService.save(classes);
			message.success("保存成功！");
		} catch (Exception e) {
			message.error500("保存失败！");
		}
        return message;
    }
	//========查询=====================================================================================================
	/**
	 * 查询所有班级列表
	 * @return 班级实体集
	 */
	@RequestMapping(value="fdAll",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<Classes> fdAll(){
        return classesService.findAll();
    }
	/**
	 * 查询所有班级列表
	 * @return 班级实体集
	 */
	@RequestMapping(value="findByTeacher",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<Classes> findByTeacher(Long id){
		User teacher = userService.get(id);
		return classesService.findByTeacher(teacher);
    }
	/**
	 * 按专业查询班级列表
	 * @param profession 专业
	 * @return 班级实体集
	 */
	@RequestMapping(value="fdByProfs",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<Classes> fdByProfs(Profession profession){
        return classesService.findByProfession(profession);
    }
	/**
	 * 按年级查询班级列表
	 * @param year 年级
	 * @return 班级实体集
	 */
	@RequestMapping(value="fdByGrade",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<Classes> fdByGrade(String year){
        return classesService.findByGrade(year);
    }
	/**
	 * 按专业和年级查询班级列表
	 * @param year 年级
	 * @param profession 专业
	 * @return 班级实体集
	 */
	@RequestMapping(value="fdByProfsAdGrade",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<Classes> fdByProfsAdGrade(Profession profession,String year){
        return classesService.findByProfessionAndGrade(profession, year);
    }
	//========管理=====================================================================================================
	/**
	 * 按专业查询班级列表并分页管理
	 * @param pageRequest 分页属性
	 * @param profession 专业
	 * @return 班级实体集
	 */
	@RequestMapping(value="mngFdByProfs",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public EasyUIData<Classes> mngFdByProfs(EasyUIDataPageRequest pageRequest,Profession profession){
		List<Sort.Order> orders = new ArrayList<Sort.Order>();
        if(pageRequest.getOrder().equals("asc")) {
            orders.add(new Sort.Order(Direction.ASC,pageRequest.getSort()));
        }else {
            orders.add(new Sort.Order(Direction.DESC,pageRequest.getSort()));
        }
        Pageable pageable = new PageRequest(pageRequest.getPage()-1, pageRequest.getRows(), new Sort(orders));
		return classesService.findByProfession(profession, pageable);
    }
	/**
	 * 按年级查询班级列表并分页管理
	 * @param pageRequest 分页属性
	 * @param year 年级
	 * @return 班级实体集
	 */
	@RequestMapping(value="mngFdByGrade",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public EasyUIData<Classes> mngFdByGrade(EasyUIDataPageRequest pageRequest,String year){
		List<Sort.Order> orders = new ArrayList<Sort.Order>();
        if(pageRequest.getOrder().equals("asc")) {
            orders.add(new Sort.Order(Direction.ASC,pageRequest.getSort()));
        }else {
            orders.add(new Sort.Order(Direction.DESC,pageRequest.getSort()));
        }
        Pageable pageable = new PageRequest(pageRequest.getPage()-1, pageRequest.getRows(), new Sort(orders));
		return classesService.findByGrade(year, pageable);
    }
	/**
	 * 按专业和年级查询班级列表并分页管理
	 * @param pageRequest 分页属性
	 * @param profession 专业
	 * @param year 年级
	 * @return 班级实体集
	 */
	@RequestMapping(value="mngFdByProfsAdGrade",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public EasyUIData<Classes> mngFdByProfsAdGrade(EasyUIDataPageRequest pageRequest,Profession profession,String year){
		List<Sort.Order> orders = new ArrayList<Sort.Order>();
        if(pageRequest.getOrder().equals("asc")) {
            orders.add(new Sort.Order(Direction.ASC,pageRequest.getSort()));
        }else {
            orders.add(new Sort.Order(Direction.DESC,pageRequest.getSort()));
        }
        Pageable pageable = new PageRequest(pageRequest.getPage()-1, pageRequest.getRows(), new Sort(orders));
		return classesService.findByProfessionAndGrade(profession, year, pageable);
    }
	
	/**
	 * 按教师查询班级列表并分页管理
	 * @param pageRequest 分页属性
	 * @param name 前台参数，教师实体
	 * @return 班级实体集
	 */
	@RequestMapping(value="mngFdByTeacher",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public EasyUIData<Classes> mngFdByteacher(EasyUIDataPageRequest pageRequest,Long id){
		List<Sort.Order> orders = new ArrayList<Sort.Order>();
        if(pageRequest.getOrder().equals("asc")) {
            orders.add(new Sort.Order(Direction.ASC,pageRequest.getSort()));
        }else {
            orders.add(new Sort.Order(Direction.DESC,pageRequest.getSort()));
        }
        Pageable pageable = new PageRequest(pageRequest.getPage()-1, pageRequest.getRows(), new Sort(orders));
		User teacher = userService.get(id);
		return classesService.findByTeacher(teacher,pageable);
    }
	
	
	/**
	 * 按班级名称模糊查询班级列表并分页管理
	 * @param pageRequest 分页属性
	 * @param name 前台参数，班级名称
	 * @return 班级实体集
	 */
	@RequestMapping(value="mngFdByNameLike",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public EasyUIData<Classes> mngFdByNameLike(EasyUIDataPageRequest pageRequest,@RequestParam(defaultValue="") String name){
		List<Sort.Order> orders = new ArrayList<Sort.Order>();
        if(pageRequest.getOrder().equals("asc")) {
            orders.add(new Sort.Order(Direction.ASC,pageRequest.getSort()));
        }else {
            orders.add(new Sort.Order(Direction.DESC,pageRequest.getSort()));
        }
        Pageable pageable = new PageRequest(pageRequest.getPage()-1, pageRequest.getRows(), new Sort(orders));
		return classesService.findByNameLike("%"+name+"%",pageable);
    }
}
