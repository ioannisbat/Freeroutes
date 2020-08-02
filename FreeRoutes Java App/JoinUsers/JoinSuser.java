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

public class JoinSuser {
	private String name;
	private String surname;
	private String email;
	private String eventCode;
	private String username;
	private String status;

	public JoinSuser(String name, String surname, String email, String eventCode, String username, String status) {
		this.name = name;
		this.surname = surname;
		this.email = email;
		this.eventCode = eventCode;
		this.username = username;
		this.status = status;
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

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEventCode() {
		return this.eventCode;
	}

	public void setEventCode(String eventCode) {
		this.eventCode = eventCode;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void joinSuser (String eventCode, String usercode) throws Exception {
			Connection con = null;
			DBConnection db = new DBConnection();
			String sql = "INSERT INTO joinsusers(eventCode, username) VALUES (?, ?);";
			PreparedStatement stmt=null;
			try {
				db.open();
				con = db.getConnection(); //get Connection
				stmt = con.prepareStatement(sql);
				stmt.setString(1, eventCode);
				stmt.setString(2, usercode);
				stmt.close();
			} catch (Exception e) {

				db.close();
				throw new Exception("An error occured while inserting joinSuser to database: " + e.getMessage());

			} finally {

				if(con != null)
					con.close();

			}

	}


}
