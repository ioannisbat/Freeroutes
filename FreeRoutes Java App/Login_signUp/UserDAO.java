package Login_signUp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import SUser.*;
import Partner.*;
import java.lang.*;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author Freeroutes
 *
 */

 public class UserDAO{
	 public UserDAO(){

	 }
	 public void checkUsernameS (HttpServletRequest request, HttpServletResponse response, String username) throws Exception{
		 Connection con = null;
		 DBConection db = new DBConection();
		 String sql = "SELECT * FROM users WHERE username = ?;";
		 int i=0;
		try {
			db.open();
			con = db.getConnection(); //get Connection

			PreparedStatement stmt = con.prepareStatement(sql);

			stmt.setString(1, username);

			ResultSet rs = stmt.executeQuery();

			while(rs.next()) {
				i++;
			}

			rs.close();
			stmt.close();
			if (i>0){
				request.setAttribute("msgSU", "The username " + username + " already exists");
				RequestDispatcher pass = request.getRequestDispatcher("index.jsp");
				pass.forward(request, response);
			}
			db.close();

		} catch (SQLException e) {

			db.close();
			throw new Exception("The username " + username + " already exists");

		} catch (Exception e) {

			db.close();
			throw new Exception("An error occured while inserting user to database: " + e.getMessage());

		} finally {

			if(con != null)
				con.close();

		 }
	 }
	public void checkUsernameP (HttpServletRequest request, HttpServletResponse response, String username) throws Exception{
		 Connection con = null;
		 DBConection db = new DBConection();
		 String sql = "SELECT * FROM users WHERE username = ?;";
		 int i=0;
		try {
			db.open();
			con = db.getConnection(); //get Connection

			PreparedStatement stmt = con.prepareStatement(sql);

			stmt.setString(1, username);

			ResultSet rs = stmt.executeQuery();

			while(rs.next()) {
				i++;
			}

			rs.close();
			stmt.close();
			if (i>0){
				request.setAttribute("msgPU", "The username " + username + " already exists");
				RequestDispatcher pass = request.getRequestDispatcher("index.jsp");
				pass.forward(request, response);
			}
			db.close();

		} catch (SQLException e) {

			db.close();
			throw new Exception("The username " + username + " already exists");

		} catch (Exception e) {

			db.close();
			throw new Exception("An error occured while inserting user to database: " + e.getMessage());

		} finally {

			if(con != null)
				con.close();

		 }
	 }
	 public User importUser (String username, String password, String email)  throws Exception{

		 Connection con = null;
		 DBConection db = new DBConection();
		 String sql = "INSERT INTO  users (username, password, email, startDate) VALUES (?, ?, ?, ?);";
		 String startDate=getStartDate();
		 try {
			db.open(); //open connection
			con = db.getConnection(); //get Connection

			PreparedStatement stmt = con.prepareStatement(sql);

			stmt.setString(1, username);
			stmt.setString(2, password);
			stmt.setString(3, email);
			stmt.setString(4, startDate);

			stmt.executeUpdate();

			stmt.close();
			db.close(); //close connection

			User newUser = new User (username, password, email,startDate);
			return newUser;

		} catch (SQLException e) {

			db.close();
			throw new Exception("The username " + username + " already exists");

		} catch (Exception e) {

			db.close();
			throw new Exception("An error occured while inserting user to database: " + e.getMessage());

		} finally {

			if(con != null)
				con.close();

		 }
	 }
	private String getStartDate(){
		Calendar cal = new GregorianCalendar();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		int hours = cal.get(Calendar.HOUR_OF_DAY);
		int minutes = cal.get(Calendar.MINUTE);
     	int seconds = cal.get(Calendar.SECOND);
     	String Date=year+"-"+month+"-"+day+" "+hours+":"+minutes+":"+seconds;
     	return Date;
	}
	 public SUser importSUser (String name, String surname, String username)  throws Exception{

		 Connection con = null;
		 DBConection db = new DBConection();
		 String sql = "INSERT INTO  suser (name, surname, level, pontoi, username) VALUES (?, ?, ?, ?, ?);";
		 try {
			db.open(); //open connection
			con = db.getConnection(); //get Connection

			PreparedStatement stmt = con.prepareStatement(sql);

			stmt.setString(1, name);
			stmt.setString(2, surname);
			stmt.setInt(3, 0);
			stmt.setDouble(4, 0.0);
			stmt.setString(5, username);

			stmt.executeUpdate();

			stmt.close();
			db.close(); //close connection
			SUser newSUser = new SUser(name, surname, 0, 0.0);
			return newSUser;

		} catch (Exception e) {

			db.close();
			throw new Exception("An error occured while inserting user to database: " + e.getMessage());

		} finally {

			if(con != null)
				con.close();

		 }
	 }
	 public Partner importPartner (String partnerName, String zip, int number, String street, String municipality,
	 		String contactName, String contactSurname, String contactPhone, String typeEvent, String description,
	 		String facebook, String username)  throws Exception{

		 Connection con = null;
		 DBConection db = new DBConection();
		 String sql = "INSERT INTO  partner (partnersName, zip, number, street, municipaliry, contactName, contactSurname,"+
		 "contactPhone, typeEvent, description, facebook, username) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
		 try {
			db.open(); //open connection
			con = db.getConnection(); //get Connection

			PreparedStatement stmt = con.prepareStatement(sql);

			stmt.setString(1, partnerName);
			stmt.setString(2, zip);
			stmt.setInt(3, number);
			stmt.setString(4, street);
			stmt.setString(5, municipality);
			stmt.setString(6,contactName);
			stmt.setString(7, contactSurname);
			stmt.setString(8, contactPhone);
			stmt.setString(9, typeEvent);
			stmt.setString(10, description);
			stmt.setString(11, facebook);
			stmt.setString(12, username);

			stmt.executeUpdate();

			stmt.close();
			db.close(); //close connection
			Partner newPartner = new Partner (partnerName,zip, number, street, municipality, contactName,
			 contactSurname, contactPhone, typeEvent, description, facebook);
			return newPartner;
		} catch (Exception e) {

			db.close();
			throw new Exception("An error occured while inserting user to database: " + e.getMessage());

		} finally {

			if(con != null)
				con.close();

		 }
	 }
 }