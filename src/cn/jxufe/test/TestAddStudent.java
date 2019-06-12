package cn.jxufe.test;

import java.sql.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import cn.jxufe.entity.Classes;
import cn.jxufe.entity.College;
import cn.jxufe.entity.Economy;
import cn.jxufe.entity.Profession;
import cn.jxufe.entity.Student;
import cn.jxufe.entity.Target;
import cn.jxufe.entity.Trem;
import cn.jxufe.entity.User;
import cn.jxufe.service.ClassesService;
import cn.jxufe.service.StudentService;
import cn.jxufe.service.UserService;
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class TestAddStudent {

	@Autowired
	StudentService studentService;
	@Autowired
	ClassesService classesService;
	@Autowired
	UserService userService;
	
	@Test
	public void test() {
		
		Student student = studentService.get(1L);
		Student student2 = new Student();
		student2.setId(1);
		student2.setAccount(student.getAccount());
		student2.setName(student.getName());
		student2.setPassword(student.getPassword());
		student2.setStuSex(student.getStuSex());
		student2.setStuBirthday(student.getStuBirthday());
		student2.setStuOrgin(student.getStuOrgin());
		student2.setRegisteredResidence(student.getRegisteredResidence());
		student2.setEconomy(student.getEconomy());
		student2.setStuIdeal(student.getStuIdeal());
		student2.setTarget(student.getTarget());
		System.out.println(studentService.save(student2).getMsg());
		
		
		
		/*String str = studentService.get(2L).getName();
		System.err.println("111111111f" + str);
		String str1 = studentService.get(2L).getName();
        System.err.println("dgyusygfuygu" + str1);*/
		
		
		/*Classes classes = new Classes("2");
		
		College college = new College("10421");
		
		Economy economy = new Economy("2");
		
		Date stuBirthday = new Date(235747853L);
		
		Target target = new Target("3");
		
		Student student =  new Student();
		student.setAccount("0164513");
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
		student.setId(1);
		System.err.println(student.toString());
		System.out.println(studentService.save(student).getMsg());*/
		
		/*List<Student> students = studentService.findAll();
		for(Student student1 : students) {
			System.out.println(student1.getId());
            System.out.println(student1.getName());
            System.out.println(student1.getAccount());
            
            System.out.println(student1.getStuIdeal());
            System.out.println(student1.getStuBirthday());
            //student1.setStuBirthday(student1.getStuBirthday());
            Set<Trem> trems = student1.getTrems();
            for (Trem trem : trems) {
            	System.out.println(trem.getSemester());
				System.out.println(trem.getSmallTarget());
			}
        }*/
		
		/*User teacher = userService.get(1L);
		Profession profession = new Profession("2");
		Classes classes1 = new Classes();
		classes1.setcName("软件162");
		classes1.setGrade("2018");
		classes1.setId(0);
		classes1.setProfession(profession);
		classes1.setTeacher(teacher);
		System.out.println(classesService.save(classes1).getMsg());
		List<Classes> classes3 = classesService.findAll();
		for(Classes classes2 : classes3) {
            System.out.println(classes2.getcName());
            System.out.println(classes2.getGrade());
            System.out.println(classes2.getId());
            System.out.println(classes2.getProfession().getProfsName());
            System.out.println(classes2.getTeacher().getName());
        }*/
	}

}
