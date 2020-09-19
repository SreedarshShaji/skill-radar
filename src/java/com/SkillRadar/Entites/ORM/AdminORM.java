package com.SkillRadar.Entites.ORM;

import java.sql.*;
import java.util.ArrayList;

import com.SkillRadar.Entites.Admin;
import com.SkillRadar.MD5.MD5;

public class AdminORM {

	ArrayList<Admin> adminList = new ArrayList<Admin>();

	Connection con;
	PreparedStatement psmt;
	Exception exception;

	public AdminORM() {
		try {
			DBconnect dBconnect = new DBconnect();
			con = dBconnect.getConnection();

		} catch (Exception e) {
			System.out.println("AdminORM , constructor " + e.getMessage());
			this.exception = e;
		}
	}

	public ArrayList<Admin> getAdmin(String condition)// Get all admin account details
	{
		try {
			String query = "SELECT * FROM `SR_admin` WHERE " + condition;
			psmt = con.prepareStatement(query);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				Admin temp = new Admin();
				temp.setId(rs.getInt("id"));
				temp.setName(rs.getString("Name"));
				temp.setEmail(rs.getString("mail"));
				temp.setPassword(rs.getString("password"));
				adminList.add(temp);
			}

			return adminList;
		} catch (Exception ex) {
			System.out.println("AdminORM , getAdmin " + ex.getMessage());
			exception = ex;
			return null;
		}
	}

	public ArrayList<Admin> getAdmin() {
		return this.getAdmin("1");
	}
	
	public Admin getAdmin(String username,String password) {
		return this.getAdmin("WHERE mail='"+username+"' AND password='"+MD5.getMd5(password)+"'").get(0);
	}

	public Boolean adminLogin(String mail, String password) {
		ArrayList<Admin> admin = this.getAdmin("mail='" + mail + "' AND password='" + MD5.getMd5(password) + "'");
		if (admin.size() > 0) {
			return true;
		} else {
			return false;
		}
	}

	public String getErrorMessage() {
		return this.exception.getMessage();
	}
}
