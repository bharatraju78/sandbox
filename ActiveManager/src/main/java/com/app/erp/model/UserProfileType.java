package com.app.erp.model;

import java.io.Serializable;

public enum UserProfileType implements Serializable{
	USER("USER"),
	MANAGER("MANAGER"),
	ADMIN("ADMINISTRATOR");
	
	String userProfileType;
	
	private UserProfileType(String userProfileType){
		this.userProfileType = userProfileType;
	}
	
	public String getUserProfileType(){
		return userProfileType;
	}
	
}
