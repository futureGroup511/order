/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月21日 下午8:53:20   
 * @Description:通知类  
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
@Table(name="tb_shopcart")
public class ShopCart {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(length=10)
	private int tableId;//餐桌id
	@Column(length=10)
	private String tableName;//餐桌名称
	@Column(length=10)
	private int menuId;//菜品id
	@Column(length=10)
	private String menuName;//菜品名称
	@Column(length=5)
	private int menuNum;//该菜品数量
	@Column(length=10)
	private double price;//单价
	@Column(length=5)
	private int num;//数量（待定）
	@Column(length=255)
	private String remark;//备注
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
	 * @return the tableId
	 */
	public int getTableId() {
		return tableId;
	}
	/**
	 * @param tableId the tableId to set
	 */
	public void setTableId(int tableId) {
		this.tableId = tableId;
	}
	/**
	 * @return the tableName
	 */
	public String getTableName() {
		return tableName;
	}
	/**
	 * @param tableName the tableName to set
	 */
	public void setTableName(String tableName) {
		this.tableName = tableName;
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
	 * @return the price
	 */
	public double getPrice() {
		return price;
	}
	/**
	 * @param price the price to set
	 */
	public void setPrice(double price) {
		this.price = price;
	}
	/**
	 * @return the num
	 */
	public int getNum() {
		return num;
	}
	/**
	 * @param num the num to set
	 */
	public void setNum(int num) {
		this.num = num;
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
	
	/**
	 * @return the menuNum
	 */
	public int getMenuNum() {
		return menuNum;
	}
	/**
	 * @param menuNum the menuNum to set
	 */
	public void setMenuNum(int menuNum) {
		this.menuNum = menuNum;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "ShopCart [id=" + id + ", tableId=" + tableId + ", tableName=" + tableName + ", menuId=" + menuId
				+ ", menuName=" + menuName + ", menuNum=" + menuNum + ", price=" + price + ", num=" + num + ", remark="
				+ remark + "]";
	}
		
}
