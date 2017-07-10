package com.future.order.action.manager;

import com.future.order.base.BaseAction;
import com.future.order.entity.Tables;
import com.future.order.util.PageCut;

public class TableManagerAction extends BaseAction {
	
	private Tables table;
	private int page=1;
	
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
	
}
