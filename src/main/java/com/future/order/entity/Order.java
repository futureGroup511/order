/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月21日 下午5:20:11   
 * @Description: 订单类 
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
@Table(name="tb_order")
public class Order {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(length=5)
	private int tableId;//餐桌id
	@Column(length=10)
	private String tableName;//餐桌名称
	@Column(length=10)
	private double total;//总价
	@Column(length=10)
	private String status;//订单状态（未付款，处理中，已付款）
	private Date createDate;//下单时间
	@Column(length=255)
	private String remark;//备注
	//记录哪个厨师做的这个订单
	@Column(length=10)
	private int cookId;//厨师id，
	@Column(length=10)
	private String cookName;//厨师名称
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
	 * @return the total
	 */
	public double getTotal() {
		return total;
	}
	/**
	 * @param total the total to set
	 */
	public void setTotal(double total) {
		this.total = total;
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
	 * @return the createDate
	 */
	public Date getCreateDate() {
		return createDate;
	}
	/**
	 * @param createDate the createDate to set
	 */
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
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
	
	@Override
	public String toString() {
		return "Order [id=" + id + ", tableId=" + tableId + ", tableName=" + tableName + ", total=" + total
				+ ", status=" + status + ", createDate=" + createDate + ", remark=" + remark + ", cookId=" + cookId
				+ ", cookName=" + cookName + "]";
	}
	
}
