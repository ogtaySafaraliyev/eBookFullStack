package com.DAO;

import com.entity.User;

public interface UserDAO {
	
	public boolean userRegister(User user);
	
	public User login(String email, String password);
	
	public boolean checkPassword(int userId, String password);
	
	public boolean userProfileUpdate(User user);
	
	public boolean checkUserExist(String user);

}
