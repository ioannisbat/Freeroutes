package Events;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import java.time.*;
import java.text.SimpleDateFormat;

/**
 * @author Freeroutes *
 */

public class EventsDAO {

	//Constructor
	public EventsDAO() {

	}

/**
* filterEvents method has as an input sport's type and returns a list with events of this sport!
*/
	public List<Events> filterEvents (String choice) throws Exception {

		Connection con = null;
		List<Events> eventsList = new ArrayList<Events>();
		Dbcon db = new Dbcon();

		try {

			db.open(); //open connection
			con = db.getConnection(); //get Connection
			String sqlquery = "SELECT * FROM Event WHERE type = ? ;";
			PreparedStatement stmt = con.prepareStatement(sqlquery);
			stmt.setString(1, choice);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {

				eventsList.add(new Events(rs.getString("eventCode"), rs.getString("eventTitle"), rs.getString("type"), rs.getDate("date"), rs.getString("timeE"),
								          rs.getInt("number"), rs.getString("street"), rs.getString("zip"),
								          rs.getString("municipality"), rs.getString("route"), rs.getString("level"),
								          rs.getString("comments"), rs.getInt("points"),rs.getString("photo"),rs.getString("startPoint")));

			}

			rs.close();
			stmt.close();
			db.close(); //close connection

			return eventsList;

		} catch (Exception e) {

			db.close();
			throw new Exception("An error occured while getting Emploees from database: " + e.getMessage());

		} finally {

			if(con != null)
				con.close();

		}

	}//end of filterEvents method
/*
* The method filterTimE has an input choice for later or recent events and return a list with them!
*/
	public List<Events> filterTimE (String choice)throws Exception {

		Connection con1 = null;
		List<Events> eventList = new ArrayList<Events>();
		Dbcon db1 = new Dbcon();
		PreparedStatement stmt1 = null;
		Date date= new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		int month = cal.get(Calendar.MONTH)+1;
		int year = cal.get(Calendar.YEAR);


		try {

					db1.open(); //open connection
					con1 = db1.getConnection(); //get Connection
					String sqlquery = null;

					if (choice.equals("Πρόσφατα")){

						sqlquery = "SELECT * FROM Event WHERE (month(date) = ? AND year(date) = ?) ORDER BY date ;";
						stmt1 = con1.prepareStatement(sqlquery);
						stmt1.setInt(2, year);
						stmt1.setInt(1, month);

					}else {

						sqlquery = "SELECT * FROM Event WHERE (month(date) > ? AND year(date) = ?) OR (year(date) > ?) ORDER BY date ;";
						stmt1 = con1.prepareStatement(sqlquery);
						stmt1.setInt(1, month);
						stmt1.setInt(2, year);
						stmt1.setInt(3, year);

					}


					ResultSet rs1 = stmt1.executeQuery();

					while (rs1.next()) {

						eventList.add(new Events(rs1.getString("eventCode"), rs1.getString("eventTitle"), rs1.getString("type"), rs1.getDate("date"), rs1.getString("timeE"),rs1.getInt("number"),
												 rs1.getString("street"), rs1.getString("zip"),rs1.getString("municipality"),
									             rs1.getString("route"), rs1.getString("level"),rs1.getString("comments"),
									             rs1.getInt("points"),rs1.getString("photo"),rs1.getString("startPoint")));

					}

					rs1.close();
					stmt1.close();
					db1.close(); //close connection

					return eventList;

				} catch (Exception e) {
					db1.close();
					throw new Exception("An error occured while getting Emploees from database: " + e.getMessage());

				} finally {

					if(con1 != null)
						con1.close();

				}
		}// end of method filterTimE

/*
* The method returnAllEv has nothing as input and returns a list with all the events that haven't expire yet!
*/

		public List<Events> returnAllEv () throws Exception{

			Connection con2 = null;
			List<Events> eventList1 = new ArrayList<Events>();
			Dbcon db2 = new Dbcon();
			Date date= new Date();
			Calendar cal = Calendar.getInstance();
			cal.setTime(date);
			int month = cal.get(Calendar.MONTH)+1;
			int year = cal.get(Calendar.YEAR);
			int day = cal.get(Calendar.DAY_OF_MONTH);

			try {

				db2.open(); //open connection
				con2 = db2.getConnection(); //get Connection
				String sqlquery = "SELECT * FROM Event WHERE date >= CURDATE() ORDER BY date;";
				PreparedStatement stmt2 = con2.prepareStatement(sqlquery);
				//stmt2.setInt(1, day);
				//stmt2.setInt(2, month);
				//stmt2.setInt(3, year);
				//stmt2.setInt(4, year);
				//stmt2.setInt(5, month);
				//stmt2.setInt(6, year);
				ResultSet rs2 = stmt2.executeQuery();

					while (rs2.next()) {

						eventList1.add(new Events(rs2.getString("eventCode"), rs2.getString("eventTitle"), rs2.getString("type"), rs2.getDate("date"), rs2.getString("timeE"),rs2.getInt("number"),
												 rs2.getString("street"), rs2.getString("zip"),rs2.getString("municipality"),
												 rs2.getString("route"), rs2.getString("level"),rs2.getString("comments"),
												 rs2.getInt("points"),rs2.getString("photo"),rs2.getString("startPoint")));
					}

					rs2.close();
					stmt2.close();
					db2.close(); //close connection

					return eventList1;

			} catch (Exception e) {

				db2.close();
				throw new Exception("An error occured while getting Emploees from database: " + e.getMessage());

			} finally {

				if(con2 != null)
					con2.close();

			}

		}//end of method returnAllEv

/*
* Method getFullevent has as an input the event's code and return an Event Object!
*/

