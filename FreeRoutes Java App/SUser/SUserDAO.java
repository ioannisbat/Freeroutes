package SUser;

/**
 *
 * @author Freeroutes
 *
 */

import java.util.*;
import java.sql.*;

public class SUserDAO {

	public SUserDAO (){

	}


	public void insertPhoto(String path, String username) throws Exception{
		Connection con = null;
		DBConection db = new DBConection();
		String sql = "UPDATE suser SET photo=? WHERE username=?;";
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






