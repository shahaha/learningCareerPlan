package cn.jxufe.service;

import java.util.List;

import cn.jxufe.bean.Message;
import cn.jxufe.entity.MajorMembers;
import cn.jxufe.entity.Student;
public interface MajorMembersService extends QueryService<MajorMembers>{
	/**
	 * 保存家庭成员信息
	 * @param majorMembers 实例对象
	 * @return
	 */
	public Message save(MajorMembers majorMembers);
	/**
	 * 删除家庭成员信息
	 * @param id 要删除的实体ID
	 * @return
	 */
	public Message delete(Long id);
	/**
	 * 按学生查找家庭成员
	 * @param student 学生
	 * @return Student类的实体集
	 */
	public List<MajorMembers> findByStudent(Student student);
}