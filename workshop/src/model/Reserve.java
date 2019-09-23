package model;

import java.sql.Date;

public class Reserve {
	private int rid;
	private String title;
	private String teamname;
	private String stadium;
	private String levels;
	private String usetime;
	private int fee;
	private Date writedate ;
	private int readcount;
	private String away;
	private String accept;
	
	
	public Reserve() {};
	public Reserve(int rid, String title, String teamname, String stadium, String levels, String usetime, int fee,
			Date writedate, int readcount, String away, String accept) {
		this.rid = rid;
		this.title = title;
		this.teamname = teamname;
		this.stadium = stadium;
		this.levels = levels;
		this.usetime = usetime;
		this.fee = fee;
		this.writedate = writedate;
		this.readcount = readcount;
		this.away = away;
		this.accept = accept;
	}
	
	
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTeamname() {
		return teamname;
	}
	public void setTeamname(String teamname) {
		this.teamname = teamname;
	}
	public String getStadium() {
		return stadium;
	}
	public void setStadium(String stadium) {
		this.stadium = stadium;
	}
	public String getLevels() {
		return levels;
	}
	public void setLevels(String levels) {
		this.levels = levels;
	}
	public String getUsetime() {
		return usetime;
	}
	public void setUsetime(String usetime) {
		this.usetime = usetime;
	}
	public int getFee() {
		return fee;
	}
	public void setFee(int fee) {
		this.fee = fee;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getAway() {
		return away;
	}
	public void setAway(String away) {
		this.away = away;
	}
	public String getAccept() {
		return accept;
	}
	public void setAccept(String accept) {
		this.accept = accept;
	}
	@Override
	public String toString() {
		return "Reserve [rid=" + rid + ", title=" + title + ", teamname=" + teamname + ", stadium=" + stadium
				+ ", levels=" + levels + ", usetime=" + usetime + ", fee=" + fee + ", writedate=" + writedate
				+ ", readcount=" + readcount + ", away=" + away + ", accept=" + accept + "]";
	}
	
	
}
