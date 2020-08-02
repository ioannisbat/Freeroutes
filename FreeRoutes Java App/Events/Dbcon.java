package Events;

import java.sql.*;

/**
 * @author Freeroutes *
 */


public class Dbcon {

	private final String dBN = "ismgroup3";
	private final String dBU = "ismgroup3";
	private final String dBP = "5y6cva";
	private Connection con = null;
	private String errorMessages = null;

	//Constructor
	public Dbcon () {

	}

	public Connection getConnection () {

		return this.con;
	}

	public void open()throws SQLException {

		try {

			Class.forName("com.mysql.jdbc.Driver").newInstance();

		} catch (Exception e) {

			errorMessages = "MySQL Driver error: <br>" + e.getMessage();
		    throw new SQLException(errorMessages);
		}

		try {

			con = DriverManager.getConnection(
				  "jdbc:mysql://195.251.249.131:3306/"+ dBN, dBU, dBP);


		} catch (Exception e1) {

			 errorMessages = "Could not establish connection with the Database Server: <br>"
				          + e1.getMessage();
			con = null;
			throw new SQLException(errorMessages);
    	 }
	}//end of open method

	public void close() throws SQLException {

			try {

				if (con != null) {

	        		con.close();
				}

			} catch (Exception e3) {

			      errorMessages = "Could not close connection with the Database Server: <br>"
			          + e3.getMessage();
			      throw new SQLException(errorMessages);
	    	}


	}//end of open method

}//end of class