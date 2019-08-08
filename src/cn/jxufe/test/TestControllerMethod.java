package cn.jxufe.test;

import java.util.Set;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import cn.jxufe.entity.MajorMembers;
import cn.jxufe.entity.Student;
import cn.jxufe.entity.Trem;
import cn.jxufe.service.CollegeService;
import cn.jxufe.service.EconomyService;
import cn.jxufe.service.MajorMembersService;
import cn.jxufe.service.StudentService;
import cn.jxufe.service.TargetService;
import cn.jxufe.service.TremService;
import cn.jxufe.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml","classpath:spring-mvc.xml"})
public class TestControllerMethod {
	@Autowired
	UserService userService;
	@Autowired
	StudentService studentService;
	@Autowired
	TremService tremService;
	@Autowired
	CollegeService collegeService;
	@Autowired
	EconomyService economyService;
	@Autowired
	TargetService targetService;
	@Autowired
	MajorMembersService majorMembersService;
	
	
	
	@Test
	public void testAddMember() {
		MajorMembers majorMembers = new MajorMembers();
		majorMembers.setId(0);
		majorMembers.setStudent(new Student("2"));
		majorMembers.setMembersJob("dd");
		majorMembers.setMembersName("gg");
		majorMembers.setMembersRelationship("yy");
		majorMembersService.save(majorMembers);
	}
	
	@Test
	public void testStudentTrem() {
		Student student = studentService.get(24L);
		Set<Trem> trems = student.getTrems();
		for (Trem trem : trems) {
			System.err.println(trem);
		}
		
	}

}
