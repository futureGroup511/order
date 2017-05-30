/**        
 * @author: 焦祥宇 

 * @date:   createDate：2017年5月22日 上午10:50:32   
 * @Description:  
 * 
 */  
package com.future.order.dao;

import java.io.UnsupportedEncodingException;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.future.order.base.BaseDao;
import com.future.order.entity.MenuType;
import com.future.order.service.IMenuTypeService;

@Service
public class MenuTypeDao  extends BaseDao<MenuType> implements IMenuTypeService {

	@Override
	public List<MenuType> getAllMenuType() {
		List<MenuType> list = new ArrayList<MenuType>();
		try{
			String hql="from MenuType";
			list=this.getEntityList(hql);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/*@Override
	public List<MenuType> ByName(String typeName) {
		System.out.println(typeName);
		if(XXX(typeName,"iso8859-1")){
			try {
				typeName = new String(typeName.getBytes("iso8859-1"),"utf8");
				System.out.println("eee"+typeName);
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		String hql="from MenuType m where m.typeName='"+typeName+"'";		
		return this.getEntityList(hql);
	}
	
	*//**
	 * @author 丁赵雷
	 * @date 2017/5/30 21:17
	 * @param str 需要判断的字符串
	 * @param charset 字符集
	 * @return
	 * 判断该字符串是哪种字符集
	 *//*
	public static boolean garbled(String str,String charset){
		boolean flag = false;
		
		try {
			if(str.equals(new String(str.getBytes(charset) , charset))){
				return true;
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return flag;
	}
	*/
	
	
}
