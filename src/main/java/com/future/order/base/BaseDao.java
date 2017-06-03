package com.future.order.base;

import java.lang.reflect.ParameterizedType;

import java.lang.reflect.Type;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.future.order.entity.Menu;

public class BaseDao<T> {
	@Resource//注入session工厂
	private SessionFactory sessionFactory;
	
	private Class<T> clazz;

	
	@SuppressWarnings("unchecked")
	public BaseDao(){
		Type type=this.getClass().getGenericSuperclass();
		if(!(type instanceof ParameterizedType)){
			type=type.getClass().getSuperclass().getGenericSuperclass();
		}
		clazz=(Class<T>)((ParameterizedType) type).getActualTypeArguments()[0];
	}
	//返回数据库中多少条记录
	public int getNum(){
		String className=clazz.getSimpleName();
		String hql="select count(*) from "+className;		
		return ((Long)this.uniqueResult(hql)).intValue();
	}
	
	//返回session会话
	protected Session getSession(){
		return this.sessionFactory.getCurrentSession();
	}
	//根据ID查询
	protected final T getEntity(int id){
		return (T)this.getSession().get(clazz, id);
	}
	//录入
	protected final boolean saveEntity(T t){
		this.getSession().save(t);
		return true;
	}
	//修改信息
	protected final boolean updateEntity(T t){
		this.getSession().saveOrUpdate(t);
		return true;
	}
	//删除对象
	protected final boolean deleteEntity(T t){
		this.getSession().delete(t);
		return true;
	}
	//一个表中的全部记录,zjg
	protected final List<T> selectAll(){
		String className=clazz.getSimpleName();
		String hql = "from "+className;
		Query query = this.getSession().createQuery(hql);
		List<T> list=query.list();
		return list;
	}

	//执行查询功能，返回一个列表
	protected final List<T> getEntityList(String hql,Object ...objects){
		Query query=this.getSession().createQuery(hql);
		for(int i=0;i<objects.length;i++){
			query.setParameter(i, objects[i]);
		}
		List<T> list=query.list();
		return list;
	}
	
	//根据id删除
	protected final int executeUpdate(String hql, Object...objects){
		Query query = getSession().createQuery(hql);
		for(int i=0;i<objects.length;i++){
			query.setParameter(i, objects[i]);
		}
		return query.executeUpdate();
	}
	//返回一个对象
	protected final Object uniqueResult(String hql, Object... objects) {
		Query query = getSession().createQuery(hql);
		for(int i=0;i<objects.length;i++){
			query.setParameter(i, objects[i]);
		}
		return query.uniqueResult();
	}
	//执行返回列表的sql查询语句
	protected final List executeSQLQuery(Class clazz,String sql, Object ...objects){
		SQLQuery sQuery = sessionFactory.getCurrentSession().createSQLQuery(sql);
		if(clazz!=null){//这样可以直接的将投影查询之后可以将数组包装成实体类型的数据格式
			sQuery.addEntity(clazz);
		}
		for(int i=0;i<objects.length;i++){
			sQuery.setParameter(i, objects[i]);
		}
		return sQuery.list();
	}
	@SuppressWarnings("unchecked")
	protected final List<T> executeSQLQuery(String sql, Object ...objects){
		SQLQuery sQuery = sessionFactory.getCurrentSession().createSQLQuery(sql);
		if(clazz!=null){//这样可以直接的将投影查询之后可以将数组包装成实体类型的数据格式
			sQuery.addEntity(clazz);
		}
		for(int i=0;i<objects.length;i++){
			sQuery.setParameter(i, objects[i]);
		}
		return sQuery.list();
	}
	/*执行无返回值的sql语句*/
	protected final void executeSQL(String sql, Object ...objects){
		SQLQuery sQuery = getSession().createSQLQuery(sql);
		for(int i=0;i<objects.length;i++){
			sQuery.setParameter(i, objects[i]);
		}
		sQuery.executeUpdate();
	}
	/*执行限制数量的hql*/
	protected final List<T> getEntityLimitList(String hql,int first,int max,Object ...objects){
		Query query=this.getSession().createQuery(hql);
		for(int i=0;i<objects.length;i++){
			query.setParameter(i, objects[i]);
		}
		query.setFirstResult(first);
		query.setMaxResults(max);
		return query.list();
	}
	
}
