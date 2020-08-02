package JoinUsers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import SUser.*;
import Partner.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Freeroutes
 *
 */

public class JoinSuserDAO {
	public JoinSuserDAO(){

	}
	public String joinSuser (String eventCode, String username) throws Exception {
			Connection con = null;
			DB_Connection db = new DB_Connection();
			String sql = "INSERT INTO joinsusers(eventCode, username) VALUES (?, ?);";
			PreparedStatement stmt=null;
			String join=null;
			try {
				db.open();
				con = db.getConnection();
				stmt = con.prepareStatement(sql);
				stmt.setString(1, eventCode);
				stmt.setString(2, username);
				stmt.executeUpdate();
				join="true";
				stmt.close();
			} catch (Exception e) {

				db.close();
				throw new Exception("An error occured while inserting joinSuser to database: " + e.getMessage());

			} finally {

				if(con != null)
					con.close();

			}
			return join;

	}
	public String getJoinSuser (String eventCode, String username)throws Exception{
			Connection con = null;
			DB_Connection db = new DB_Connection();
			String join=null;
			String sql = "SELECT * FROM joinsusers WHERE username =? AND eventCode=?";
			try {
				db.open();
				con = db.getConnection(); //get Connection
				PreparedStatement stmt = con.prepareStatement(sql);
				stmt.setString(1, username);
				stmt.setString(2, eventCode);
				ResultSet rs = stmt.executeQuery();
				while(rs.next()) {
					join="join";
				}
				rs.close();
				stmt.close();
			} catch(Exception e) {
				throw new Exception("Exception:" + e.getMessage());
			}
			return join;
	}

	public void updateJoinSuser (String status, String eventCode, String username) throws Exception{
			Connection con = null;
			DB_Connection db = new DB_Connection();
			String sql = "UPDATE joinsusers SET status =? WHERE eventCode =? AND username=?;";
			try {
				db.open();
				con = db.getConnection(); //get Connection
				PreparedStatement stmt = con.prepareStatement(sql);
				stmt.setString(1, status);
				stmt.setString(2, eventCode);
				stmt.setString(3, username);
				stmt.executeUpdate();

				stmt.close();
				db.close();
			} catch(Exception e) {
				throw new Exception("Exception:" + e.getMessage());
			}
	}

	public void pointsSUser (String username, int points)  throws Exception{

		Connection con = null;
		DB_Connection db = new DB_Connection();
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
