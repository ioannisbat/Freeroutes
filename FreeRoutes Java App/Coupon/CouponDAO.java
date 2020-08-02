package Coupon;

/**
 *
 * @author Freeroutes
 */


 import java.sql.*;
 import SUser.*;
 import Events.*;
 import java.util.*;
 import Coupon.*;




 public class CouponDAO {

	 public CouponDAO() {

	 }


	 public Coupon authCoupon(int couponLevel) throws Exception {

	 		DB_User_Con db1 = new DB_User_Con();
	 		Connection con = null;

	 		try {

	 			db1.open();

	 			con = db1.getConnection();

	 			String query7 = "SELECT * FROM coupon WHERE couponLevel = ?; ";

	 			PreparedStatement stm1 = con.prepareStatement(query7);
	 			stm1.setInt(1, couponLevel);

	 			ResultSet rs = stm1.executeQuery();

	 			if (rs.next()) {

	 				String couponCode1 = rs.getString("couponCode");
	 				String name1 = rs.getString("name");
	 				String nameAdv1 = rs.getString("nameAdvetizer");
	 				String photo1 = rs.getString("photo");
	 				int couponLevel1 = rs.getInt("couponLevel");


	 				Coupon coupon = new Coupon(couponCode1, name1, nameAdv1, photo1, couponLevel1);
	 				rs.close();
	 				stm1.close();
	 				db1.close();
	 				return coupon;

	 			} else {

	 				rs.close();
	 				stm1.close();
	 				db1.close();
	 				throw new Exception("Δεν υπάρχει τέτοιο κουπόνι.");
	 			}

	 		} catch (Exception e) {
	 			throw new Exception(e.getMessage());

	 		} finally {

	 			if(con != null)
	 				con.close();
	 		}
	}



	/*
	 * This method has as a result 1 for redemption, 2 for progress bar, 3 for locked badge.
	 */

	 public int couponSituation(double points, double lowPointsLevel, double upPointsLevel) throws Exception {

	 		int situ = 0; // 1 == eksargurwsh  or 2 == progress bar or 3 == locked

			if (points < upPointsLevel && points >= lowPointsLevel) {

				situ = 2;

			} else if (points >= upPointsLevel) {

				situ = 1;


			} else if (points < lowPointsLevel && points < upPointsLevel) {

				situ = 3;

			}

		return situ;
	} //end of method


	/*
	 * This method has as a result the name of the situation of Badge: Locked, Redemption.
	 */

	public String nameSitu(int situ) {

		String nameSitu = "";

		if (situ == 1) {

			nameSitu = "Εξαργύρωση";

		} else if (situ == 3) {

			nameSitu = "Κλειδωμένο";

		}

	return nameSitu;
	}



} //end of class
