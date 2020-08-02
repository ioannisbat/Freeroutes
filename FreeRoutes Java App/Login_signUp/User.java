package Login_signUp;


/**
 *
 * @author Freeroutes
 *
 */

public class User{

	private String email;
	private String password;
	private String username;
	private String startDate;
	public User(String username, String password, String email, String startDate ) throws Exception{
		this.email=email;
		this.password=password;
		this.username=username;
		this.startDate = startDate ;
	}
	public String getEmail(){
		return this.email;
	}
	public String getPassword(){
		return this.password;
	}
	public String getStartDate(){
		return this.startDate;
	}
	public String getUsername(){
		return this.username;
	}
	public void setEmail(String email){
		this.email=email;
	}
	public void setPassword(String password, String password2) throws Exception{
		this.password=password;
	}

}