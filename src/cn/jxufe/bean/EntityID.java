package cn.jxufe.bean;
import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;



/**
 * 具有相同性质主键的实体类的父类
 * @author me
 */
@MappedSuperclass
public class EntityID implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 7702404585871978863L;
	/**
	 * 继承它的类的主键
	 */
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(nullable = false, updatable = false)
    protected long id;
    
    public long getId() {
        return id;
    }
    public void setId(long id) {
        this.id = id;
    }     
}