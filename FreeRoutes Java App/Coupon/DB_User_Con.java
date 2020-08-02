package Coupon;

/**
 *
 * @author Freeroutes
 */


import java.sql.*;

public class DB_User_Con {

	private final String dbname = "ismgroup3";
	private final String dbusername = "ismgroup3";
	private final String dbpassword = "5y6cva";

	private Connection con = null;

	public DB_User_Con() {

	}

	public Connection getConnection() {
		return this.con;
	}

	public void open() throws SQLException {
		try {
			// dynamically load the driver's class file into memory
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (Exception e) {

			throw new SQLException("MySQL Driver error: " + e.getMessage());
		}

		try {
			// establish a connection with the database and creates a Connection
			// object (con)
			con = DriverManager.getConnection("jdbc:mysql://195.251.249.131:3306/" + dbname, dbusername, dbpassword);
		} catch (Exception e) {
			con = null;
			// throw SQLException if a database access error occurs
			throw new SQLException("Could not establish connection with the Database Server: " + e.getMessage());
		}

	} // End of open

	public void close() throws SQLException {
		try {
			// if connection is open
			if (con != null)
				con.close(); // close the connection to the database to end
								// database session

		} catch (Exception e) {

			throw new SQLException("Could not close connection with the Database Server: " + e.getMessage());
		}

	}// end of close

}

