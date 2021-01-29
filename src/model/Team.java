package model;

public class Team {
	private String teamname;
	private String teamloc;
	private int teamcount;
	private String teamoutlook;
	private String status_id;
	
	public Team() {
		
	}

	public Team(String teamname, String teamloc, int teamcount, String teamoutlook, String status_id) {
		super();
		this.teamname = teamname;
		this.teamloc = teamloc;
		this.teamcount = teamcount;
		this.teamoutlook = teamoutlook;
		this.status_id = status_id;
	}

	public String getTeamname() {
		return teamname;
	}

	public void setTeamname(String teamname) {
		this.teamname = teamname;
	}

	public String getTeamloc() {
		return teamloc;
	}

	public void setTeamloc(String teamloc) {
		this.teamloc = teamloc;
	}

	public int getTeamcount() {
		return teamcount;
	}

	public void setTeamcount(int teamcount) {
		this.teamcount = teamcount;
	}

	public String getTeamoutlook() {
		return teamoutlook;
	}

	public void setTeamoutlook(String teamoutlook) {
		this.teamoutlook = teamoutlook;
	}

	public String getStatus_id() {
		return status_id;
	}

	public void setStatus_id(String status_id) {
		this.status_id = status_id;
	}

	@Override
	public String toString() {
		return "Team [teamname=" + teamname + ", teamloc=" + teamloc + ", teamcount=" + teamcount + ", teamoutlook="
				+ teamoutlook + ", status_id=" + status_id + "]";
	}
		
}
