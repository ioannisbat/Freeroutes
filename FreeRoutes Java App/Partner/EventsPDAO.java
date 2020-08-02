package Partner;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import SUser.*;
import Partner.*;
import Events.Events;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Freeroutes
 *
 */

public class EventsPDAO {
	public EventsPDAO(){

	}
	//tha perno ola ta events pou exei o partner kai tha ta apothikeuo se mia lista.
	public List<Events> getEventsPartner (String username)throws Exception{
		Connection con = null;
		DBConection db = new DBConection();
		String sql = "SELECT * FROM createevent,event WHERE username=? AND createevent.eventCode = event.eventCode ORDER BY date DESC;";
		List<Events> eventsP = new ArrayList<Events>();
		try {
			db.open();
			con = db.getConnection(); //get Connection
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, username);
			ResultSet rs = stmt.executeQuery();
			//thelo ta stoixeia tou event oxi to pinaka
			while(rs.next()) {
				eventsP.add(new Events(rs.getString("eventCode"), rs.getString("eventTitle"), rs.getString("type"), rs.getDate("date"),
								          rs.getString("timeE"), rs.getInt("number"), rs.getString("street"), rs.getString("zip"),
								          rs.getString("municipality"), rs.getString("route"), rs.getString("level"),
								          rs.getString("comments"), rs.getInt("points"),rs.getString("photo"),rs.getString("startPoint")));
			}
			rs.close();
			stmt.close();
		} catch(Exception e) {
			throw new Exception("Exception:" + e.getMessage());
		}
		return eventsP;
	}

	public Events getEventPartner (String username, String eventCode)throws Exception{
		Connection con = null;
		DBConection db = new DBConection();
		String sql = "SELECT * FROM createevent, event WHERE createevent.username=? AND createevent.eventcode=? AND event.eventcode=createevent.eventcode;";
		Events event = null;
		try {
			db.open();
			con = db.getConnection(); //get Connection
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, username);
			stmt.setString(2, eventCode);
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
	//tha prepei na perno kai to trexon event? pos omos?
	//prepei na pernei auto pou einai pio koda sthn hmeromilia
	//SELECT * FROM event WHERE username = ? AND monthE >= ? AND dayE =

}
