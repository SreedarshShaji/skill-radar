package com.SkillRadar.Entites.ORM;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.SkillRadar.Entites.Customer;
import com.SkillRadar.Entites.Location;
import com.SkillRadar.MD5.MD5;

public class CustomerORM {

	ArrayList<Customer> customers = new ArrayList<Customer>();

	Connection con;
	PreparedStatement psmt;
	Exception exception;

	public CustomerORM() {
		try {
			DBconnect dBconnect = new DBconnect();
			con = dBconnect.getConnection();

		} catch (Exception e) {
			System.out.println("CustomerORM , constructor ");
			e.printStackTrace();
			this.exception = e;
		}
	}

	public ArrayList<Customer> getCustomers(String condition)// Get all Customer account details
	{
		try {
			String query = "SELECT * FROM `SR_user` WHERE " + condition;
			psmt = con.prepareStatement(query);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				Customer temp = new Customer();
				temp.setId(rs.getInt("us_id"));
				temp.setName(rs.getString("us_name"));
				temp.setEmail(rs.getString("us_email"));
				temp.setPassword(rs.getString("us_password"));

				String[] locations = rs.getString("us_location").split(",");
				Location location = new Location();
				location.setLatitude(Double.parseDouble(locations[0]));
				location.setLongitude(Double.parseDouble(locations[1]));

				temp.setLocation(location);
				customers.add(temp);
			}

			return customers;
		} catch (Exception ex) {
			System.out.println("CustomerORM , getCustomer " + ex.getMessage());
			exception = ex;
			ex.printStackTrace();
			return null;
		}
	}

	public ArrayList<Customer> getCustomers() {
		return this.getCustomers("1");
	}

	public Customer getCustomer(int id) {
                return (this.getCustomers("`us_id`='" + id + "'")).size()>0?(this.getCustomers("`us_id`='" + id + "'")).get(0):null;
	}
        public Customer getCustomer(String email) {
		return (this.getCustomers("`us_email`='" + email + "'")).size()>0?(this.getCustomers("`us_email`='" + email + "'")).get(0):null;
	}
	public Customer getCustomer(String email,String password) {
		return (this.getCustomers("`us_email`='" + email + "' AND `us_password`='"+ password +"'")).size()>0?(this.getCustomers("`us_email`='" + email + "'")).get(0):null;
	}

	// Perform all update operations
	private int updateTable(String Query) {
		int result = 0;

		try {
			psmt = con.prepareStatement(Query);
			result = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("updateTable , CustomerORM " + e.getMessage());
			e.getStackTrace();
			exception = e;
		}

		return result;
	}

	public int insertUser(Customer customer) {
		String Query = "INSERT INTO `SR_user`" + "(`us_name`, `us_email`, `us_password`, `us_location`) "
				+ "VALUES " + "('" + customer.getName() + "','" + customer.getEmail() + "','"
				+ customer.getPassword() + "','" + customer.getLocation().toString() + "')";
		return updateTable(Query);
	}

	public int updateUser(Customer customer) {
		String Query = "UPDATE `SR_user` SET " + "`us_name`='" + customer.getName() + "',`us_email`='"
				+ customer.getEmail() + "'," + "`us_password`='" + customer.getPassword() + "',`us_location`='"
				+ customer.getLocation().toString() + "'" + "WHERE `us_id`='" + customer.getId() + "'";
		return updateTable(Query);
	}

	public int deleteUser(Customer customer) {
		String Query = "DELETE FROM `SR_user` WHERE `us_id`='" + customer.getId() + "'";
		return updateTable(Query);
	}

	public Boolean customerLogin(String mail, String password) {
		try {
			ArrayList<Customer> customers = getCustomers("us_email='" + mail + "' AND us_password='" + MD5.getMd5(password) + "'");
			if (customers.size() > 0) {
				return true;
			} else {
				return false;
			}
		} catch (Exception ex) {
			System.out.println("CustomerORM , customerLogin " + ex.getMessage());
			exception = ex;
			ex.printStackTrace();
			return null;
		}
	}

	public String getErrorMessage() {
		return this.exception.getMessage();
	}

}
