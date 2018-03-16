package cn.edu.lingnan.dao;

import java.io.Serializable;
import java.util.List;

public interface BaseDao<T> {
	public Serializable save(T entity);

	public void delete(T entity);

	public void update(T entity);
	
	void merge(T entity);
	
	public List<T> find(T condition);
	
	public T findById(Serializable id);

	// param... 可变参数 , 相当于 object[]    getByHQL("from Emp","jack","clerk",1000)
	// 返回单个对象（封装当前类别 ）
	public T getByHQL(String hqlString, Object... values);

	public T getBySQL(String sqlString, Object... values);

	public List<T> getListByHQL(String hqlString, Object... values);

	public List<T> getListBySQL(String sqlString, Object... values);

	public List<T> queryListObjectAllForPage(int pageSize, int page,
			String hqlString, Object... values);

	//单值查询   select count()
	public Object uniqueResult(String sqlString, Object... values);
	
	public Object uniqueResultForPages(String hqlString,int pageSize,int page, Object... values);
}
