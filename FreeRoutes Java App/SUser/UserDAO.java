package SUser;

/**
 *
 * @author Freeroutes
 *
 */

import java.util.*;
import java.sql.*;

public class UserDAO {

	public UserDAO () {

	}

	public SUser userChar(String username) throws Exception {

		DB_User_Con db1 = new DB_User_Con();
		Connection con = null;

		try {

			db1.open();

			con = db1.getConnection();

			String query7 = "SELECT * FROM `suser` WHERE `username` = ?;";

			PreparedStatement stm1 = con.prepareStatement(query7);
			stm1.setString(1, username);

			ResultSet rs = stm1.executeQuery();

			if (rs.next()) {

				String name1 = rs.getString("name");
				String surname1 = rs.getString("surname");
				double pontoi1 = rs.getDouble("pontoi");
				int level1 = rs.getInt("level");
				String photo1 = rs.getString("photo");


				SUser suser1 = new SUser(name1, surname1, level1, pontoi1, photo1);
				rs.close();
				stm1.close();
				db1.close();
				return suser1;

			} else {
				rs.close();
				stm1.close();
				db1.close();
				throw new Exception("Δεν είναι καταχωρήμένος ο χρήστης.");
			}

		} catch (Exception e) {
			throw new Exception(e.getMessage());

		} finally {

			if(con != null)
				con.close();
		}
	}


}






