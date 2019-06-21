package cn.jxufe.bean;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

public class EasyUIDataPageRequest {
    private int page = 1;
    private int rows = 3;
    private String sort = "id";
    private String order ="asc";
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	
	public Sort.Direction getSortDirection() {
		if ("desc".equals(order)) {
			return Sort.Direction.DESC;
		} else {
			return Sort.Direction.ASC;
		}
	}
	
	/**
	 * 根据请求信息， 返回一个Sort对象
	 * @return
	 */
	public Sort getSortObject() {
		return new Sort(new Sort.Order(getSortDirection(), sort));
	}
	
	/**
	 * 返回解析完成的Pageable对象用于分页查询
	 * @return
	 */
	public Pageable getPageParam() {

		if (sort != null) {
			return new PageRequest(getPage() - 1, getRows(), getSortObject());
		} else {
			return new PageRequest(getPage() - 1, getRows());
		}
	}
    
}