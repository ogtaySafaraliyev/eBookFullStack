package com.DAO;

import java.util.List;

import com.entity.BookDetails;

public interface BookDAO {

	public boolean addBooks(BookDetails bookDtls);

	public List<BookDetails> getAllBooks();

	public BookDetails getBookById(int bookId);

	public boolean updateBooks(BookDetails bookDtls);

	public boolean deleteBooks(int bookId);

	public List<BookDetails> getNewBooks();

	public List<BookDetails> getRecentBooks();

	public List<BookDetails> getOldBooks();

	public List<BookDetails> getAllNewBooks();

	public List<BookDetails> getAllRecentBooks();

	public List<BookDetails> getAllOldBooks();

	// after login methods
	public List<BookDetails> getBookByOldForUser(String email, String category);
	
	public boolean oldBookDeleteByUser(int bookId, String email, String category);
	
	// search method
	public List<BookDetails> getBookBySearch(String srchRs);
	
	

}
