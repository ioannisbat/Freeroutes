package Partner;

/**
 *
 * @author Freeroutes
 *
 */
 import Login_signUp.User;

public class Partner {
	private String partnersName;
	private String zip;
	private int number;
	private String street;
	private String municipality;
	private String contactName;
	private String contactSurname;
	private String contactPhone;
	private String typeEvent;
	private String description;
	private String facebook;
	private String photo;
	private String username;
	private Partner partner;
	private String email;

	public Partner (String partnersName, String zip, int number, String street, String municipality,
		String contactName,String contactSurname,String contactPhone,String typeEvent,String description,String facebook) {

		this.partnersName=partnersName;
		this.zip=zip;
		this.number=number;
		this.street=street;
		this.municipality=municipality;
		this.contactName=contactName;
		this.contactSurname=contactSurname;
		this.contactPhone=contactPhone;
		this.typeEvent=typeEvent;
		this.description=description;
		this.facebook=facebook;
	}
	public Partner (String partnersName, String zip, int number, String street, String municipality,
		String contactName,String contactSurname,String contactPhone,String typeEvent,String description,String facebook, String username, String photo) {

		this.partnersName=partnersName;
		this.zip=zip;
		this.number=number;
		this.street=street;
		this.municipality=municipality;
		this.contactName=contactName;
		this.contactSurname=contactSurname;
		this.contactPhone=contactPhone;
		this.typeEvent=typeEvent;
		this.description=description;
		this.facebook=facebook;
		this.username=username;
		this.photo=photo;
	}
	public Partner (String partnersName, String zip, int number, String street, String municipality,
		String contactName,String contactSurname,String contactPhone,String typeEvent,String description,String facebook, String username, String photo, String email) {

		this.partnersName=partnersName;
		this.zip=zip;
		this.number=number;
		this.street=street;
		this.municipality=municipality;
		this.contactName=contactName;
		this.contactSurname=contactSurname;
		this.contactPhone=contactPhone;
		this.typeEvent=typeEvent;
		this.description=description;
		this.facebook=facebook;
		this.username=username;
		this.photo=photo;
		this.email=email;
	}
	public String getPartnersName(){
		return this.partnersName;
	}
	public void setPartnersName(String partnersName) {
		this.partnersName=partnersName;
	}
	public String getZip(){
		return this.zip;
	}
	public void setZip(String zip) {
		this.zip=zip;
	}
	public int getNumber(){
		return this.number;
	}
	public void setNumber(int number) {
		this.number=number;
	}
	public String getStreet(){
		return this.street;
	}
	public void setStreet(String street) {
		this.street=street;
	}
	public String getMunicipality(){
		return this.municipality;
	}
	public void setMunicipality(String municipality) {
		this.municipality=municipality;
	}
	public String getContactName(){
		return this.contactName;
	}
	public void setContactName(String contactName) {
		this.contactName=contactName;
	}
	public String getContactSurname(){
		return this.contactSurname;
	}
	public void setContactSurname(String contactSurname) {
		this.contactSurname=contactSurname;
	}
	public String getContactPhone(){
		return this.contactPhone;
	}
	public void setContactPhone(String contactPhone) {
		this.contactPhone=contactPhone;
	}
	public String getTypeEvent(){
		return this.typeEvent;
	}
	public void setTypeEvent(String typeEvent) {
		this.typeEvent=typeEvent;
	}
	public String getDescription(){
		return this.description;
	}
	public void setDescription(String description) {
		this.description=description;
	}
	public String getFacebook(){
		return this.facebook;
	}
	public void setFacebook(String facebook) {
		this.facebook=facebook;
	}
	public String getUsername(){
		return this.username;
	}
	public void setUsername(String username) {
		this.username=username;
	}
	public String getPhoto(){
		return this.photo;
	}
	public void setPhoto(String photo) {
		this.photo=photo;
	}
	public String getEmail(){
		return this.email;
	}
	public void setEmail(String email) {
		this.email=email;
	}
}