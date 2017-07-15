/**        
 * @author: 焦祥宇 

 * @date:   createDate：2017年5月21日 下午6:20:21   
 * @Description:  订单详情类
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
@Table(name="tb_orderdetails")
public class OrderDetails {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(length=5)
	private int tableId;//餐桌id
	@Column(length=10)
	private String tableName;//餐桌名称
	@Column(length=20)
	private int orderId;//订单id
	@Column(length=5)
	private int menuId;//菜品id
	@Column(length=10)
	private String menuName;//菜品名称 
	@Column(length=5)
	private int menuNum;//该菜品数量
	@Column(length=10)
	private String status;//菜品状态（未完成，已处理，完成）
	private Date creatDate;//下单时间
	@Column(length=255)
	private String remark;//备注（备用）
	//记录哪个厨师做的这个订单
	@Column(length=10)
	private int cookId;//厨师id，
	@Column(length=10)
	private String cookName;//厨师名称
	@Column(length=255)
	private String imgUrl;
	@Column(length=20)
	private double price;//价格
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
	 * @return the orderId
	 */
	public int getOrderId() {
		return orderId;
	}
	/**
	 * @param orderId the orderId to set
	 */
	public void setOrderId(int orderId) {
		this.orderId = orderId;
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
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}
	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}
	/**
	 * @return the creatDate
	 */
	public Date getCreatDate() {
		return creatDate;
	}
	/**
	 * @param creatDate the creatDate to set
	 */
	public void setCreatDate(Date creatDate) {
		this.creatDate = creatDate;
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
	 * @return the cookId
	 */
	public int getCookId() {
		return cookId;
	}
	/**
	 * @param cookId the cookId to set
	 */
	public void setCookId(int cookId) {
		this.cookId = cookId;
	}
	/**
	 * @return the cookName
	 */
	public String getCookName() {
		return cookName;
	}
	/**
	 * @param cookName the cookName to set
	 */
	public void setCookName(String cookName) {
		this.cookName = cookName;
	}
	
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "OrderDetails [id=" + id + ", tableId=" + tableId + ", tableName=" + tableName + ", orderId=" + orderId
				+ ", menuId=" + menuId + ", menuName=" + menuName + ", menuNum=" + menuNum + ", status=" + status
				+ ", creatDate=" + creatDate + ", remark=" + remark + ", cookId=" + cookId + ", cookName=" + cookName
				+ ", imgUrl=" + imgUrl + ", price=" + price + "]";
	}
	
}
