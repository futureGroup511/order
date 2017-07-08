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

public class MenuManagerAction extends BaseAction {

	private Menu menu;
	private int page = 1;

	// 上传文件集合
	private List<File> file;
	// 上传文件名集合
	private List<String> fileFileName;
	// 上传文件内容类型集合
	private List<String> fileContentType;

	public String execute() {
		PageCut<Menu> pCut = menuService.getPageCut(page, 6);
		request.put("allMenu", pCut);
		if(pCut.getData().size()==0){
			String mark="没有菜品了，着急着急(｡•ˇ‸ˇ•｡)(｡•ˇ‸ˇ•｡)";
			request.put("deleteMenuMsg", mark);
		}
		return SUCCESS;
	}
	
	public String addMenu() throws Exception{
		String typeName=menu.getTypeName();
		List<MenuType> list=(List<MenuType>) session.get("Typelist");
		for(int i=0;i<list.size();i++){
			if(list.get(i).getName().equals(typeName)){
				menu.setTypeId(list.get(i).getId());
			}
		}
		for (int i = 0; i < file.size(); i++) {
			// 循环上传每个文件
			uploadFile(i);
		}
		boolean boo = menuService.addMenu(menu);
		if(boo){
			request.put("addMsg", "添加成功");
		} else {
			request.put("addMsg", "添加失败！该菜已被添加过");
		}
		return "addMenu";
	}
	
	//查看菜品详情
	public String toUpdateMenu(){
		int id = menu.getId();
		Menu menu = menuService.get(id);
		@SuppressWarnings("unchecked")
		List<MenuType> list = (List<MenuType>) session.get("Typelist");
		for(int i=0;i<list.size();i++){
			if(list.get(i).equals(menu.getTypeName())){
				request.put("select", i);
			}
		}
		request.put("updateMenu", menu);
		return "toUpdateMenu";
	}

	// 修改菜品
	public String updateMenu() {
		boolean boo = menuService.updateUser(menu);
		if (boo) {
			request.put("updateMsg", "修改成功");
		} else {
			request.put("updateMsg", "修改失败");
		}
		PageCut<Menu> pCut = menuService.getPageCut(page, 6);
		request.put("allMenu", pCut);
		return "updateMenu";
	}

	// 删除菜品
	public String deleteMenu() {
		String imgPath = ServletActionContext.getRequest().getRealPath("uploadImg")+"/"+menu.getImgUrl();
		boolean boo = menuService.deleteMenu(menu);
		File imgFile = new File(imgPath);
		if(imgFile.exists()){
			imgFile.delete(); 		//删除该记录时删除对应的图片
		}
		if (boo) {
			request.put("deleteMenuMsg", "删除成功");
		} else {
			request.put("deleteMenuMsg", "删除失败");
		}
		PageCut<Menu> pCut = menuService.getPageCut(page, 6);
		request.put("allMenu", pCut);
		return "deleteUser";
	}

	// 执行上传功能
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
			menu.setImgUrl(fileName);
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

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
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
