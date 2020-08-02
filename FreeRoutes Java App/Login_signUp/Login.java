package Login_signUp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import SUser.*;
import Partner.*;

/**
 *
 * @author Freeroutes
 *
 */

public class Login{
	public Login(){

	}
	public User authenticateUser(String username, String password) throws Exception{
		Connection con = null;
		DBConection db = new DBConection();
		String sqlquery = "SELECT * FROM users WHERE username= ? AND password = ?;";
		User findUser = null;
		try {
			db.open();
			con = db.getConnection(); //get Connection

			PreparedStatement stmt1 = con.prepareStatement(sqlquery);

			stmt1.setString(1, username);
			stmt1.setString(2, password);

			ResultSet rs = stmt1.executeQuery();

			while(rs.next()) {
				findUser = new User(rs.getString("username"), rs.getString("password"), rs.getString("email"), rs.getString("startDate"));
			}

			rs.close();
			stmt1.close();
			db.close();

			if ( findUser == null){
				throw new Exception("Wrong username or password");
			} else {
				return findUser;
			}

		} catch(Exception e) {

			throw new Exception("Exception:" + e.getMessage());

		} finally {

			if(con != null)
				con.close();

		}
	}

	public SUser authenticateSUser(String username) throws Exception{
		Connection con = null;
		DBConection db = new DBConection();
		String sqlquery = "SELECT * FROM suser WHERE username= ?;";
		SUser findSUser = null;
		try {
			db.open();
			con = db.getConnection(); //get Connection

			PreparedStatement stmt1 = con.prepareStatement(sqlquery);

			stmt1.setString(1, username);

			ResultSet rs = stmt1.executeQuery();

			while(rs.next()) {
				findSUser = new SUser(rs.getString("name"), rs.getString("surname"), rs.getInt("level"), rs.getDouble("pontoi"), rs.getString("photo"),rs.getString("username"));
			}

			rs.close();
			stmt1.close();
			db.close();


			return findSUser;

		} catch(Exception e) {

			throw new Exception("Exception:" + e.getMessage());

		} finally {

			if(con != null)
				con.close();

		}
	}
	public Partner authenticatePartner(String username) throws Exception{
		Connection con = null;
		DBConection db = new DBConection();
		String sqlquery = "SELECT * FROM partner WHERE username= ?;";
		Partner findPartner = null;
		try {
			db.open();
			con = db.getConnection(); //get Connection

			PreparedStatement stmt1 = con.prepareStatement(sqlquery);

			stmt1.setString(1, username);

			ResultSet rs = stmt1.executeQuery();

			while(rs.next()) {
				findPartner = new Partner(rs.getString("partnersName"), rs.getString("zip"), rs.getInt("number"),
				rs.getString("street"),rs.getString("municipaliry"),rs.getString("contactName"),
				rs.getString("contactSurname"),rs.getString("contactPhone"),rs.getString("typeEvent"),
				rs.getString("description"),rs.getString("facebook"),rs.getString("username"),rs.getString("photo"));
			}

			rs.close();
			stmt1.close();
			db.close();


			return findPartner;

		} catch(Exception e) {

			throw new Exception("Exception:" + e.getMessage());

		} finally {

			if(con != null)
				con.close();

		}
	}

}