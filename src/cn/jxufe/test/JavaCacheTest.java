package cn.jxufe.test;

import java.sql.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import cn.jxufe.entity.Classes;
import cn.jxufe.entity.College;
import cn.jxufe.entity.Economy;
import cn.jxufe.entity.Student;
import cn.jxufe.entity.Target;
import cn.jxufe.service.StudentService;


@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml","classpath:spring-mvc.xml"})
public class JavaCacheTest {
	
	@Autowired
	StudentService studentService;

	@Test
	public void addStudent() {
		Classes classes = new Classes("2");
		
		College college = new College("10421");
		
		Economy economy = new Economy("2");
		
		Date stuBirthday = new Date(235747853L);
		
		Target target = new Target("3");
		
		Student student =  new Student();
		student.setAccount("0164568");
		student.setClasses(classes);
		student.setCollege(college);
		student.setEconomy(economy);
		student.setName("牛批");
		student.setPassword("654321");
		student.setRegisteredResidence(true);
		student.setStuBirthday(stuBirthday);
		student.setStuIdeal("变得牛批");
		student.setStuOrgin("江西南昌");
		student.setStuSex(true);
		student.setTarget(target);
		student.setId(2);
		System.out.println(studentService.save(student));	
	}
	@Test
	public void queryTest() {
		System.out.println("第一次调用");
		Student student = studentService.get(2L);
		System.out.println(student.getAccount());
		System.out.println("第二次调用");
		System.out.println(studentService.get(2L).getAccount());
		
	}
	
	@Test
	public void hascodtest() {
		Student student = new Student();
		student.setId(5);
		System.out.println(student.hashCode());
	}
}