		public Events getFullevent (String eventCode)throws Exception{
			Connection con = null;
			Dbcon db = new Dbcon();
			String sql = "SELECT * FROM event WHERE eventcode=?;";
			Events event = null;
			try {
				db.open();
				con = db.getConnection(); //get Connection
				PreparedStatement stmt = con.prepareStatement(sql);
				stmt.setString(1, eventCode);
				ResultSet rs = stmt.executeQuery();
				//thelo ta stoixeia tou event oxi to pinaka
				while(rs.next()) {
					 event = new Events(rs.getString("eventCode"), rs.getString("eventTitle"), rs.getString("type"), rs.getDate("date"),
														rs.getString("timeE"), rs.getInt("number"), rs.getString("street"), rs.getString("zip"),
														rs.getString("municipality"), rs.getString("route"), rs.getString("level"),
														rs.getString("comments"), rs.getInt("points"),rs.getString("photo"),rs.getString("startPoint"));
				}
				rs.close();
				stmt.close();
			} catch(Exception e) {
				throw new Exception("Exception:" + e.getMessage());
			}
			return event;
		}

/*
* Method insertPhotoEV inserts a photo to an Events object!
*/

		public boolean insertPhotoEV(String path, String eventCode) throws Exception{
				Connection con = null;
				Dbcon db = new Dbcon();
				String sql = "UPDATE ismgroup3.event SET photo=? WHERE eventCode=?;";
				PreparedStatement stmt=null;
				try {
					db.open(); //open connection
					con = db.getConnection(); //get Connection
					stmt = con.prepareStatement(sql);
					stmt.setString(1, path);
					stmt.setString(2, eventCode);
					stmt.executeUpdate();
					stmt.close();
					db.close(); //close connection
					return true;
				} catch (Exception e) {
					db.close();
					throw new Exception("An error occured while update photo to database: " + e.getMessage());
				} finally {

					if(con != null)
						con.close();

				}
		}

/*
* insertEvent method insert a new Event to the database!
*/

		public String insertEvent(String userName, String evenTitle, String type,String date, String time,int number,String street,
						String zip, String municipality, String route, String level, String comments, int points, String startPoint) throws Exception {

			Connection con = null;
			Dbcon db = new Dbcon();
			String sql = "INSERT INTO event(eventCode, street, zip, number, municipality, timeE, type, eventTitle, route, level, comments, points, date, startPoint) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
			PreparedStatement stmt=null;
			try {

				db.open(); //open connection
				con = db.getConnection(); //get Connection
				stmt = con.prepareStatement(sql);

				SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
				Date startDate = df.parse(date);

				Events evnt = new Events(evenTitle, type, startDate, time, number, street, zip, municipality, route, level, comments, points, startPoint);

				SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
				Date parsed = format.parse(date);
        		java.sql.Date sqlDate = new java.sql.Date(parsed.getTime());

				stmt.setString(1, evnt.getEventCode());
				stmt.setString(2, street);
				stmt.setString(3, zip);
				stmt.setInt(4, number);
				stmt.setString(5, municipality);
				stmt.setString(6, time);
				stmt.setString(7, type);
				stmt.setString(8, evenTitle);
				stmt.setString(9, route);
				stmt.setString(10, level);
				stmt.setString(11, comments);
				stmt.setInt(12, points);
				stmt.setDate(13, sqlDate);
				stmt.setString(14, startPoint);

				stmt.executeUpdate();

				stmt.close();
				db.close(); //close connection
				createEv(userName, evnt.getEventCode());
				String code = evnt.getEventCode();
				return code;

			} catch (Exception e) {

				db.close();
				throw new Exception("An error occured while inserting event to database: " + e.getMessage());

			} finally {

				if(con != null)
				con.close();

			}



		}//end of insertEvent method

/*
* createEv method inserts to the table createevent who partener created the new event!
*/

		public void createEv(String usrn, String evC) throws Exception {

			Connection con = null;
			Dbcon db = new Dbcon();
			String sql = "INSERT INTO createevent(eventCode, username) VALUES (?, ?);";
			PreparedStatement stmt=null;

			try {

				db.open(); //open connection
				con = db.getConnection(); //get Connection
				stmt = con.prepareStatement(sql);

				stmt.setString(1, evC);
				stmt.setString(2, usrn);

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
		}//end of method createEv




}//end of class
