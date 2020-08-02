package SUser;

/**
 *
 * @author Freeroutes
 *
 */

 import java.sql.Connection;
 import java.sql.PreparedStatement;
 import java.sql.ResultSet;
 import java.sql.SQLException;
 import Login_signUp.*;
 import Partner.*;
 import java.lang.*;
 import java.io.*;
 import java.util.*;

public class SUser{
	private String name;
	private String surname;
	private int level;
	private double points;
	private String photo;
	private String username;

	public SUser(String name, String surname, String username) {
		this.name = name;
		this.surname = surname;
		this.username = username;
	}

	public SUser(String name, String surname, int level, Double points) {
		this.name = name;
		this.surname = surname;
		this.level = level;
		this.points = points;
	}

	public SUser(String name, String surname, int level, Double points, String photo) {
		this.name = name;
		this.surname = surname;
		this.level = level;
		this.points = points;
		this.photo = photo;
	}
public SUser(String name, String surname, int level, Double points, String photo, String username) {
		this.name = name;
		this.surname = surname;
		this.level = level;
		this.points = points;
		this.photo = photo;
		this.username = username;
	}
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return this.surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public int getLevel() {
		return this.level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public double getPoints() {
		return this.points;
	}

	public void setPoints(double points) {
		this.points = points;
	}

	public String getPhoto() {
		return this.photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void pointsSUser (String username, int points)  throws Exception{

		Connection con = null;
		DBConection2 db = new DBConection2();
		String sql = "UPDATE suser SET pontoi = pontoi + ? WHERE username = ?;";
		try {
		 db.open(); //open connection
		 con = db.getConnection(); //get Connection

		 PreparedStatement stmt = con.prepareStatement(sql);

		 stmt.setInt(1, points);
		 stmt.setString(2, username);

		 stmt.executeUpdate();

		 stmt.close();
		 db.close(); //close connection
	 } catch (Exception e) {

		 db.close();
		 throw new Exception("An error occured while inserting user to database: " + e.getMessage());

	 } finally {

		 if(con != null)
			 con.close();

		}
	 }
}
