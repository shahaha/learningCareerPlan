package cn.jxufe.service;

import cn.jxufe.bean.Message;
import cn.jxufe.entity.MajorMembers;
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
}