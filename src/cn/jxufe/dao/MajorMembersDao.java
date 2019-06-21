package cn.jxufe.dao;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import cn.jxufe.entity.MajorMembers;

public interface MajorMembersDao extends JpaRepository<MajorMembers, Long>{

	
}
