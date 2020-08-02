package Events;

import java.util.*;
import java.lang.Math;
/**
 * @author Freeroutes *
 */

public class Events {

	private String evenTitle; // event's title
	private Date date;
	private String time; //event's time
	private int number; //number of street
	private String street;
	private String zip;
	private String municipality;
	private String type; //Roller skating or Cycling or Hiking or Running
	private String route; // the route of the event
	private String level; // Event's Difficulty
	private String comments; // comment for the event
	private int points; // the amount of points that the participant will win
	private String photo;//the photo of the event
	private static int counter=0;
	private String eventCode;
	private String startPoint;

	Random rand = new Random();



	//constructor
	public Events (String evenTitle, String type,Date date, String time,int number,String street,
					String zip, String municipality, String route, String level, String comments, int points, String photo, String startPoint) {

		int  n = rand.nextInt(10000) + 1;
		counter = counter + n;
		this.eventCode= ""+counter+"";
		this.evenTitle = evenTitle;
		this.date = date;
		this.time = time;
		this.number = number;
		this.street = street;
		this.zip = zip;
		this.municipality = municipality;
		this.type = type;
		this.route = route;
		this.level = level;
		this.comments = comments;
		this.points = points;
		this.photo = photo;
		this.startPoint = startPoint;
	}

	public Events (String evenTitle, String type,Date date, String time,int number,String street,
						String zip, String municipality, String route, String level, String comments, int points, String startPoint) {

			int  n = rand.nextInt(10000) + 1;
			counter = counter + n;
			this.eventCode= ""+counter+"";
			this.evenTitle = evenTitle;
			this.date = date;
			this.time = time;
			this.number = number;
			this.street = street;
			this.zip = zip;
			this.municipality = municipality;
			this.type = type;
			this.route = route;
			this.level = level;
			this.comments = comments;
			this.points = points;
			this.startPoint = startPoint;
	}

	public Events (String eventCode, String evenTitle, String type,Date date, String time,int number,String street,
				   String zip, String municipality, String route, String level, String comments,int points, String photo, String startPoint) {

			this.eventCode= eventCode;
			this.evenTitle = evenTitle;
			this.date = date;
			this.time = time;
			this.number = number;
			this.street = street;
			this.zip = zip;
			this.municipality = municipality;
			this.type = type;
			this.route = route;
			this.level = level;
			this.comments = comments;
			this.points = points;
			this.photo = photo;
			this.startPoint = startPoint;
	}

	//set and get Methods
	public void setEventCode(String eventCode) {

		this.eventCode = eventCode;

	}

	public String getEventCode() {

		return this.eventCode;

	}

	public void setEvenTitle(String evenTitle) {

		this.evenTitle = evenTitle;

	}

	public String getEvenTitle() {

		return this.evenTitle;

	}

	public void setDate (Date date) {

		this.date = date;
	}

	public Date getDate() {

		return this.date;
	}

	public void setTime(String time) {

			this.time = time;

	}

	public String getTime() {

		return this.time;

	}

	public void setNumber(int number) {

		this.number = number;

	}

	public int getNumber() {

		return this.number;

	}


	public void setStreet(String street) {

		this.street = street;

	}

	public String getStreet() {

		return this.street;

	}


	public void setZip(String zip) {

		this.zip = zip;

	}

	public String getZip() {

		return this.zip;

	}

	public void setMunicipality(String municipality) {

		this.municipality = municipality;

	}

	public String getMunicipality() {

		return this.municipality;

	}

	public void setType(String type) {

		this.type = type;

	}

	public String getType() {

		return this.type;

	}

	public void setRoute(String route) {

		this.route = route;

	}

	public String getRoute() {

		return this.route;

	}

	public void setLevel(String level) {

		this.level = level;

	}

	public String getLevel() {

		return this.level;

	}

	public void setComments(String comments) {

		this.comments = comments;

	}

	public String getComments() {

		return this.comments;

	}


	public void setPoints(int points) {

		this.points = points;

	}

	public int getPoints() {

		return this.points;

	}

	public String getPhoto() {

		return this.photo;

	}

	public void setPhoto(String photo) {

		this.photo = photo;

	}

	public void setStartPoint(String startPoint) {

		this.startPoint = startPoint;

	}

	public String getStartPoint() {

		return this.startPoint;

	}


}//end of class
