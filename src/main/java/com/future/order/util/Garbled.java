/**
	 * @author 丁赵雷
	 * @date 2017/5/30 21:17
	 * @param str 需要判断的字符串
	 * @param charset 字符集
	 * @return
	 * 判断该字符串是哪种字符集
	 */
package com.future.order.util;

import java.io.UnsupportedEncodingException;

public class Garbled {

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
	//在你的dao层用的例子
	/*public List<MenuType> ByName(String typeName) {
		System.out.println(typeName);
		if(garbled(typeName,"iso8859-1")){
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
	}*/
	
}
