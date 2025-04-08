package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import com.entity.BookDetails;

public class BookDAOImpl implements BookDAO {

	private Connection conn;

	public BookDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addBooks(BookDetails bookdtls) {
		boolean f = false;
		try {
			String sql = "insert into book_details(bookName,author,price,bookCategory,status,photo,user_email) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, bookdtls.getBookName());
			ps.setString(2, bookdtls.getAuthor());
			ps.setDouble(3, bookdtls.getPrice());
			ps.setString(4, bookdtls.getBookCategory());
			ps.setString(5, bookdtls.getStatus());
			ps.setString(6, bookdtls.getPhotoName());
			ps.setString(7, bookdtls.getUserEmail());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<BookDetails> getAllBooks() {

		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails bookDtls = null;

		try {

			String sql = "select * from book_details";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				bookDtls = new BookDetails();

				bookDtls.setBookId(rs.getInt(1));
				bookDtls.setBookName(rs.getString(2));
				bookDtls.setAuthor(rs.getString(3));
				bookDtls.setPrice(rs.getDouble(4));
				bookDtls.setBookCategory(rs.getString(5));
				bookDtls.setStatus(rs.getString(6));
				bookDtls.setPhotoName(rs.getString(7));
				bookDtls.setUserEmail(rs.getString(8));

				list.add(bookDtls);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public BookDetails getBookById(int id) {

		BookDetails bookDtls = null;

		try {
			String sql = "select * from book_details where bookId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				bookDtls = new BookDetails();
				bookDtls.setBookId(rs.getInt(1));
				bookDtls.setBookName(rs.getString(2));
				bookDtls.setAuthor(rs.getString(3));
				bookDtls.setPrice(rs.getDouble(4));
				bookDtls.setBookCategory(rs.getString(5));
				bookDtls.setStatus(rs.getString(6));
				bookDtls.setPhotoName(rs.getString(7));
				bookDtls.setUserEmail(rs.getString(8));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return bookDtls;
	}

	@Override
	public boolean updateBooks(BookDetails bookDtls) {
		
		boolean f = false;	
		
		try {
			String sql = "update book_details set bookName=?, author=?, price=?, bookCategory=?, status=?, user_email=? where bookId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
							
			ps.setString(1, bookDtls.getBookName());
			ps.setString(2, bookDtls.getAuthor());
			ps.setDouble(3, bookDtls.getPrice());
			ps.setString(4, bookDtls.getBookCategory());
			ps.setString(5, bookDtls.getStatus());
//			ps.setString(6, bookDtls.getPhotoName());
			ps.setString(6, bookDtls.getUserEmail());			
			
			ps.setInt(7, bookDtls.getBookId());
			int i = ps.executeUpdate();
			
			if (i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	@Override
	public boolean deleteBooks(int bookId) {
		boolean f = false;
		
		try {			
			String sql = "delete from book_details where bookId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, bookId);			
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
	public List<BookDetails> getNewBooks() {
		
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails bookDtls = null;
		
		try {
			String sql = "select * from book_details where bookCategory=? and status=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			
			ResultSet rs = ps.executeQuery();
			
			int i=1;
			while (rs.next() && i<=4){
				bookDtls = new BookDetails();
				bookDtls.setBookId(rs.getInt(1));
				bookDtls.setBookName(rs.getString(2));
				bookDtls.setAuthor(rs.getString(3));
				bookDtls.setPrice(rs.getDouble(4));
				bookDtls.setBookCategory(rs.getString(5));
				bookDtls.setStatus(rs.getString(6));
				bookDtls.setPhotoName(rs.getString(7));
				bookDtls.setUserEmail(rs.getString(8));				
				
				list.add(bookDtls);
				i++;
			}			
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return list;
	}

	@Override
	public List<BookDetails> getRecentBooks() {
		
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails bookDtls = null;
		
		try {
			String sql = "select * from book_details where status=?";
			PreparedStatement ps = conn.prepareStatement(sql);		
			ps.setString(1, "Active");
			
			ResultSet rs = ps.executeQuery();
			
			int i=1;
			while (rs.next() && i<=4){
				bookDtls = new BookDetails();
				bookDtls.setBookId(rs.getInt(1));
				bookDtls.setBookName(rs.getString(2));
				bookDtls.setAuthor(rs.getString(3));
				bookDtls.setPrice(rs.getDouble(4));
				bookDtls.setBookCategory(rs.getString(5));
				bookDtls.setStatus(rs.getString(6));
				bookDtls.setPhotoName(rs.getString(7));
				bookDtls.setUserEmail(rs.getString(8));				
				
				list.add(bookDtls);
				i++;
			}			
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return list;
	}

	@Override
	public List<BookDetails> getOldBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails bookDtls = null;
		
		try {
			String sql = "select * from book_details where bookCategory=? and status=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			
			ResultSet rs = ps.executeQuery();
			
			int i=1;
			while (rs.next() && i<=4){
				bookDtls = new BookDetails();
				bookDtls.setBookId(rs.getInt(1));
				bookDtls.setBookName(rs.getString(2));
				bookDtls.setAuthor(rs.getString(3));
				bookDtls.setPrice(rs.getDouble(4));
				bookDtls.setBookCategory(rs.getString(5));
				bookDtls.setStatus(rs.getString(6));
				bookDtls.setPhotoName(rs.getString(7));
				bookDtls.setUserEmail(rs.getString(8));				
				
				list.add(bookDtls);
				i++;
			}			
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return list;
	}

	@Override
	public List<BookDetails> getAllNewBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails bookDtls = null;
		
		try {
			String sql = "select * from book_details where bookCategory=? and status=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			
			ResultSet rs = ps.executeQuery();			
			
			while (rs.next()){
				bookDtls = new BookDetails();
				bookDtls.setBookId(rs.getInt(1));
				bookDtls.setBookName(rs.getString(2));
				bookDtls.setAuthor(rs.getString(3));
				bookDtls.setPrice(rs.getDouble(4));
				bookDtls.setBookCategory(rs.getString(5));
				bookDtls.setStatus(rs.getString(6));
				bookDtls.setPhotoName(rs.getString(7));
				bookDtls.setUserEmail(rs.getString(8));				
				
				list.add(bookDtls);				
			}			
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return list;
	}

	@Override
	public List<BookDetails> getAllRecentBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails bookDtls = null;
		
		try {
			String sql = "select * from book_details where status=?";
			PreparedStatement ps = conn.prepareStatement(sql);		
			ps.setString(1, "Active");
			
			ResultSet rs = ps.executeQuery();			
			
			while (rs.next()){
				bookDtls = new BookDetails();
				bookDtls.setBookId(rs.getInt(1));
				bookDtls.setBookName(rs.getString(2));
				bookDtls.setAuthor(rs.getString(3));
				bookDtls.setPrice(rs.getDouble(4));
				bookDtls.setBookCategory(rs.getString(5));
				bookDtls.setStatus(rs.getString(6));
				bookDtls.setPhotoName(rs.getString(7));
				bookDtls.setUserEmail(rs.getString(8));				
				
				list.add(bookDtls);				
			}			
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return list;
	}

	@Override
	public List<BookDetails> getAllOldBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails bookDtls = null;
		
		try {
			String sql = "select * from book_details where bookCategory=? and status=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			
			ResultSet rs = ps.executeQuery();			
			
			while (rs.next()){
				bookDtls = new BookDetails();
				bookDtls.setBookId(rs.getInt(1));
				bookDtls.setBookName(rs.getString(2));
				bookDtls.setAuthor(rs.getString(3));
				bookDtls.setPrice(rs.getDouble(4));
				bookDtls.setBookCategory(rs.getString(5));
				bookDtls.setStatus(rs.getString(6));
				bookDtls.setPhotoName(rs.getString(7));
				bookDtls.setUserEmail(rs.getString(8));				
				
				list.add(bookDtls);				
			}			
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return list;
	}

	@Override
	public List<BookDetails> getBookByOldForUser(String email, String category) {
		
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails bookDtls = null;
		
		try {			
			String sql = "select * from book_details where user_email=? and bookCategory=?"; 
			PreparedStatement ps = conn.prepareStatement(sql);			
			ps.setString(1, email);
			ps.setString(2, category);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				bookDtls = new BookDetails();
				bookDtls.setBookId(rs.getInt(1));
				bookDtls.setBookName(rs.getString(2));
				bookDtls.setAuthor(rs.getString(3));
				bookDtls.setPrice(rs.getDouble(4));
				bookDtls.setBookCategory(rs.getString(5));
				bookDtls.setStatus(rs.getString(6));
				bookDtls.setPhotoName(rs.getString(7));
				bookDtls.setUserEmail(rs.getString(8));
				
				list.add(bookDtls);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return list;
	}

	@Override
	public boolean oldBookDeleteByUser(int bookId, String email, String category) {
		boolean f=false;
		
		try {
			String sql = "delete from book_details where bookId=? and user_email=? and bookCategory=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, bookId);
			ps.setString(2, email);
			ps.setString(3, category);
			
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
	public List<BookDetails> getBookBySearch(String srchRs) {
		
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails bookDtls = null;
		
		try {			
			String sql = "select * from book_details where bookName like ? or author like ? or bookCategory like ? and status=?"; 
			PreparedStatement ps = conn.prepareStatement(sql);			
			ps.setString(1, "%"+srchRs+"%");
			ps.setString(2, "%"+srchRs+"%");
			ps.setString(3, "%"+srchRs+"%");
			ps.setString(4, "Active");
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				bookDtls = new BookDetails();
				bookDtls.setBookId(rs.getInt(1));
				bookDtls.setBookName(rs.getString(2));
				bookDtls.setAuthor(rs.getString(3));
				bookDtls.setPrice(rs.getDouble(4));
				bookDtls.setBookCategory(rs.getString(5));
				bookDtls.setStatus(rs.getString(6));
				bookDtls.setPhotoName(rs.getString(7));
				bookDtls.setUserEmail(rs.getString(8));
				
				list.add(bookDtls);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return list;
	}
	
	
	

}
