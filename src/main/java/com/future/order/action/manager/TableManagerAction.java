  package com.future.order.action.manager;

import java.io.ByteArrayOutputStream;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.future.order.base.BaseAction;
import com.future.order.entity.Tables;
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
		PageCut<Tables> pCut=tablesService.getPageCut(page,6);
		request.put("allTables", pCut);
		if(pCut.getData().size()==0){
			String mark="没有餐桌";
			request.put("managerMsg", mark);
		}
		request.put("adss", "execute");
		return SUCCESS;
	}
	
	public String addTable(){
		table.setStatus("无人");
		boolean boo = tablesService.addTable(table);
		if(boo){
			request.put("addTableMsg", "添加成功");
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
	
	public String updateTable(){
		boolean boo = tablesService.updateTables(table);
		String updateTableMsg = "修改失败";
		if(boo){
			updateTableMsg = "修改成功";
		}
		request.put("managerMsg", updateTableMsg);
		request.put("TableMsg", updateTableMsg);
		PageCut<Tables> pCut=tablesService.getPageCut(page,3);
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
		PageCut<Tables> pCut=tablesService.getPageCut(page,3);
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
				String mark="二维码生成成功,储存地址在D盘";
				request.put("managerMsg", mark); 
		 }
		return "QR_card";
	}
	 public String SomeCard() throws IOException{
		 HttpServletResponse response = ServletActionContext.getResponse();
		 HttpServletRequest quest = ServletActionContext.getRequest();
		  String path= quest.getScheme() + "://"+ quest.getServerName() + ":" + quest.getServerPort()+ quest.getContextPath() + "/"; 
		 ByteArrayOutputStream out = QRCode.from(path+"customer/customer_toIndex?id="+id).to(  
	               ImageType.PNG).stream();
		 	name= new String(name.getBytes("ISO-8859-1"),"utf-8");
	       FileOutputStream fout = new FileOutputStream(new File("D:\\"+name+".jpg"));
			fout.write(out.toByteArray());
			fout.flush();
			fout.close();
			String mark="二维码生成成功,储存地址在D盘";
			request.put("managerMsg", mark);
			return "QR_card";
	 }
	public String Inquiry(){
		PageCut<Tables> pCut=new PageCut<Tables>();
		if(pass!=null){
			pCut=tablesService.getSomePageCut(page,3,pass,replace);
			}else{
				pass=(String) session.get("pass");
				replace=(String) session.get("replace");
				pCut=tablesService.getSomePageCut(page,3,pass,replace);
			}
		request.put("allTables", pCut);
		if(pCut.getData().size()==0){
			String mark="没有你搜索的餐桌";
			request.put("managerMsg", mark);
		}
		request.put("adss", "Inquiry");		
		session.put("pass", pass);
		session.put("replace", replace);
		return SUCCESS;
		
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
