package Coupon;


/**
 *
 * @author Freeroutes
 */



public class Coupon {

	private String couponCode;
	private String name;
	private String nameAdv;
	private String photo;
	private int couponLevel;

	public Coupon(String couponCode, String name, String nameAdv, String photo, int couponLevel) {
		this.couponCode = couponCode;
		this.name = name;
		this.nameAdv = nameAdv;
		this.photo = photo;
		this.couponLevel = couponLevel;
	}

	public Coupon() {

	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCouponCode() {
		return this.couponCode;
	}

	public void setCouponCode(String couponCode) {
		this.couponCode = couponCode;
	}

	public String getNameAdv() {
		return this.nameAdv;
	}

	public void setNameAdv(String nameAdv) {
		this.nameAdv = nameAdv;
	}

	public String getPhoto() {
		return this.photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public int getCouponLevel() {
		return this.couponLevel;
	}

	public void setCouponLevel(int couponLevel) {
		this.couponLevel = couponLevel;
	}


}