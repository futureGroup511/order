package com.future.order.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="tb_domain")
public class Domain implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(length=255)
	private String ip;//ip或域名
	
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param createDate the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return the id
	 */
	public String getIp() {
		return ip;
	}
	/**
	 * @param createDate the ip to set
	 */
	public void setIp(String ip) {
		this.ip = ip;
	}
	@Override
	public String toString() {
		return "Domain [id=" + id + ", ip=" + ip + "]";
	}
	
}
