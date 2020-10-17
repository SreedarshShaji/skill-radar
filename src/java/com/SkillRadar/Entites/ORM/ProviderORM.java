package com.SkillRadar.Entites.ORM;

import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Locale.Category;

import com.SkillRadar.Entites.Location;
import com.SkillRadar.Entites.Provider;
import com.SkillRadar.Entites.ServiceCategory;
import com.SkillRadar.MD5.MD5;

public class ProviderORM {

	ArrayList<Provider> providers = new ArrayList<Provider>();

	Connection con;
	PreparedStatement psmt;
	Exception exception;

	public ProviderORM() {
		try {
			DBconnect dBconnect = new DBconnect();
			con = dBconnect.getConnection();

		} catch (Exception e) {
			System.out.println("ProviderORM , constructor " + e.getMessage());
			this.exception = e;
		}
	}

	public ArrayList<Provider> getProvider(String condition)// Get all admin account details
	{
		try {
			// String query = "SELECT * FROM `SR_service_man` WHERE " + condition;
			String query = "SELECT * FROM `SR_service_man` WHERE " + condition;
			psmt = con.prepareStatement(query);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				Provider temp = new Provider();
				temp.setId(rs.getInt("ser_id"));
				temp.setName(rs.getString("ser_name"));
				temp.setEmail(rs.getString("ser_email"));
				temp.setPassword(rs.getString("ser_password"));
				temp.setCategories(rs.getString("ser_category"));
				String[] locationraw = (rs.getString("ser_location")).split(",");
				Location location = new Location();
				location.setLatitude(Double.parseDouble(locationraw[0]));
				location.setLongitude(Double.parseDouble(locationraw[1]));
				temp.setLocation(location);

				temp.setStatus(rs.getString("ser_status"));
				temp.setAvailable(rs.getBoolean("ser_available"));

				providers.add(temp);
			}

			return providers;
		} catch (Exception ex) {
			System.out.println("ProviderORM , getProvider " + ex.getMessage());
			exception = ex;
			return null;
		}
	}

	public ArrayList<Provider> getProvider() {
		return this.getProvider("1");
	}

	public Provider getProvider(int id) {
		return this.getProvider("`ser_id`='" + id + "'").size()>0?this.getProvider("`ser_id`='" + id + "'").get(0):null;
	}
        
        
	
	public Provider getProvider(String email,String password) {
		return this.getProvider("`ser_email`='" + email + "' AND `ser_password`='" + password + "'").size()>0?this.getProvider("`ser_email`='" + email + "'").get(0):null;
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

	public int insertProvider(Provider provider) {

		String Query = "INSERT INTO `SR_service_man`" + "(`ser_name`, `ser_email`, `ser_password`, "
				+ "`ser_category`, `ser_service`, `ser_location`, `ser_status`, `ser_available`) " + "VALUES ('"
				+ provider.getName() + "'," + "'" + provider.getEmail() + "','" + provider.getPassword() + "'," + "'"
				+ provider.getCategories() + "','" + provider.getCategories() + "'," + "'"
				+ (provider.getLocation().getLatitude() + "," + provider.getLocation().getLongitude()) + "'," + "'"
				+ provider.getStatus() + "','Active')";
		return updateTable(Query);
	}

	public int updateProvider(Provider provider) {

		String Query = "UPDATE `SR_service_man` SET   `ser_name`='" + provider.getName() + "' AND `ser_email`='"
				+ provider.getEmail() + "' AND " + "`ser_password`='" + provider.getPassword() + "' AND "
				+ "`ser_category`='' AND " + "`ser_service`='' AND " + "`ser_location`='"
				+ (provider.getLocation().getLatitude() + "," + provider.getLocation().getLongitude()) + "' AND "
				+ "`ser_status`='" + provider.getStatus() + "' AND " + "`ser_available`='" + provider.isAvailable()
				+ "' WHERE `ser_id`='" + provider.getId() + "'";

		return updateTable(Query);
	}

	public int deleteProvider(Provider provider) {
		String Query = "DELETE FROM `SR_service_man` WHERE `ser_id`='" + provider.getId() + "'";
		return updateTable(Query);
	}

	public Boolean providerLogin(String mail, String password) {
		try {
			ArrayList<Provider> providers = getProvider("`ser_email`='"+mail+"' AND `ser_password`='"+MD5.getMd5(password)+"'");
			if (providers.size() > 0) {
				return true;
			} else {
				return false;
			}
		} catch (Exception ex) {
			System.out.println("ProviderORM , providerLogin " + ex.getMessage());
			exception = ex;
			return null;
		}
	}

	public String getErrorMessage() {
		return this.exception.getMessage();
	}

        public int approveProvider(Provider provider) {
		String Query = "UPDATE `SR_service_man` SET  `ser_status`='Active' AND `ser_available`='true' WHERE `ser_id`='" + provider.getId() + "'";
		return updateTable(Query);
	}
        public int rejectProvider(Provider provider) {
		String Query = "UPDATE `SR_service_man` SET  `ser_status`='null' AND `ser_available`='false' WHERE `ser_id`='" + provider.getId() + "'";
		return updateTable(Query);
	}
}
