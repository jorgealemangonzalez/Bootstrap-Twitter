package models;

public class beanTweet {
	public beanTweet(){}
	
	private int tweet_id;
	private String tweet_text="";
	private String date="";
	private String username ="";
	private String prof_image ="";
	
	public int getTweet_id() {
		return tweet_id;
	}
	public void setTweet_id(int tweet_id) {
		this.tweet_id = tweet_id;
	}
	public String getTweet_text() {
		return tweet_text;
	}
	public void setTweet_text(String tweet_text) {
		this.tweet_text = tweet_text;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getProf_image() {
		return prof_image;
	}
	public void setProf_image(String prof_image) {
		this.prof_image = prof_image;
	}
}
