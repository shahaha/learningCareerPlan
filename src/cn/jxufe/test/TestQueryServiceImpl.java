package cn.jxufe.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import cn.jxufe.entity.Classes;
import cn.jxufe.service.ClassesService;
import cn.jxufe.service.TargetService;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class TestQueryServiceImpl {
	@Autowired
	TargetService targetService;
	@Autowired
	ClassesService classesService;
	
	@Test
	public void test() {
		System.out.println(targetService.get(2L).getTargetCaption());
		List<Classes> classes = classesService.findAll();
		for(Classes classe : classes) {
            System.out.println(classe.getName());
            System.out.println(classe.getGrade());
            System.out.println(classe.getId());
            System.out.println(classe.getProfession().getProfsName());
            System.out.println(classe.getTeacher().getName());
        }
	}

}
