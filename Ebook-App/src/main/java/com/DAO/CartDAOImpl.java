package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Cart;

public class CartDAOImpl implements CartDAO{
	
	public Connection conn;
	
	public CartDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addCart(Cart cart) {
		boolean f = false;
		try {
			String sql = "insert into cart (bookId,userId,bookName,author,price,total_price) values (?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, cart.getBookId());
			ps.setInt(2, cart.getUserId());
			ps.setString(3, cart.getBookName());
			ps.setString(4, cart.getAuthor());
			ps.setDouble(5, cart.getPrice());
			ps.setDouble(6, cart.getTotalPrice());
						
			int i = ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	@Override
	public List<Cart> getBookByUser(int userId) {
		List<Cart> list = new ArrayList<Cart>();
		Cart cart = null;
		double totalPrice=0;
		
		try {
			String sql = "select * from cart where userId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				cart = new Cart();
				cart.setCartId(rs.getInt(1));
				cart.setBookId(rs.getInt(2));
				cart.setUserId(rs.getInt(3));				
				cart.setBookName(rs.getString(4));
				cart.setAuthor(rs.getString(5));
				cart.setPrice(rs.getDouble(6));
				
				totalPrice = totalPrice + rs.getDouble(7);
				cart.setTotalPrice(totalPrice);				
				
				list.add(cart);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public boolean deleteBookById(int bookId, int userId, int cartId) {
		boolean f = false;
		
		try {
			String sql = "delete from cart where bookId=? and userId=? and cartId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, bookId);
			ps.setInt(2, userId);
			ps.setInt(3, cartId);
			
			int i = ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	
	
	
	
	

}
