package cn.jxufe.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import cn.jxufe.entity.Role;
import cn.jxufe.entity.Student;
import cn.jxufe.entity.Trem;
import cn.jxufe.entity.User;
import cn.jxufe.service.StudentService;
import cn.jxufe.service.TremService;
import cn.jxufe.service.UserService;
import cn.jxufe.utils.LoggerUtils;
import cn.jxufe.vcode.Captcha;
import cn.jxufe.vcode.GifCaptcha;
import cn.jxufe.vcode.VerifyCodeUtils;

@Controller
@RequestMapping("base")
public class BaseController {
	@Autowired
	UserService userService;
	@Autowired
	StudentService studentService;
	@Autowired
	TremService tremService;
	
	
	/**
	 * 管理员专用登录通道
	 * @return
	 */
	@RequestMapping(value = "/adminLogin")
    public String adminLogin() {
        return "admin/login";
    }

	/**
	 * 首页
	 * @return
	 */
	@RequestMapping(value = "/workbench")
    public String workbench() {
        return "base/workbench";
    }
	
	/**
	 * 登录管理员角色
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/loginAdministrator")
    public String loginAdministrator(Model model,HttpServletRequest request) {
		User curUser = (User) request.getSession().getAttribute("loginUser");
		model.addAttribute("curUser", curUser);
		Set<Role> roles = curUser.getRoles();
		String url = "error/500";
		for (Role role : roles) {
			if ("管理员".equals(role.getRole())) {
				url = "admin/main";
				break;
			}
		}
        return url;
    }
	
	
	
	/**
	 * 登录验证
	 * @param user 前台登录用户参数
	 * @param request
	 * @param vcodeText 前台传来的验证码
	 * @return 验证返回结果
	 */
	@RequestMapping(value="loginValidate",produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
    public Message loginValidate(User user,HttpServletRequest request,@RequestParam(defaultValue="") String vcodeText){
		String vcode = (String) request.getSession().getAttribute("vcode");;
		vcodeText = vcodeText.toLowerCase();
		Message message = new Message();
		if (vcodeText.equals(vcode)) {
			User loginUser = userService.findByAccount(user.getAccount());
			if (loginUser != null) {
				if (!loginUser.getPassword().equals(user.getPassword())) {
					message.setCode(202);
					message.setMsg("密码不正确");
				} else{
					request.getSession().setAttribute("loginUser", loginUser);
					message.setCode(200);
					message.setMsg("正在登录");
					
				}
			}else {
				message.setCode(400);
				message.setMsg("用户不存在");
			}
		}else {
			message.setCode(201);
			message.setMsg("验证码错误");
		}
		return message;
	}
	
	/**
	 * 登录用户角色
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/loginRole")
    public String loginRole(Model model,HttpServletRequest request) {
		User curUser = (User) request.getSession().getAttribute("loginUser");
		request.getSession().setAttribute("curUser", curUser);
		Set<Role> roles = curUser.getRoles();
		String url = "error/500";
		for (Role role : roles) {
			if ("学生".equals(role.getRole())) {
				Student student = studentService.get(curUser.getId());
				Set<Trem> trems =student.getTrems();
				
				//对trems进行排序
				List<Trem> tremsList = new ArrayList<Trem>(trems); 
				 Collections.sort(tremsList, new Comparator<Trem>() {    
					  public int compare(Trem arg0, Trem arg1) {    
					     return arg0.getSemester().compareTo(arg1.getSemester()); // 按照id排列    
					  }    
					});    
				request.getSession().setAttribute("tremsList", tremsList);
				
				int curTrem = 1;
				if (trems != null && !trems.isEmpty()) {
					for (Trem trem : trems) {
						if (trem.getSemester() > curTrem) {
							curTrem = trem.getSemester();
						}
					}
					Trem trem = tremService.findByStudentAndSemester(student, curTrem);
					if (trem.isEnd()) {
						curTrem = curTrem + 1;
					}
				}
				model.addAttribute("curTrem", curTrem);
				url = "student/main";
				break;
			}
			if ("班主任".equals(role.getRole())) {
				url = "teacher/main";
				break;
			}
		}
        return url;
    }
	
	
	/**
	 * 退出登录，返回到登录页面
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/loginout")
    public String loginout(HttpServletRequest request) {
		request.getSession().removeAttribute("loginUser");
        return "redirect:/login.jsp";
    }
	
	/**
	 * 获取静态png验证码
	 * @param response 响应
	 * @param request 请求
	 */
	@RequestMapping(value="getYzm",method=RequestMethod.GET)
	public void getYzm(HttpServletResponse response,HttpServletRequest request){
		try {
			response.setHeader("Pragma", "No-cache");  
	        response.setHeader("Cache-Control", "no-cache");  
	        response.setDateHeader("Expires", 0);  
	        response.setContentType("image/jpeg");  
	          
	        //生成随机字串  
	        String verifyCode = VerifyCodeUtils.generateVerifyCode(4);
	        //存入会话session  
	        HttpSession session = request.getSession(true);  
	        session.setAttribute("vcode", verifyCode.toLowerCase());  
	        //生成图片  
	        int w = 146, h = 33;  
	        VerifyCodeUtils.outputImage(w, h, response.getOutputStream(), verifyCode);  
		} catch (Exception e) {
			LoggerUtils.fmtError(getClass(),e, "获取验证码异常：%s",e.getMessage());
		}
	}
	
	/**
	 * 获取gif验证码
	 * @param response 响应
	 * @param request 请求
	 */
	@RequestMapping(value="getGifCode",method=RequestMethod.GET)
	public void getGifCode(HttpServletResponse response,HttpServletRequest request){
		try {
			response.setHeader("Pragma", "No-cache");  
	        response.setHeader("Cache-Control", "no-cache");  
	        response.setDateHeader("Expires", 0);  
	        response.setContentType("image/gif");  
	        /**
	         * gif格式动画验证码
	         * 宽，高，位数。
	         */
	        Captcha captcha = new GifCaptcha(120,42,4);
	        //输出
	        captcha.out(response.getOutputStream());
	        HttpSession session = request.getSession(true);  
	        //存入Session
	        session.setAttribute("vcode",captcha.text().toLowerCase());  
		} catch (Exception e) {
			LoggerUtils.fmtError(getClass(),e, "获取验证码异常：%s",e.getMessage());
		}
	}
	
	
	/**
	 * 跳转至修改密码页面
	 *  @param model
	 */
	 @RequestMapping("changePass")
	 public String changePass(Long stuId,Model model) {
		 User user = userService.get(stuId);
		 model.addAttribute("curUser",user);
		 String url="base/changePass";
		 return url;
	 }
	
	     /**
		 * 修改密码
		 *  @param model
		 */
	 @RequestMapping("updatePass")
	 @ResponseBody
	 public Message save(User user,HttpServletRequest request){
	    String id =request.getParameter("id").trim();
	    Long uId= Long.parseLong(id);
	    User u= userService.get(uId);
	    u.setPassword(user.getPassword());
		System.err.println("id:"+id+" Password:"+user.getPassword());
		return userService.save(u);
	 }
}
