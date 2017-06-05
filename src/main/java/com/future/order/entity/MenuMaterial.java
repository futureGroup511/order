/**        

 * @author: 焦祥宇 

 * @date:   createDate：2017年5月21日 下午6:54:46   
 * @Description:  菜品原料类
 * 
 */  
package com.future.order.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="tb_menumaterial")
public class MenuMaterial {
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
	private Date stockDate;//进货时间（方便查询菜品的配料进货时间）
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
	
	@Override
	public String toString() {
		return "MenuMaterial [id=" + id + ", menuId=" + menuId + ", menuName=" + menuName + ", ingId=" + ingId
				+ ", ingName=" + ingName + ", num=" + num + ", stockDate=" + stockDate + "]";
	}
	
	
}
