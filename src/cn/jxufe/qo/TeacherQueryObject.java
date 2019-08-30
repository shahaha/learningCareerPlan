package cn.jxufe.qo;

import cn.jxufe.entity.Classes;
import cn.jxufe.entity.Target;

/**
 * 查询实体，属性即是查询条件
 * @author me 
 */
public class TeacherQueryObject {
	
	/**
	 * 查询班级
	 */
	private Classes classes;
	
	/**
	 * 查询目标
	 */
	private Target target;
	
	/**
	 * 查询状态
	 */
	private Integer tremState;

	public Classes getClasses() {
		return classes;
	}

	public void setClasses(Classes classes) {
		this.classes = classes;
	}

	public Target getTarget() {
		return target;
	}

	public void setTarget(Target target) {
		this.target = target;
	}

	public Integer getTremState() {
		return tremState;
	}

	public void setTremState(Integer tremState) {
		this.tremState = tremState;
	}

	@Override
	public String toString() {
		return "TeacherQueryObject [classes=" + classes + ", target=" + target + ", tremState=" + tremState + "]";
	}

	
	
	
}
