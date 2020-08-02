package SUser;

import java.sql.*;
import SUser.*;
import Events.*;
import java.util.*;

/**
 *
 * @author Freeroutes
 *
 */

public class UsersEventsDAO {

	public UsersEventsDAO() {


	}

	/*
	 *
	 * This method returns a list which includes all the events that the user has attended or will attend in the future.
	 *
	 */
	public List<Events> getUsersEvents (String username) throws Exception {

		Connection con = null;
		DB_User_Con db = new DB_User_Con();
		String sql = "SELECT * FROM event WHERE event.eventCode in (SELECT eventCode FROM joinsusers WHERE username = ?) ORDER BY date ASC;";
		List<Events> usersList = new ArrayList<Events>();

		try {

			db.open();
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, username);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {

				usersList.add(new Events(rs.getString("eventCode"), rs.getString("eventTitle"), rs.getString("type"), rs.getDate("date"),
								          rs.getString("timeE"), rs.getInt("number"), rs.getString("street"), rs.getString("zip"),
								          rs.getString("municipality"), rs.getString("route"), rs.getString("level"),
								          rs.getString("comments"), rs.getInt("points"),rs.getString("photo"),rs.getString("startPoint")));
			}

			rs.close();
			stmt.close();

		} catch(Exception e) {

			throw new Exception("Exception: " + e.getMessage());

		}

		return usersList;
	}

	/*
	 *
	 * This method returns a list which includes all the events that the user has attended and this fact is checked by the partner.
	 *
	 */
	public List<Events> getYesUsersEvents (String username) throws Exception {

			Connection con = null;
			DB_User_Con db = new DB_User_Con();
			String sql = "SELECT * FROM event WHERE event.eventCode in (SELECT eventCode FROM joinsusers WHERE username = ? AND status = 'yes') ORDER BY date ASC;";
			List<Events> usersList = new ArrayList<Events>();

			try {

				db.open();
				con = db.getConnection();
				PreparedStatement stmt = con.prepareStatement(sql);
				stmt.setString(1, username);
				ResultSet rs = stmt.executeQuery();
				while(rs.next()) {

					usersList.add(new Events(rs.getString("eventCode"), rs.getString("eventTitle"), rs.getString("type"), rs.getDate("date"),
									          rs.getString("timeE"), rs.getInt("number"), rs.getString("street"), rs.getString("zip"),
									          rs.getString("municipality"), rs.getString("route"), rs.getString("level"),
									          rs.getString("comments"), rs.getInt("points"),rs.getString("photo"),rs.getString("startPoint")));
				}

				rs.close();
				stmt.close();

			} catch(Exception e) {

				throw new Exception("Exception: " + e.getMessage());

			}

			return usersList;
	}


		/*
		 *
		 * This method returns a list which includes all the events that the user has not attended and this fact is checked by the partner.
		 *
		 */
		public List<Events> getNoUsersEvents (String username) throws Exception {

				Connection con = null;
				DB_User_Con db = new DB_User_Con();
				String sql = "SELECT * FROM event WHERE event.eventCode in (SELECT eventCode FROM joinsusers WHERE username = ? AND status = 'no') ORDER BY date ASC;";
				List<Events> usersList = new ArrayList<Events>();

				try {

					db.open();
					con = db.getConnection();
					PreparedStatement stmt = con.prepareStatement(sql);
					stmt.setString(1, username);
					ResultSet rs = stmt.executeQuery();
					while(rs.next()) {

						usersList.add(new Events(rs.getString("eventCode"), rs.getString("eventTitle"), rs.getString("type"), rs.getDate("date"),
										          rs.getString("timeE"), rs.getInt("number"), rs.getString("street"), rs.getString("zip"),
										          rs.getString("municipality"), rs.getString("route"), rs.getString("level"),
										          rs.getString("comments"), rs.getInt("points"),rs.getString("photo"),rs.getString("startPoint")));
					}

					rs.close();
					stmt.close();

				} catch(Exception e) {

					throw new Exception("Exception: " + e.getMessage());

				}

				return usersList;
	}


		/*
		 *
		 * This method returns a list which includes all the events that the user will attend and this fact is not checked by the partner.
		 *
		 */
		public List<Events> getPendingUsersEvents (String username) throws Exception {

				Connection con = null;
				DB_User_Con db = new DB_User_Con();
				String sql = "SELECT * FROM event WHERE event.eventCode in (SELECT eventCode FROM joinsusers WHERE username = ? AND status = 'pending') ORDER BY date ASC;";
				List<Events> usersList = new ArrayList<Events>();

				try {

					db.open();
					con = db.getConnection();
					PreparedStatement stmt = con.prepareStatement(sql);
					stmt.setString(1, username);
					ResultSet rs = stmt.executeQuery();
					while(rs.next()) {

						usersList.add(new Events(rs.getString("eventCode"), rs.getString("eventTitle"), rs.getString("type"), rs.getDate("date"),
										          rs.getString("timeE"), rs.getInt("number"), rs.getString("street"), rs.getString("zip"),
										          rs.getString("municipality"), rs.getString("route"), rs.getString("level"),
										          rs.getString("comments"), rs.getInt("points"),rs.getString("photo"),rs.getString("startPoint")));
					}

					rs.close();
					stmt.close();

				} catch(Exception e) {

					throw new Exception("Exception: " + e.getMessage());

				}

				return usersList;
	}


}



