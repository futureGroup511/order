package com.future.order.action.manager;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.future.order.base.BaseAction;

import net.glxn.qrgen.QRCode;
import net.glxn.qrgen.image.ImageType;



/**
 * 
 * @author 金高
 *
 */
public class ChangeAction extends BaseAction{
	
	//用户模块中转站
	public String addUser() {	
		return "addUser";
	}
	//配料模块中转站
	public String addIngredient(){
		return "addIngredient";
	}
	//菜品模块中转站
	public String addMenu(){
		return "addMenu";
	}
	public String addMenuType(){
		return "addMenuType";
	}
	//餐桌中转站
	public String addTable(){
		return "addTable";
	}
	//获得个人资料
	public String getMyself(){
		return "getMyself";
	}
	//退出登录前,防倒退
	public String logOff(){
		return "logOff";
	}
	//退出登录
	public String out(){
		return "out";
	}
	public String addStocks(){
		return "addstock";
	}
	public void ad() throws IOException{
		 HttpServletResponse response = ServletActionContext.getResponse();
        ByteArrayOutputStream out = QRCode.from("scsf").to(  
                ImageType.PNG).stream();
        response.setContentType("image/png");  
        response.setContentLength(out.size());  
        FileOutputStream fout = new FileOutputStream(new File("D:\\123.jpg"));

		fout.write(out.toByteArray());

		fout.flush();
		fout.close();
        
        OutputStream outStream = response.getOutputStream();  
   
        outStream.write(out.toByteArray());  
   
        outStream.flush();  
        outStream.close(); 
        System.out.println("结束");
	}
}
