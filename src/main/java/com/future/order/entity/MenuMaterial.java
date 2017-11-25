/**        

 * @author: 焦祥宇 

 * @date:   createDate：2017年5月21日 下午6:54:46   
 * @Description:  菜品原料类
 * 
 */  
package com.future.order.entity;


import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
@Entity
@Table(name="tb_menumaterial")
public class MenuMaterial implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(length=5)
	private int menuId;//菜品id
	@Column(length=10)
	private String menuName;//菜品名称
	@Column(length=5)
	private int ingId;//配料id
	@Column(length=10)
	private String ingName;//配料名称	
	@Column(length=10)
	private double num;//需求量
	@Column(length=5)
	private String type;//配料类型，（原料，配料）
	private Date stockDate;//进货时间
	@Transient
	private String introduce;//简介（临时属性，不存数据库）
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
	 * @return the menuId
	 */
	public int getMenuId() {
		return menuId;
	}
	/**
	 * @param menuId the menuId to set
	 */
	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}
	/**
	 * @return the menuName
	 */
	public String getMenuName() {
		return menuName;
	}
	/**
	 * @param menuName the menuName to set
	 */
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	/**
	 * @return the ingId
	 */
	public int getIngId() {
		return ingId;
	}
	/**
	 * @param ingId the ingId to set
	 */
	public void setIngId(int ingId) {
		this.ingId = ingId;
	}
	/**
	 * @return the ingName
	 */
	public String getIngName() {
		return ingName;
	}
	/**
	 * @param ingName the ingName to set
	 */
	public void setIngName(String ingName) {
		this.ingName = ingName;
	}
	/**
	 * @return the num
	 */
	public double getNum() {
		return num;
	}
	/**
	 * @param num the num to set
	 */
	public void setNum(double num) {
		this.num = num;
	}
	
	/**
	 * @return the stockDate
	 */
	public Date getStockDate() {
		return stockDate;
	}
	/**
	 * @param stockDate the stockDate to set
	 */
	public void setStockDate(Date stockDate) {
		this.stockDate = stockDate;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}	
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	@Override
	public String toString() {
		return "MenuMaterial [id=" + id + ", menuId=" + menuId + ", menuName=" + menuName + ", ingId=" + ingId
				+ ", ingName=" + ingName + ", num=" + num + ", type=" + type + ", stockDate=" + stockDate
				+ ", introduce=" + introduce + "]";
	}

	
	
	
}
