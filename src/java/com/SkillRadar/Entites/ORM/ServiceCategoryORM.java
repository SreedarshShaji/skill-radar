package com.SkillRadar.Entites.ORM;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.SkillRadar.Entites.ServiceCategory;

public class ServiceCategoryORM {
	ArrayList<ServiceCategory> servicesCategories = new ArrayList<ServiceCategory>();

	Connection con;
	PreparedStatement psmt;
	Exception exception;

	public ServiceCategoryORM() {
		try {
			DBconnect dBconnect = new DBconnect();
			con = dBconnect.getConnection();

		} catch (Exception e) {
			System.out.println("ServiceCategoryORM , constructor "+e.getMessage());
			e.printStackTrace();
			this.exception = e;
		}
	}

	public ArrayList<ServiceCategory> getServiceCategories(String condition)// Get all admin account details
	{
		try {
			String query = "SELECT * FROM `SR_service_cat` WHERE " + condition;
			psmt = con.prepareStatement(query);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				ServiceCategory temp = new ServiceCategory();
				temp.setId(rs.getInt("Cat_id"));
				temp.setName(rs.getString("Cat_name"));
				temp.setDescription(rs.getString("Cat_description"));
				temp.setPhoto(rs.getString("Cat_photo"));

				servicesCategories.add(temp);
			}

			return servicesCategories;
		} catch (Exception ex) {
			System.out.println("CustomerORM , getCustomer " + ex.getMessage());
			exception = ex;
			ex.printStackTrace();
			return null;
		}
	}

	public ArrayList<ServiceCategory> getServiceCategories() {
		return this.getServiceCategories("1");
	}

	public ServiceCategory getServiceCategory(int id) {
		return (this.getServiceCategories("`Cat_id`='" + id + "'")).size()>0?(this.getServiceCategories("`Cat_id`='" + id + "'")).get(0):null;
	}

	// Perform all update operations
	private int updateTable(String Query) {
		int result = 0;

		try {
			psmt = con.prepareStatement(Query);
			result = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("updateTable , ServiceCategor " + e.getMessage());
			e.getStackTrace();
			exception = e;
		}

		return result;
	}

	public int insertServiceCategory(ServiceCategory serviceCategory) {
		String Query = "INSERT INTO `SR_service_cat`(`Cat_id`, `Cat_name`, `Cat_description`, `Cat_photo`) VALUES "
				+ "('" + serviceCategory.getId() + "','" + serviceCategory.getName() + "','"
				+ serviceCategory.getDescription() + "','" + serviceCategory.getPhoto() + "')";
		return updateTable(Query);
	}

	public int updateServiceCategory(ServiceCategory serviceCategory) {
		String Query = "UPDATE `SR_service_cat` SET `Cat_name`='" + serviceCategory.getName() + "',"
				+ "`Cat_description`='" + serviceCategory.getDescription() + "',`Cat_photo`='"
				+ serviceCategory.getPhoto() + "'" + "WHERE `Cat_id`='" + serviceCategory.getId() + "'";
		return updateTable(Query);
	}

	public int deleteServiceCategory(ServiceCategory serviceCategory) {
		String Query = "DELETE FROM `SR_service_cat` WHERE `Cat_id`='" + serviceCategory.getId() + "'";
		return updateTable(Query);
	}

}
