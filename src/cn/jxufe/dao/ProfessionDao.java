package cn.jxufe.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import cn.jxufe.entity.Profession;

public interface ProfessionDao extends JpaRepository<Profession, Long>{
     
	public Profession findByProfsName(String profsName);
}
