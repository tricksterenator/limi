package edu.uh.cs.limi.user;

import java.util.ArrayList;

import edu.uh.cs.limi.dbase.*;
import edu.uh.cs.limi.main.*;

import java.util.Date;

public class User {

	private int userId;
	private String name;
	private String surname;
	private String username;
	private String email;
	private String password;
	private int active;
	private Date online;
	private String UserIP=null;
	private ArrayList favorites;
	private DbUserManager objDbUserManager;
	public User(){
		objDbUserManager=new DbUserManager();
	}
	/*
	public User(String name, String password) {
		this.userName = name;
		this.password = password;
		this.favorites=new ArrayList();
		isOnline=false;
		
	}
	*/
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int UserId) {
		userId=UserId;
	}
	
	public String getName() {
		return name;
	}
	public String getSurname() {
		return surname;
	}
	
	public void setName(String Name) {
		name=Name;
	}
	public void setSurname(String  Surname) {
		surname=Surname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String Password) {
		password = Password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String Username) {
		username = Username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String Email) {
		email = Email;
	}	
	public String getIP() {
		return UserIP;
	}
	public void setIP(String IP) {
		UserIP=IP;
	}
	public Date getOnlineStatus() {
		return online;
	}
	public void setOnlineStatus(Date status) {
		online=status;
	}
	public ArrayList getFavorites() {
		return favorites;
	}
	public void addToFavorites(String newFavorite) {
		favorites.add(newFavorite);
	}
	

	public int Load()
	{
		return objDbUserManager.LoadUser(this);
	}
	
	public int Save()
	{
		return objDbUserManager.SaveUser(this);
	}
	
}
