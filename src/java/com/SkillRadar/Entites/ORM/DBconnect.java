package com.SkillRadar.Entites.ORM;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnect {
	private Connection connection;
	private Exception exception;

	public Connection getConnection() {
		return connection;
	}

	public Exception getException() {
		return exception;
	}

	public DBconnect() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			this.connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/skill_radar", "root", "");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			exception = e;
		}
	}
}
