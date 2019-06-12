package cn.jxufe.service;

import cn.jxufe.bean.Message;
import cn.jxufe.entity.Student;

public interface StudentService extends QueryService<Student>{
	/**
	 * 保存一个实例对象
	 * @param student实例对象
	 * @return Message 返回保存结果的信息，成功或失败
	 */
	public Message save(Student student);
}