package cn.ujavance.votingonline.entity;

/**
 * @author Administrator
 *
 */
public class User {
	
	private String username;
	private String password;
	private String check;
	
	public User() {
	}
	public User(String username, String password, String check) {
		super();
		this.username = username;
		this.password = password;
		this.check = check;
	}
	public String getCheck() {
		return check;
	}
	public void setCheck(String check) {
		this.check = check;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "User [username=" + username + ", password=" + password + ", check=" + check + "]";
	}

}
