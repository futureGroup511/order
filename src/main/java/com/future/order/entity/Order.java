/**        
 * @author: 焦祥宇 

 * @date:   createDate：2017年5月21日 下午5:20:11   
 * @Description: 订单类 
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
@Entity
@Table(name="tb_order")
public class Order implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
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
	private String status;//订单状态（未处理，处理中，未付款，已付款）
	private Date createDate;//下单时间
	@Column(length=255)
	private String remark;//备注
	//记录哪个厨师做的这个订单
	@Column(length=10)
	private int cookId;//厨师id，
	@Column(length=10)
	private String cookName;//厨师名称
	@Column(length=10)
	private double favourable;//优惠金额
	@Column(length=10)
	private double price;//优惠后金额
	@Column(length=20)
	private String payway;//支付方式
	//张金高加
	@Column(length=10)
	private int cashierId;//收银员ID
	@Column(length=10)
	private String cashierName;//收银员名字
	
	/**
	 * @return the favourable
	 */
	public double getFavourable() {
		return favourable;
	}

	/**
	 * @param id the favourable to set
	 */
	public void setFavourable(double favourable) {
		this.favourable = favourable;
	}
	/**
	 * @return the price
	 */
	public double getPrice() {
		return price;
	}

	/**
	 * @param id the price to set
	 */
	public void setPrice(double price) {
		this.price = price;
	}
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
	
	public String getPayway() {
		return payway;
	}

	public void setPayway(String payway) {
		this.payway = payway;
	}

	public int getCashierId() {
		return cashierId;
	}

	public void setCashierId(int cashierId) {
		this.cashierId = cashierId;
	}

	public String getCashierName() {
		return cashierName;
	}

	public void setCashierName(String cashierName) {
		this.cashierName = cashierName;
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", tableId=" + tableId + ", tableName=" + tableName + ", total=" + total
				+ ", status=" + status + ", createDate=" + createDate + ", remark=" + remark + ", cookId=" + cookId
				+ ", cookName=" + cookName + ", favourable=" + favourable + ", price=" + price + ", payway=" + payway
				+ "]";
	}

}
