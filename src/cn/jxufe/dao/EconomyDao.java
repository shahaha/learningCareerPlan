package cn.jxufe.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import cn.jxufe.entity.Economy;

public interface EconomyDao extends JpaRepository<Economy, Long> {

}
