package com.DAO;

import java.util.List;

import com.entity.OrderDetails;

public interface BookOrderDAO {
	
	public boolean saveOrder(List<OrderDetails> orderList);
	
	public int orderCount(String email);
	
	public List<OrderDetails> getListOfOrder(String email);
	
	public List<OrderDetails> getListOfAllOrder();	

}
