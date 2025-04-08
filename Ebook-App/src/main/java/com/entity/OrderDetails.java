package com.entity;

public class OrderDetails {

	private int id;
	private String orderId;
	private String userName;
	private String email;
	private String fullAddress;
	private String phoneNumber;
	private String bookName;
	private String author;
	private Double price;
	private String paymentType;

// super class constructor
	public OrderDetails() {
		super();
	}

//setter and getter
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getFullAddress() {
		return fullAddress;
	}

	public void setFullAddress(String fullAddress) {
		this.fullAddress = fullAddress;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	@Override
	public String toString() {
		return "OrderDetails [id=" + id + ", orderId=" + orderId + ", userName=" + userName + ", email=" + email
				+ ", fullAddress=" + fullAddress + ", phoneNumber=" + phoneNumber + ", bookName=" + bookName
				+ ", author=" + author + ", price=" + price + ", paymentType=" + paymentType + "]";
	}
	
	

}
