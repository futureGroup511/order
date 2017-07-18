/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月21日 下午4:46:53   
 * @Description: 餐桌类或房间类 (因为和注解的Table冲突，所以命名Tables)
 * 
 */  
package com.future.order.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tb_tables")
public class Tables {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(length=10)
	private String name;
	@Column(length=10)
	private String status;//是否有人（待定）,1：有人，0：空闲
	@Column(length=255)
	private String remark;//备注（备用）
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	/**
	 * @return the remark
	 */
	public String getRemark() {
		return remark;
	}
	/**
	 * @param remark the remark to set
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	@Override
	public String toString() {
		return "Table [id=" + id + ", name=" + name + ", status=" + status + ", remark=" + remark + "]";
	}
	
}
