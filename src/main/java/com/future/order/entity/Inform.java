/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月21日 下午8:56:51   
 * @Description:通知类  
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
@Table(name="tb_inform")
public class Inform implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(length=10)
	private int tableId;//餐桌id
	@Column(length=10)
	private String tableName;//餐桌名称
	@Column(length=255)
	private String content;//通知内容
	private Date createDate;//发布时间
	
	public Inform(int tableId, String tableName, String content, Date createDate) {
		this.tableId = tableId;
		this.tableName = tableName;
		this.content = content;
		this.createDate = createDate;
	}
	
	public Inform() {
	
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
	 * @return the content
	 */
	public String getContent() {
		return content;
	}
	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		this.content = content;
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
	@Override
	public String toString() {
		return "Inform [id=" + id + ", tableId=" + tableId + ", tableName=" + tableName + ", content=" + content
				+ ", createDate=" + createDate + "]";
	}
	
}
