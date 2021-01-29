package model;

import java.sql.Date;

public class Recruit {
	private int eid;
	private String teamname;
	private String title;
	private int count;
	private Date writedate ;
	private int readcount;
	
	public Recruit() {}
	
	public Recruit(int eid, String teamname, String title, int count, Date writedate, int readcount) {
		this.eid = eid;
		this.teamname = teamname;
		this.title = title;
		this.count = count;
		this.writedate = writedate;
		this.readcount = readcount;
	}

	public int getEid() {
		return eid;
	}
	public void setEid(int eid) {
		this.eid = eid;
	}
	public String getTeamname() {
		return teamname;
	}
	public void setTeamname(String teamname) {
		this.teamname = teamname;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
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
	@Override
	public String toString() {
		return "Recruit [eid=" + eid + ", teamname=" + teamname + ", title=" + title + ", count=" + count
				+ ", writedate=" + writedate + ", readcount=" + readcount + "]";
	}
	
	
	
	
	
}
