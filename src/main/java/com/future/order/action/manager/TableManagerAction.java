package com.future.order.action.manager;

import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.OutputStream;
import java.util.Hashtable;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.future.order.base.BaseAction;
import com.future.order.entity.Domain;
import com.future.order.entity.Tables;
import com.future.order.util.PageCut;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;

public class TableManagerAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	private Tables table;
	private int page = 1;
	private String name;// 餐桌名字
	private int id;
	private String pass;// 查询属性
	private String replace;// 查询属性值
	private String sort;// 判断用户的身份

	@Override
	public String execute() throws Exception {
		PageCut<Tables> pCut = tablesService.getPageCut(page, 8);
		request.put("allTables", pCut);
		if (pCut.getData().size() == 0) {
			String mark = "没有餐桌";
			request.put("managerMsg", mark);
		}
		request.put("adss", "execute");
		if (sort != null && sort.equals("cashier")) {// 张金高改，添加收银员查看餐桌情况
			return "cashierMTables";
		}
		return SUCCESS;
	}

	// 添加餐桌，默认无人，且调用生成二维码的方法
	public String addTable() throws Exception {
		table.setStatus("无人");
		boolean boo = tablesService.addTable(table);
		if (boo) {
			request.put("addTableMsg", "添加成功");
			id = table.getId();
			reWeiMa();
		} else {
			request.put("addTableMsg", "添加失败,餐桌名称重复");
		}
		return "addTable";
	}

	// 得到被修改的餐桌信息，跳转到修改界面
	public String toUpdateTable() {
		int id = table.getId();
		Tables updateTables = tablesService.get(id);// 得到被修改的餐桌信息
		request.put("updateTables", updateTables);
		request.put("sort", sort);
		return "toUpdateTables";
	}

	// 修改餐桌的信息
	public void updateTable() throws Exception {
		boolean boo = tablesService.updateTables(table);
		if (sort.equals("cashier")) {
			HttpServletResponse response = ServletActionContext.getResponse();
			String returnUrl = "/order/manage/TableManager?sort=cashier";
			response.getWriter()
			.print("<script language=\"javascript\">" + "if(window.opener==null){window.location.href=\"" + returnUrl
					+ "\";}else{window.opener.location.href=\"" + returnUrl + "\";window.close();}</script>");
		} else {
			id = table.getId();
			reWeiMa();
		}
	}

	// 删除餐桌，同时删除餐桌所对应的二维码图片
	public String deleteTable() {
		String realPath = ServletActionContext.getRequest().getRealPath("uploadImg/Qrcard");
		int cardid = table.getId();
		File f = new File(realPath + "\\No" + cardid + ".jpg"); // 输入要删除的文件位置
		if (f.exists())
			f.delete();
		boolean boo = tablesService.deleteTable(table);
		String deleteTableMsg = "删除失败";
		if (boo) {
			deleteTableMsg = "删除成功";
		}
		request.put("managerMsg", deleteTableMsg);
		PageCut<Tables> pCut = tablesService.getPageCut(page, 8);
		request.put("allTables", pCut);
		if (pCut.getData().size() == 0) {
			String mark = "没有餐桌";
			request.put("managerMsg", mark);
		}
		return "deleteTable";
	}

	// 查询语句，用于界面的条件查询
	public String Inquiry() {
		PageCut<Tables> pCut = new PageCut<Tables>();
		if (pass != null) {
			pCut = tablesService.getSomePageCut(page, 8, pass, replace);
		} else {
			pass = (String) session.get("pass");
			replace = (String) session.get("replace");
			pCut = tablesService.getSomePageCut(page, 8, pass, replace);
		}
		request.put("allTables", pCut);
		if (pCut.getData().size() == 0) {
			String mark = "没有你搜索的餐桌";
			request.put("managerMsg", mark);
		}
		request.put("adss", "Inquiry");
		session.put("pass", pass);
		session.put("replace", replace);
		if (sort != null && sort.equals("cashier")) {// 张金高改，添加收银员查看餐桌情况
			return "cashierMTables";
		}
		return SUCCESS;

	}

	// 生成二维码的方法
	public void reWeiMa() throws Exception {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest quest = ServletActionContext.getRequest();
		Domain domain = domainService.getIp();
		if (domain != null) {
			String IP = domain.getIp();
			// 设置页面不缓存
			response.setHeader("Pragma", "No-cache");// 指示请求或响应消息不能缓存，禁止浏览器缓存
			response.setHeader("Cache-Control", "no-cache");// 与上通常两者合用，Expires实体报头域给出响应过期的日期和时间
			response.setDateHeader("Expires", 0);// 设置非法的日期格式，如0

			BufferedImage image = null;
			ServletOutputStream stream = null;
			// 二维码的图片格式
			String format = "gif";
			String path = quest.getScheme() + "://" + IP + "/";
			String content = path + "customer/customer_toIndex?id=" + id;// 二维码内容
			// 设置二维码大小
			int width2 = 200;
			int height2 = 200;

			Hashtable hints = new Hashtable();
			// 内容所使用编码
			hints.put(EncodeHintType.CHARACTER_SET, "utf-8");

			try {
				BitMatrix bitMatrix = new MultiFormatWriter().encode(content, BarcodeFormat.QR_CODE, width2, height2,
						hints);

				int width = bitMatrix.getWidth();
				int height = bitMatrix.getHeight();
				image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
				for (int x = 0; x < width; x++) {
					for (int y = 0; y < height; y++) {
						image.setRGB(x, y, bitMatrix.get(x, y) ? 0xFF000000 : 0xFFFFFFFF); // 二维码图片为黑白两色
					}
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			// 只有用这种解码方式才不出现乱码
			String s = "attachment;filename=" + new String("No" + id + ".gif");// 二维码的名字
			response.addHeader("Content-Disposition", s);
			/*
			 * Content-Disposition为属性名
			 * disposition-type是以什么方式下载，如attachment为以附件方式下载
			 * disposition-parm为默认保存时的文件名
			 * 服务端向客户端游览器发送文件时，使用attachment，这样浏览器会提示保存还是打开
			 */
			OutputStream os = new BufferedOutputStream(response.getOutputStream());
			response.setContentType("image/gif");
			ImageIO.write(image, format, os);
			os.flush();
			os.close();
		} else {
			String returnUrl = "/order/manage/Change_addIp";
			response.getWriter()
					.print("<script language=\"javascript\">" + "alert(\"域名或ip未添加\");"
							+ "if(window.opener==null){window.location.href=\"" + returnUrl
							+ "\";}else{window.opener.location.href=\"" + returnUrl + "\";window.close();}</script>");
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
