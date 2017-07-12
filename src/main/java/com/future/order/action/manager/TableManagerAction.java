package com.future.order.action.manager;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.mapping.Array;

import com.future.order.base.BaseAction;
import com.future.order.entity.Tables;
import com.future.order.util.PageCut;

import net.glxn.qrgen.QRCode;
import net.glxn.qrgen.image.ImageType;

public class TableManagerAction extends BaseAction {
	
	private Tables table;
	private int page=1;
	private String name;
	private int id;
	@Override
	public String execute() throws Exception {
		PageCut<Tables> pCut=tablesService.getPageCut(page,3);
		request.put("allTables", pCut);
		if(pCut.getData().size()==0){
			String mark="还没有餐桌哦(｡•ˇ‸ˇ•｡)(｡•ˇ‸ˇ•｡)";
			request.put("managerMsg", mark);
		}
		return SUCCESS;
	}
	
	public String addTable(){
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
		request.put("TableMsg", updateTableMsg);
		PageCut<Tables> pCut=tablesService.getPageCut(page,3);
		request.put("allTables", pCut);
		if(pCut.getData().size()==0){
			String mark="还没有餐桌哦(｡•ˇ‸ˇ•｡)(｡•ˇ‸ˇ•｡)";
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
		request.put("TableMsg", deleteTableMsg);
		PageCut<Tables> pCut=tablesService.getPageCut(page,3);
		request.put("allTables", pCut);
		if(pCut.getData().size()==0){
			String mark="还没有餐桌哦(｡•ˇ‸ˇ•｡)(｡•ˇ‸ˇ•｡)";
			request.put("managerMsg", mark);
		}
		return "deleteTable";
	}
	public String AllCard() throws IOException{
		List<Tables> list = tablesService.CheckName();
		HttpServletResponse response = ServletActionContext.getResponse();
		 for(int i=0;i<list.size();i++){
			 int j=list.get(i).getId();//http://localhost:8080/order/customer/customer_toIndex?id="+j
			  String name=list.get(i).getName();
			 ByteArrayOutputStream out = QRCode.from("http://localhost:8080/order/customer/customer_toIndex?id="+j).to(  
		               ImageType.PNG).stream();  
		       FileOutputStream fout = new FileOutputStream(new File("D:\\"+name+".jpg"));
				fout.write(out.toByteArray());
				fout.flush();
				fout.close();      
				String mark="二维码生成成功,储存地址在D盘";
				request.put("managerMsg", mark);
		       System.out.println("结束");
		 }
		return "QR_card";
	}
	 public String SomeCard() throws IOException{
		 HttpServletResponse response = ServletActionContext.getResponse();
		 ByteArrayOutputStream out = QRCode.from("http://localhost:8080/order/customer/customer_toIndex?id="+id).to(  
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
	
}
