package com.SkillRadar.Entites.ORM;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.SkillRadar.Entites.Feedback;

public class FeedbackORM {


		ArrayList<Feedback> Feedbacks = new ArrayList<Feedback>();

		Connection con;
		PreparedStatement psmt;
		Exception exception;

		public FeedbackORM() {
			try {
				DBconnect dBconnect = new DBconnect();
				con = dBconnect.getConnection();

			} catch (Exception e) {
				System.out.println("CustomerORM , constructor ");
				e.printStackTrace();
				this.exception = e;
			}
		}

		public ArrayList<Feedback> getFeedbacks(String condition)// Get all admin account details
		{
			try {
				String query = "SELECT * FROM `SR_feedback` WHERE " + condition;
				psmt = con.prepareStatement(query);
				ResultSet rs = psmt.executeQuery();
				while (rs.next()) {
					Feedback temp = new Feedback();
					temp.setId(rs.getInt("fb_id"));
					temp.setUser(null);
					temp.setMessage(rs.getString("fb_message"));

					Feedbacks.add(temp);
				}

				return Feedbacks;
			} catch (Exception ex) {
				System.out.println("CustomerORM , getCustomer " + ex.getMessage());
				exception = ex;
				ex.printStackTrace();
				return null;
			}
		}

		public ArrayList<Feedback> getFeedbacks() {
			return this.getFeedbacks("1");
		}

		public Feedback getCustomer(int id) {
			return (this.getFeedbacks("`us_id`='" + id + "'")).get(0);
		}
		public Feedback getCustomer(String email,String password) {
			return (this.getFeedbacks("`us_email`='" + email + "'")).get(0);
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

		public int insertFeedback(Feedback feedback) {
			String Query = "";
			return updateTable(Query);
		}

		public int updateFeedback(Feedback feedback) {
			String Query = "";
			return updateTable(Query);
		}

		public int deleteFeedback(Feedback feedback) {
			String Query = "";
			return updateTable(Query);
		}

		public String getErrorMessage() {
			return this.exception.getMessage();
		}


}
