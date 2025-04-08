package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.OrderDetails;

public class BookOrderDAOImpl implements BookOrderDAO {
	
	private Connection conn;
	
	public BookOrderDAOImpl(Connection conn) {
		super();
		this.conn=conn;		
	}

	@Override
	public boolean saveOrder(List<OrderDetails> orderList) {
		boolean f=false;
		
		
		try {
			String sql = "insert into book_order (order_id, user_name, email, address, phone_number, book_name, author, price, payment) values (?,?,?,?,?,?,?,?,?)";
			
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);			
			
			for(OrderDetails order: orderList) {
				ps.setString(1, order.getOrderId());
				ps.setString(2, order.getUserName());
				ps.setString(3, order.getEmail());
				ps.setString(4, order.getFullAddress());
				ps.setString(5, order.getPhoneNumber());
				ps.setString(6, order.getBookName());
				ps.setString(7, order.getAuthor());
				ps.setDouble(8, order.getPrice());
				ps.setString(9, order.getPaymentType());
				
				ps.addBatch();
				
			}
			int [] count = ps.executeBatch();
			conn.commit();
			f = true;
			conn.setAutoCommit(true);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return f;
	}

	@Override
	public int orderCount(String email) {
		int i = 1;
		try {
			String sql = "select * from book_order where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				i++;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}

	@Override
	public List<OrderDetails> getListOfOrder(String email) {
		
		OrderDetails orderDtls = null;
		List<OrderDetails> orderList = new ArrayList<OrderDetails>();
		
		try {
			String sql = "select * from book_order where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {				
				orderDtls = new OrderDetails();
				orderDtls.setId(rs.getInt(1));;
				orderDtls.setOrderId(rs.getString(2));
				orderDtls.setUserName(rs.getString(3));
				orderDtls.setEmail(rs.getString(4));
				orderDtls.setFullAddress(rs.getString(5));
				orderDtls.setPhoneNumber(rs.getString(6));
				orderDtls.setBookName(rs.getString(7));
				orderDtls.setAuthor(rs.getString(8));
				orderDtls.setPrice(rs.getDouble(9));
				orderDtls.setPaymentType(rs.getString(10));
				
				orderList.add(orderDtls);
				
			}			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return orderList;
	}

	@Override
	public List<OrderDetails> getListOfAllOrder() {
		
		OrderDetails orderDtls = null;
		List<OrderDetails> orderList = new ArrayList<OrderDetails>();
		
		try {
			String sql = "select * from book_order";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {				
				orderDtls = new OrderDetails();
				orderDtls.setId(rs.getInt(1));;
				orderDtls.setOrderId(rs.getString(2));
				orderDtls.setUserName(rs.getString(3));
				orderDtls.setEmail(rs.getString(4));
				orderDtls.setFullAddress(rs.getString(5));
				orderDtls.setPhoneNumber(rs.getString(6));
				orderDtls.setBookName(rs.getString(7));
				orderDtls.setAuthor(rs.getString(8));
				orderDtls.setPrice(rs.getDouble(9));
				orderDtls.setPaymentType(rs.getString(10));
				
				orderList.add(orderDtls);
				
			}			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return orderList;
	}
	
		
	

}
