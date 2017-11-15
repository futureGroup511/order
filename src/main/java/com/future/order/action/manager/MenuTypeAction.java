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
import com.future.order.entity.Menu;
import com.future.order.entity.MenuType;
import com.future.order.util.PageCut;

public class MenuTypeAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	private int page = 1;
	private int id;	//获得菜品类型id
	private MenuType menutype;	
	private String inquiry;	//获得查询的内容
	private List<File> file;	// 上传文件集合
	private List<String> fileFileName;	// 上传文件名集合
	private List<String> fileContentType;	// 上传文件内容类型集合

	public String execute() {		//遍历菜品类型，分页
		PageCut<MenuType> pCut = new PageCut<MenuType>();
		pCut = menuTypeService.getPageCut(page,7);
		if (pCut.getData().size() == 0) {
			String mark = "没有菜品类型";
			request.put("mark", mark);
		}
		request.put("adss", "execute");
		request.put("pc", pCut);
		return "check";
	}

	public String addType() throws FileNotFoundException, IOException {	//添加菜品
		int count=menuTypeService.getCount();
		String mark = "操作失败";
		if(count<8){
			if(file!=null){
				for (int i = 0; i < file.size(); i++) {
					// 循环上传每个文件
					uploadFile(i);
				}
			}
			boolean sign = menuTypeService.addType(menutype);
			if (sign == true) {
				mark = "添加成功";
			} else {
				mark = "添加失败,名称重复";
			}
		}else{
			mark="已有八条数据，只能修改，不可添加了";
		}		
		request.put("mark", mark);
		return "add";
	}

	public String toUpdateType() {// 根据ID获得需要修改的订单信息
		MenuType menutype = menuTypeService.CheckById(id);
		request.put("menutype", menutype);
		return "update";
	}

	public String Update() throws FileNotFoundException, IOException {	//修改菜品类型
		boolean sign=true;
		String mark = "修改失败";
		MenuType menuTypeDb = menuTypeService.CheckById(menutype.getId());
		if(menuTypeDb!=null&&!menuTypeDb.getName().equals(menutype.getName())){
			MenuType menuTypeCheckName = menuTypeService.getByName(menutype.getName());
			sign = false;
			mark = "修改失败，该菜品类型已存在";
			if(menuTypeCheckName==null){
				mark = "修改失败";
				sign = true;
			}
		}
		if(file==null||file.equals("")){
			menutype.setImgUrl(menutype.getImgUrl());
		}else{
			for (int i = 0; i < file.size(); i++) {
				// 循环上传每个文件
				uploadFile(i);
			}
		}
		if(sign){
			sign = menuTypeService.UpdateType(menutype);
			if (sign) {
				mark = "修改成功";
			}
		}
		request.put("mark", mark);
		return this.execute();
	}

	public String Inquiry() {	//条件查询
		PageCut<MenuType> pCut = new PageCut<MenuType>();
		if (inquiry == null) {
			inquiry = (String) session.get("inquiry");
		}
		pCut = menuTypeService.getSomePageCut(page, 7, inquiry);
		if (pCut.getData().size() == 0) {
			String mark = "没有菜品的类型";
			request.put("mark", mark);
		}
		request.put("adss", "Inquiry");
		session.put("inquiry", inquiry);
		request.put("pc", pCut);
		return "check";
	}

	private void uploadFile(int i) throws FileNotFoundException, IOException {	// 执行上传功能
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
			menutype.setImgUrl(fileName);
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

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public MenuType getMenutype() {
		return menutype;
	}

	public void setMenutype(MenuType menutype) {
		this.menutype = menutype;
	}

	public String getInquiry() {
		return inquiry;
	}

	public void setInquiry(String inquiry) {
		this.inquiry = inquiry;
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
