package cn.jxufe.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import cn.jxufe.entity.Classes;
import cn.jxufe.entity.Profession;
import cn.jxufe.service.ClassesService;
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml","classpath:spring-mvc.xml"})
public class TestFindByXXX {
	@Autowired
	ClassesService classesService;

	@Test
	public void test() {
		Profession profession = new Profession();
		profession.setId(4L);
		List<Classes> classes = classesService.findByProfession(profession);
		for (Classes classes2 : classes) {
			System.out.println(classes2.getName());
		}
	}

}
