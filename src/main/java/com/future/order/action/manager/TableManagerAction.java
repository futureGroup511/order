  package com.future.order.action.manager;

import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.URLEncoder;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.struts2.ServletActionContext;

import com.future.order.base.BaseAction;
import com.future.order.entity.Tables;
import com.future.order.util.PageCut;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;
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
	private String sort;//判断用户的身份
	@Override
	public String execute() throws Exception {
		PageCut<Tables> pCut=tablesService.getPageCut(page,8);
		request.put("allTables", pCut);
		if(pCut.getData().size()==0){
			String mark="没有餐桌";
			request.put("managerMsg", mark);
		}
		request.put("adss", "execute");
		if(sort!=null&&sort.equals("cashier")){//张金高改，添加收银员查看餐桌情况
			return "cashierMTables";
		}
		return SUCCESS;
	}
	
	public String addTable() throws IOException{
		table.setStatus("无人");
		boolean boo = tablesService.addTable(table);
		if(boo){
			request.put("addTableMsg", "添加成功");
			id=table.getId();
			reWeiMa();
		} else {
			request.put("addTableMsg", "添加失败,餐桌名称重复");
		}
		return "QR_card";
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
			id=table.getId();
			reWeiMa();
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
		 String realPath = ServletActionContext.getRequest().getRealPath("uploadImg/Qrcard");
		int cardid=table.getId();
		 File f = new File(realPath+"\\No"+cardid+".jpg"); // 输入要删除的文件位置
	       if(f.exists())
	       f.delete();
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
		if(sort!=null&&sort.equals("cashier")){//张金高改，添加收银员查看餐桌情况
			return "cashierMTables";
		}
		return SUCCESS;
		
	}
public void reWeiMa() throws IOException{
	//设置页面不缓存
	String paths=getInternetIp();
	 HttpServletResponse response = ServletActionContext.getResponse();
	 HttpServletRequest quest = ServletActionContext.getRequest();
	response.setHeader("Pragma","No-cache");
	response.setHeader("Cache-Control","no-cache");
	response.setDateHeader("Expires", 0);

	BufferedImage image=null;
	ServletOutputStream stream = null;
	//二维码的图片格式 
	String format = "gif";
	 String path= quest.getScheme() + "://"+paths+ ":" + quest.getServerPort()+ quest.getContextPath() + "/"; 
	 String content=path+"customer/customer_toIndex?id="+id;
		int width2 = 200; 
		int height2 = 200; 
		
		Hashtable hints = new Hashtable(); 
		//内容所使用编码 
		hints.put(EncodeHintType.CHARACTER_SET, "utf-8"); 
		
		try{
			BitMatrix bitMatrix = new MultiFormatWriter().encode(content,BarcodeFormat.QR_CODE, width2, height2, hints);
			
			int width = bitMatrix.getWidth(); 
			int height = bitMatrix.getHeight(); 
			image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB); 
			for (int x = 0; x < width; x++) { 
				for (int y = 0; y < height; y++) { 
					image.setRGB(x, y, bitMatrix.get(x, y) ? 0xFF000000 : 0xFFFFFFFF); //二维码图片为黑白两色
				} 
			}
			//ImageIO.write(image,"gif",response.getOutputStream());
		}catch (Exception e) {
			// TODO: handle exception
		}
	//只有用这种解码方式才不出现乱码
	String s="attachment;filename="+new String("No"+id+".gif");
	response.addHeader("Content-Disposition",s);
	OutputStream os=new BufferedOutputStream(response.getOutputStream());
	response.setContentType("image/gif");
	ImageIO.write(image,format,os);
	os.flush();
	os.close();
}
private static String getInternetIp(){
	  String INTERNET_IP = null ; // 外网IP
    try{
        Enumeration<NetworkInterface> networks = NetworkInterface.getNetworkInterfaces();
        InetAddress ip = null;
        Enumeration<InetAddress> addrs;
        while (networks.hasMoreElements())
        {
            addrs = networks.nextElement().getInetAddresses();
            while (addrs.hasMoreElements())
            {
                ip = addrs.nextElement();
                if (ip != null
                        && ip instanceof Inet4Address
                        && ip.isSiteLocalAddress()
                        && !ip.getHostAddress().equals(INTERNET_IP))
                {
                    return ip.getHostAddress();
                }
            }
        }

        // 如果没有外网IP，就返回内网IP
        return INTERNET_IP;
    } catch(Exception e){
        throw new RuntimeException(e);
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

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}
	
}
