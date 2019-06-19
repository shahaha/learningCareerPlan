package cn.jxufe.test;

import java.util.Set;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import cn.jxufe.entity.Role;
import cn.jxufe.entity.User;
import cn.jxufe.service.UserService;


@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class TestUserRole {

	@Autowired
	UserService userService;
	@Test
	public void test() {
		User user = userService.get(24L);
		System.out.println(user.getAccount());
		System.out.println(user.getName());
		Set<Role> roles = user.getRoles();
		for (Role role : roles) {
			System.out.println(role.getRole());
		}
		
	}

}
