package com.future.order.action.customer;
import java.util.*;
import com.future.order.base.BaseAction;
import com.future.order.entity.Inform;
import com.future.order.entity.OrderDetails;
import com.future.order.entity.ShopCart;

/**
 * @author 安李杰
 *
 */
/**
 * 
 *
 */
public class CartAction extends BaseAction{

	/**
	 * 对购物车进行操作
	 */
	private static final long serialVersionUID = 1L;

	private int id;
	//获得购物车菜品
	public String getCart() throws Exception{
		System.out.println("**************");
		int tableId=(int) session.get("userId");
		List<ShopCart> shopCarts=shopCartService.getByTableId(tableId);
		double total = 0.0;
		for(ShopCart item:shopCarts){
			total += item.getMenuNum() * item.getPrice();
		}
		request.put("total",total);
		request.put("shopCarts", shopCarts);
		System.out.println(shopCarts);
		return "getCart";
	}
	//生成订单
	public String getHand() throws Exception{
		int tableId=(int) session.get("userId");
		List<ShopCart> shopCarts=shopCartService.getByTableId(tableId);
			for(ShopCart item:shopCarts){
				OrderDetails orderDetails=new OrderDetails();
					orderDetails.setMenuId(item.getMenuId());
					orderDetails.setTableName(item.getTableName());
					orderDetails.setMenuName(item.getMenuName());
					orderDetails.setMenuNum(item.getMenuNum());
					orderDetails.setTableId(item.getTableId());
					orderDetails.setStatus("未付款");
					Boolean bool=orderDetailsService.save(orderDetails);
		}
		List<OrderDetails> orderDetails=orderDetailsService.getDetails(tableId);
		request.put("orderDetails",orderDetails);
		boolean bool=shopCartService.deleteAllCart(tableId);
		return "getHand";
	}
	
	//购物车的菜品数量update
	public String updateCart() throws Exception{
		
		return "updateCart";
	}

	//删除购物车的菜品
	public String deleteCart() throws Exception{
		int tableId=(int) session.get("userId");
		boolean bool=shopCartService.delete(id);
		boolean bool1=orderService.deleteOrder(tableId);
		return "deleteCart";
	}
	//查询订单详情
	public String getOrderDetails() throws Exception{
		int tableId=(int) session.get("userId");
		List<OrderDetails> orderDetails=orderDetailsService.getDetails(tableId);
		System.out.println(orderDetails);
		request.put("orderDetails",orderDetails);
		return "getOrderDetails";
	}
	
	
	//菜品数量的增加
	public String add() throws Exception{
		ShopCart shopCart=shopCartService.getOne(id);
		shopCart.setMenuNum(shopCart.getMenuNum()+1);
		Boolean bool=shopCartService.update(shopCart);
		List<ShopCart> shopCarts=shopCartService.getByAll();
		double total = 0.0;
		for(ShopCart item:shopCarts){
			total += item.getMenuNum() * item.getPrice();
		}
		System.out.println(total);
		request.put("total",total);
		request.put("shopCarts", shopCarts);
		return "add";
	}
	//菜品数量的减少
	public String reduce() throws Exception{
		ShopCart shopCart=shopCartService.getOne(id);
		if(shopCart.getMenuNum()>=1){
			shopCart.setMenuNum(shopCart.getMenuNum()-1);
		}
		Boolean bool=shopCartService.update(shopCart);
		List<ShopCart> shopCarts=shopCartService.getByAll();
		double total = 0.0;
		for(ShopCart item:shopCarts){
			total += item.getMenuNum() * item.getPrice();
		}
		System.out.println(total);
		request.put("total",total);
		request.put("shopCarts", shopCarts);
		return "reduce";
	}
	//催单
	public String getReminder() throws Exception{
		int tableId=(int) session.get("userId");
		String tableName=tablesService.get(tableId).getName();
		Date d = new Date();  
		Inform inform=new Inform();
		inform.setContent("顾客催单，请尽快做好");
		inform.setCreateDate(d);
		inform.setTableId(tableId);
		inform.setTableName(tableName);
		Boolean bool=informService.save(inform);
		if(bool==true){
			request.put("addMeg","催单成功");
		}else{
			request.put("addMeg","催单失败");
		}
		return "getReminder";
	}
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

}
