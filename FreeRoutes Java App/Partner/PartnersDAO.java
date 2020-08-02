package Partner;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Partner.*;
import java.util.ArrayList;
import java.util.List;
import Login_signUp.User;

/**
 *
 * @author Freeroutes
 *
 */

 public class PartnersDAO {
 	public PartnersDAO (){

	}
	public List<Partner> getPartners () throws Exception{
			Connection con = null;
			DBConection db = new DBConection();
			String sql = "SELECT * FROM partner,users WHERE partner.username=users.username;";
			List<Partner> partners = new ArrayList<Partner>();
			PreparedStatement stmt=null;
			ResultSet rs=null;
			try {
				db.open();
				con = db.getConnection(); //get Connection
				stmt = con.prepareStatement(sql);
				rs = stmt.executeQuery();
				while(rs.next()) {
					partners.add(new Partner(rs.getString("partnersName"), rs.getString("zip"), rs.getInt("number"),rs.getString("street"), rs.getString("municipaliry"),
									          rs.getString("contactName"), rs.getString("contactSurname"), rs.getString("contactPhone"), rs.getString("typeEvent"),
									          rs.getString("description"), rs.getString("facebook"), rs.getString("users.username"),rs.getString("photo"),rs.getString("email")));
				}
				rs.close();
				stmt.close();
			} catch(Exception e) {
				throw new Exception("Exception:" + e.getMessage());
			}
			return partners;
	}
	public Partner getPartner(String eventCode)throws Exception{
		Connection con = null;
		DBConection db = new DBConection();
		String sql = "SELECT username FROM createevent where eventCode=?;";
		String username=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			db.open();
			con = db.getConnection(); //get Connection
			stmt = con.prepareStatement(sql);
			stmt.setString(1, eventCode);
			rs = stmt.executeQuery();
			while(rs.next()) {
				username=rs.getString("username");
			}
			rs.close();
			stmt.close();
		} catch(Exception e) {
			throw new Exception("Exception:" + e.getMessage());
		}
		Partner partnerWithNoEmail=null;
		try {
			sql = "SELECT * FROM partner WHERE username=?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, username);
			rs = stmt.executeQuery();
			while(rs.next()) {
				partnerWithNoEmail=new Partner(rs.getString("partnersName"), rs.getString("zip"), rs.getInt("number"),rs.getString("street"), rs.getString("municipaliry"),
									          rs.getString("contactName"), rs.getString("contactSurname"), rs.getString("contactPhone"), rs.getString("typeEvent"),
									          rs.getString("description"), rs.getString("facebook"), rs.getString("username"),rs.getString("photo"));
			}
			rs.close();
			stmt.close();
		} catch(Exception e) {
			throw new Exception("Exception:" + e.getMessage());
		}
		Partner partner=null;
		try {
			sql = "SELECT email FROM users WHERE username=?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, username);
			rs = stmt.executeQuery();
			while(rs.next()) {
					partner=new Partner(partnerWithNoEmail.getPartnersName(),partnerWithNoEmail.getZip(),partnerWithNoEmail.getNumber(),partnerWithNoEmail.getStreet(),
					partnerWithNoEmail.getMunicipality(),partnerWithNoEmail.getContactName(),partnerWithNoEmail.getContactSurname(),partnerWithNoEmail.getContactPhone(),
					partnerWithNoEmail.getTypeEvent(),partnerWithNoEmail.getDescription(),partnerWithNoEmail.getFacebook(),partnerWithNoEmail.getUsername(),
					partnerWithNoEmail.getPhoto(),rs.getString("email"));
			}
			rs.close();
			stmt.close();
		} catch(Exception e) {
			throw new Exception("Exception:" + e.getMessage());
		}
		return partner;
	}
	public void insertPhoto(String path, String username) throws Exception{
		Connection con = null;
		DBConection db = new DBConection();
		String sql = "UPDATE ismgroup3.partner SET photo=? WHERE username=?;";
		PreparedStatement stmt=null;
		try {
			db.open(); //open connection
			con = db.getConnection(); //get Connection
			stmt = con.prepareStatement(sql);
			stmt.setString(1, path);
			stmt.setString(2, username);
			stmt.executeUpdate();
			stmt.close();
			db.close(); //close connection
		} catch (Exception e) {
			db.close();
			throw new Exception("An error occured while update photo to database: " + e.getMessage());
		} finally {

			if(con != null)
				con.close();

		}
	}
 }