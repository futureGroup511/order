package com.future.order.action;

import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

import javax.imageio.ImageIO;
import javax.print.Doc;
import javax.print.DocFlavor;
import javax.print.DocPrintJob;
import javax.print.PrintException;
import javax.print.PrintService;
import javax.print.PrintServiceLookup;
import javax.print.SimpleDoc;
import javax.print.attribute.DocAttributeSet;
import javax.print.attribute.HashDocAttributeSet;
import javax.print.attribute.HashPrintRequestAttributeSet;
import javax.print.attribute.PrintRequestAttributeSet;
import javax.print.attribute.standard.Copies;
import javax.print.attribute.standard.MediaPrintableArea;
import javax.print.attribute.standard.MediaSizeName;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.future.order.base.BaseAction;
import com.future.order.entity.Domain;
import com.future.order.entity.Ingredient;
import com.future.order.entity.Menu;
import com.future.order.entity.MenuMaterial;
import com.future.order.entity.OrderDetails;
import com.future.order.entity.StockDetails;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;

public class OrderDetailAction extends BaseAction {
	private int menuId;
	private int ingId;
	public void reWeiMa() throws Exception{
		//设置页面不缓存
		 HttpServletResponse response = ServletActionContext.getResponse();
		 HttpServletRequest quest = ServletActionContext.getRequest();
		Domain domain=domainService.getIp();
		if(domain!=null){
			String IP =domain.getIp();
			response.setHeader("Pragma","No-cache");
			response.setHeader("Cache-Control","no-cache");
			response.setDateHeader("Expires", 0);

			BufferedImage image=null;
			ServletOutputStream stream = null;
			//二维码的图片格式 
			String format = "gif";
			 String path= quest.getScheme() + "://"+IP+ ":" + quest.getServerPort()+ quest.getContextPath() + "/"; 
			 String content=path+"OrderDetail_getMenuMaterial?menuId="+menuId;
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
			String s="attachment;filename="+new String("No"+menuId+".gif");
			response.addHeader("Content-Disposition",s);
			OutputStream os=new BufferedOutputStream(response.getOutputStream());
			response.setContentType("image/gif");
			ImageIO.write(image,format,os);
			os.flush();
			os.close();
		}else{
			String messige="未添加域名,暂无法打印二维码";
			request.put("messige", messige);
			}
	}
public String getMenuMaterial() throws Exception {		
		Menu menu =menuService.get(menuId);
		request.put("menu", menu);
		List<MenuMaterial> menuMaterial=menuMaterialService.getByMenuIdTwo(menuId); 
		for(MenuMaterial item:menuMaterial){
			int ingId=item.getIngId();
			String introduce=ingerdientService.getById(ingId).getIntroduce();
			item.setIntroduce(introduce);
		}
		request.put("menuMaterial",menuMaterial);
		return "getMenuMaterial";
	}
public String getStockDate() throws Exception {
	List<StockDetails> stockDetails=stockDetailsService.getByIngId(ingId,2);
	request.put("stockDetails", stockDetails);
	for(StockDetails item:stockDetails){
		request.put("ingName",item.getIngName());
	}
	return "getStockDate";
}
public String printQRCode() {
	request.put("menuId", menuId);
	
	return "printQRCode";
} 

public int getIngId() {
	return ingId;
}
public void setIngId(int ingId) {
	this.ingId = ingId;
}
public int getMenuId() {
	return menuId;
}
public void setMenuId(int menuId) {
	this.menuId = menuId;
}
}
