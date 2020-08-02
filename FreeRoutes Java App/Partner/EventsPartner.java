package Partner;


/**
 *
 * @author Freeroutes
 *
 */

 public class EventsPartner{

 	private String username;
 	private String eventCode;

 	public EventsPartner (String username, String eventCode){
		this.username = username;
		this.eventCode = eventCode;
	}
	public String getUsername(){
		return this.username;
	}
	public String getEventCode(){
		return this.eventCode;
	}
	public void setUsername(String username){
		this.username = username;
	}
	public void getEventCode(String eventCode){
		this.eventCode = eventCode;
	}
 }