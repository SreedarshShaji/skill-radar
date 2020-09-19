package com.SkillRadar.Entites.ORM;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import com.SkillRadar.Entites.Message;
import com.SkillRadar.Entites.User;

public class MessagesORM {

	ArrayList<Message> messages = new ArrayList<Message>();

	Connection con;
	PreparedStatement psmt;
	Exception exception;

	public MessagesORM() {
		try {
			DBconnect dBconnect = new DBconnect();
			con = dBconnect.getConnection();

		} catch (Exception e) {
			System.out.println("ProviderORM , constructor " + e.getMessage());
			this.exception = e;
		}
	}

	public ArrayList<Message> getMessages(String condition) {
		try {

			String query = "SELECT * FROM `SR_message` WHERE " + condition;
			psmt = con.prepareStatement(query);

			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {
				Message temp = new Message();
				temp.setId(rs.getInt("ms_id"));

				User sender, reciever;
				ProviderORM providerORM = new ProviderORM();
				CustomerORM customerORM = new CustomerORM();

				if (rs.getString("ms_sender_type").contentEquals("provider")) {
					sender = providerORM.getProvider(rs.getInt("ms_sender"));
					temp.setSender(sender);
				} else {
					sender = customerORM.getCustomer(rs.getInt("ms_sender"));
					temp.setSender(sender);
				}

				if (rs.getString("ms_reciever_type").contentEquals("provider")) {
					reciever = providerORM.getProvider(rs.getInt("ms_reciever "));
					temp.setSender(reciever);
				} else {
					reciever = customerORM.getCustomer(rs.getInt("ms_reciever "));
					temp.setSender(reciever);
				}

				
			}

			return null;
		} catch (Exception e) {
			System.out.println("MessagesORM getMessages" + e.toString());
			return null;
		}
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

}
