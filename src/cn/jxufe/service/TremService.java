package cn.jxufe.service;

import cn.jxufe.entity.Student;
import cn.jxufe.entity.Trem;

public interface TremService extends QueryService<Trem>{
	/**
	 * 保存一个实例对象
	 * @param trem实例对象
	 * @return Message 返回保存结果的信息，成功或失败
	 */
	public Trem save(Trem trem);
	/**
	 * 通过学生和学期号查找一个学期
	 * @param student 学生实例
	 * @param semester 学期号
	 * @return 学期实例
	 */
	public Trem findByStudentAndSemester(Student student,Integer semester);
}