package com.future.order.action.manager;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.future.order.base.BaseAction;
import com.future.order.entity.Restaurant;

@SuppressWarnings("serial")
public class RestaurantAction extends BaseAction {
	private Restaurant restaurant;//得到餐厅实体类的对象
	// 上传文件集合
		private List<File> file;
		// 上传文件名集合
		private List<String> fileFileName;
		// 上传文件内容类型集合
		private List<String> fileContentType;
	public String execute(){//查询餐厅的信息
		@SuppressWarnings("unused")
		Restaurant restaurants=restaurantService.SelectAll();
		request.put("restaurants", restaurants);
		return "check";
	}
	public String toUpdate(){//查询餐厅的信息，用于修改
		Restaurant restaurantss=restaurantService.SelectAll();
		request.put("rest", restaurantss);
		return "update";		
	}
	public String Update() throws FileNotFoundException, IOException{//修改餐厅的信息
		boolean sign=false;
		if(file==null||file.equals("")){
			Restaurant rest=restaurantService.SelectAll();
			restaurant.setImgUrl(rest.getImgUrl());
			 sign = restaurantService.updateRestaurant(restaurant);			
		}else{
			for (int i = 0; i < file.size(); i++) {
				// 循环上传每个文件
				uploadFile(i);
			}
			 sign = restaurantService.updateRestaurant(restaurant);
		}
		if(sign){
			request.put("addrest", "修改成功");
		}else{
			request.put("addrest", "修改失败");
		}	
		return execute();	
	}
	//添加餐厅的信息
	public String AddRestaurant() throws FileNotFoundException, IOException{
		int count=restaurantService.Select();
		boolean sign=false;
		if(file==null||file.equals("")){
			if(count==0){
//				Restaurant rest=restaurantService.SelectAll();
//				if(rest.getImgUrl()!=null||!(rest.getImgUrl().equals(""))){
//					System.out.println("656566454654654654654465");
//					restaurant.setImgUrl(rest.getImgUrl());
//				}				
				 sign = restaurantService.updateRestaurant(restaurant);	
					request.put("addrest", "添加成功");
			}else{
				request.put("addrest", "已经添加过餐厅，只能修改");
			}		
		}else{
			if(count==0){
				for (int i = 0; i < file.size(); i++) {
					// 循环上传每个文件
					uploadFile(i);
				}
				 sign = restaurantService.addRestaurant(restaurant);
					request.put("addrest", "添加成功");
			}else{
				request.put("addrest", "已经添加过餐厅，只能修改");
			}
		}
		
		return "add";		
	}
	// 执行图片上传功能
		private void uploadFile(int i) throws FileNotFoundException, IOException {
			try {
				InputStream in = new FileInputStream(file.get(i));
				String dir = ServletActionContext.getRequest().getRealPath("uploadImg");
				File fileLocation = new File(dir);
				// 此处也可以在应用根目录手动建立目标上传目录
				if (!fileLocation.exists()) {
					boolean isCreated = fileLocation.mkdir();
					if (!isCreated) {
						// 目标上传目录创建失败,可做其他处理,例如抛出自定义异常等,一般应该不会出现这种情况。
						return;
					}
				}
				String fileName = this.getFileFileName().get(i);
				restaurant.setImgUrl(fileName);
				File uploadFile = new File(dir, fileName);
				OutputStream out = new FileOutputStream(uploadFile);
				byte[] buffer = new byte[1024 * 1024];
				int length;
				while ((length = in.read(buffer)) > 0) {
					out.write(buffer, 0, length);
				}
				in.close();
				out.close();
			} catch (Exception ex) {
				System.out.println("上传失败!");
				ex.printStackTrace();
			}
		}
	public Restaurant getRestaurant() {
		return restaurant;
	}

	public void setRestaurant(Restaurant restaurant) {
		this.restaurant = restaurant;
	}
	public List<File> getFile() {
		return file;
	}
	public void setFile(List<File> file) {
		this.file = file;
	}
	public List<String> getFileFileName() {
		return fileFileName;
	}
	public void setFileFileName(List<String> fileFileName) {
		this.fileFileName = fileFileName;
	}
	public List<String> getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(List<String> fileContentType) {
		this.fileContentType = fileContentType;
	}
	
}
