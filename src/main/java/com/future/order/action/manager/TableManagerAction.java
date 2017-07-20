  package com.future.order.action.manager;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.struts2.ServletActionContext;

import com.future.order.base.BaseAction;
import com.future.order.entity.Tables;
import com.future.order.entity.User;
import com.future.order.util.PageCut;

import net.glxn.qrgen.QRCode;
import net.glxn.qrgen.image.ImageType;


public class TableManagerAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	private Tables table;
	private int page=1;
	private String name;
	private int id;
	private String pass;
	private String replace;
	@Override
	public String execute() throws Exception {
		PageCut<Tables> pCut=tablesService.getPageCut(page,8);
		request.put("allTables", pCut);
		if(pCut.getData().size()==0){
			String mark="没有餐桌";
			request.put("managerMsg", mark);
		}
		request.put("adss", "execute");
		User user = (User)session.get("user");	//张金高改，添加收银员查看餐桌情况
		if(user.getSort().equals("cashier")){
			return "cashierMTables";
		}
		return SUCCESS;
	}
	
	public String addTable() throws IOException{
		table.setStatus("无人");
		boolean boo = tablesService.addTable(table);
		if(boo){
			request.put("addTableMsg", "添加成功");
			String tablename=table.getName();
			SomeCard(tablename);
		} else {
			request.put("addTableMsg", "添加失败,餐桌名称重复");
		}
		return "addTable";
	}
	
	public String  toUpdateTable() {
		int id = table.getId();
		Tables updateTables = tablesService.get(id);//得到被修改的餐桌信息
		request.put("updateTables", updateTables);
		return "toUpdateTables";
	}
	
	public String updateTable() throws IOException{
		boolean boo = tablesService.updateTables(table);
		String updateTableMsg = "修改失败";
		if(boo){
			updateTableMsg = "修改成功";
			String tablename=table.getName();
			SomeCard(tablename);
		}
		request.put("managerMsg", updateTableMsg);
		request.put("TableMsg", updateTableMsg);
		PageCut<Tables> pCut=tablesService.getPageCut(page,8);
		request.put("allTables", pCut);
		if(pCut.getData().size()==0){
			String mark="没有餐桌";
			request.put("managerMsg", mark);
		}
		return "updateTable";
	}
	
	public String deleteTable() {
		boolean boo = tablesService.deleteTable(table);
		String deleteTableMsg = "删除失败";
		if(boo){
			deleteTableMsg = "删除成功";
		}
		request.put("managerMsg", deleteTableMsg);
		PageCut<Tables> pCut=tablesService.getPageCut(page,8);
		request.put("allTables", pCut);
		if(pCut.getData().size()==0){
			String mark="没有餐桌";
			request.put("managerMsg", mark);
		}
		return "deleteTable";
	}
	public String allCard() throws IOException{
		List<Tables> list = tablesService.CheckName();
		@SuppressWarnings("unused")
		HttpServletResponse response = ServletActionContext.getResponse();
		 for(int i=0;i<list.size();i++){
			 int j=list.get(i).getId();//http://localhost:8080/order/customer/customer_toIndex?id="+j
			  String name=list.get(i).getName();
			  HttpServletRequest quest = ServletActionContext.getRequest();
			  String path= quest.getScheme() + "://"+ quest.getServerName() + ":" + quest.getServerPort()+ quest.getContextPath() + "/"; 
			 ByteArrayOutputStream out = QRCode.from(path+"customer/customer_toIndex?id="+j).to(  
		               ImageType.PNG).stream();  
		       FileOutputStream fout = new FileOutputStream(new File("D:\\"+name+".jpg"));
				fout.write(out.toByteArray());
				fout.flush();
				fout.close();
				String mark="二维码生成成功,请返回下载";
				request.put("managerMsg", mark); 
		 }
		return "QR_card";
	}
	 public String SomeCard(String tablename) throws IOException{
		 HttpServletResponse response = ServletActionContext.getResponse();
		 HttpServletRequest quest = ServletActionContext.getRequest();
		  String path= quest.getScheme() + "://"+ quest.getServerName() + ":" + quest.getServerPort()+ quest.getContextPath() + "/"; 
		 ByteArrayOutputStream out = QRCode.from(path+"customer/customer_toIndex?id="+id).to(  
	               ImageType.PNG).stream();
		 	String realPath = quest.getSession().getServletContext().getRealPath("uploadImg");
	       FileOutputStream fout = new FileOutputStream(new File(realPath+"\\"+tablename+".jpg"));
			fout.write(out.toByteArray());
			fout.flush();
			fout.close();
			request.put("managerMsg", "二维码生成成功");
			return SUCCESS;
	 }
	public String Inquiry(){
		PageCut<Tables> pCut=new PageCut<Tables>();
		if(pass!=null){
			pCut=tablesService.getSomePageCut(page,8,pass,replace);
			}else{
				pass=(String) session.get("pass");
				replace=(String) session.get("replace");
				pCut=tablesService.getSomePageCut(page,8,pass,replace);
			}
		request.put("allTables", pCut);
		if(pCut.getData().size()==0){
			String mark="没有你搜索的餐桌";
			request.put("managerMsg", mark);
		}
		request.put("adss", "Inquiry");		
		session.put("pass", pass);
		session.put("replace", replace);
		User user = (User)session.get("user");
		if(user.getSort().equals("cashier")){
			return "cashierMTables";
		}
		return SUCCESS;
		
	}
	public String download() throws Exception{	
		 HttpServletResponse response = ServletActionContext.getResponse();
		 HttpServletRequest quest = ServletActionContext.getRequest();
		 Tables table=	 tablesService.getImurl(id);
		String fileName = table.getName()+".jpg";
		//解决get方式中文乱码
		//获得文件的绝对路径
		String realPath = quest.getSession().getServletContext().getRealPath("uploadImg");
		//创建文件对象
		File file = new File(realPath,fileName);
		if(!file.exists()){
			request.put("managerMsg", "二维码不存在，请先生成二维码");
			return execute();
		}
		try {
			response.addHeader("content-disposition","attachment;filename="+URLEncoder.encode(fileName,"utf-8"));
			IOUtils.copy(new FileInputStream(file),response.getOutputStream());
			return null;
		} catch (Exception e) {
			String mark="二维码下载失败";
			request.put("managerMsg", mark);
			return "QR_card";
		}		
	}
	public Tables getTable() {
		return table;
	}

	public void setTable(Tables table) {
		this.table = table;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getReplace() {
		return replace;
	}

	public void setReplace(String replace) {
		this.replace = replace;
	}
	
}
