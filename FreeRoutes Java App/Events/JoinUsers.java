package Events;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import SUser.*;
import Partner.*;
import JoinUsers.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Freeroutes  *
 */

public class JoinUsers {
	public JoinUsers(){

	}
	public List<JoinSuser> getUsers (String eventCode) throws Exception {
			Connection con = null;
			Dbcon db = new Dbcon();
			String sql = "SELECT DISTINCT * FROM joinsusers,suser,users "+
			"WHERE eventcode=? AND suser.username = joinsusers.username AND users.username=suser.username;";
			List<JoinSuser> SUsers = new ArrayList<JoinSuser>();
			PreparedStatement stmt=null;
			ResultSet rs=null;
			try {
				db.open();
				con = db.getConnection(); //get Connection
				stmt = con.prepareStatement(sql);
				stmt.setString(1, eventCode);//perno to kodiko tou events kai perno ola ta users
				rs = stmt.executeQuery();
				//thelo ta stoixeia tou event oxi to pinaka
				while(rs.next()) {
					 SUsers.add(new JoinSuser(rs.getString("name"), rs.getString("surname"),rs.getString("email"), rs.getString("eventCode"), rs.getString("username"),rs.getString("status")));
				}
				rs.close();
				stmt.close();
			} catch (Exception e) {

				db.close();
				throw new Exception("An error occured while inserting event to database: " + e.getMessage());

			} finally {

				if(con != null)
					con.close();

			}
			return SUsers;
	}

	public List<JoinSuser> getJoinUsers (String eventCode) throws Exception {
			Connection con = null;
			Dbcon db = new Dbcon();
			String sql = "SELECT DISTINCT * FROM joinsusers,suser,users "+
			"WHERE eventcode=? AND suser.username = joinsusers.username AND users.username=suser.username;";
			List<JoinSuser> joinUsers = new ArrayList<JoinSuser>();
			PreparedStatement stmt=null;
			ResultSet rs=null;
			try {
				db.open();
				con = db.getConnection(); //get Connection
				stmt = con.prepareStatement(sql);
				stmt.setString(1, eventCode);//perno to kodiko tou events kai perno ola ta users
				rs = stmt.executeQuery();
				//thelo ta stoixeia tou event oxi to pinaka
				while(rs.next()) {
					 joinUsers.add(new JoinSuser(rs.getString("name"), rs.getString("surname"),rs.getString("email"), rs.getString("eventCode"), rs.getString("username"),rs.getString("status")));
				}
				rs.close();
				stmt.close();
			} catch (Exception e) {

				db.close();
				throw new Exception("An error occured while inserting event to database: " + e.getMessage());

			} finally {

				if(con != null)
					con.close();

			}
			return joinUsers;
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
