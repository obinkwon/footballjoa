package dao;

import java.util.List;

import model.Member;
import model.Recruit;
import model.Reserve;
import model.Team;

public interface IMainDao {
	//insert
	public void insertMember(Member member);
	public void insertTeam(Team team);
	public void insertRecruit(Recruit recruit);
	public void insertReserve(Reserve reserve);
	//select
	public Member selectOneMember(String id);
	public Member selectByPhone(int phone);
	public Recruit selectOneRecruit(int eid);
	public List<Reserve> selectReserveBoard();
	public List<Reserve> selectMatchingBoard();
	public Team selectOneTeamByTeamname(String teamname);
	public Team selectOneTeamByStatusId(String status_id);
	public String selectOneLeaderByTeamname(String teamname);
	public List<Recruit> selectAllRecruitBoard();
	public Recruit selectOneRecruitByTeamName(String teamname);
	public Reserve selectOneReserve(int rid);
	public String selectOneUseTimeByUseTime(String usetime);
	//delete
	public void deleteRecruit(int eid);
	public void deleteTeam(String teamname);
	public void deleteMember(String id);
	//update
	public void updateMemberSetTeamName(Member member);
	public void updateTeam(Team team);
	public void updateRecruitReadcountUp(int eid);
	public void updateReserveReadcountUp(int rid);
	public void updateRecruit(Recruit recruit);
	public void updateTeamcountPlus(String teamname);
	public void updateTeamcountMinus(String teamname);
	public void updateTeamName(String id);
	public void updateMember(Member member);
	
	
	
	
	public void updateRenewPw(String pw, String id);
	public String checkPasswordById(String id);
	public String moveRegistFormByTeam(String id);
	public void insertReserveRegistForm(Reserve reserve);
	public void updateReserveUpdateFrom(Reserve reserve);
	public void deleteReserveRegistFrom(int rid);
	public String MatchconditionCompareTeamname(String session_id);
	public String MatchconditionFirst(String session_id);
	public String MatchconditionSecond(int rid);
	public void updateWaitingAcceptCondition(String session_id, int rid);
	public Team selectTeambyAway(String get_away);
	public String checkTeamBySessionId(String session_id);
	public void updateAcceptMatchingisOk(int rid);
	public void updateRejecttMatchingisOk(int rid);
	public List<Reserve> viewReserveTableByStadium(String input_text);
	public List<Reserve> viewReserveTableByTeamname(String input_text);
	public String checkExistTeamInfo(String session_id);
	public void updateRecruitcountMinus(int req_eid);
	public String selectTeam_update_delete_Condition(int req_eid);
	public void updateLeaveTeam_Condition_Second(String session_id);
	public String ChangeUsetimetoDate(String usetime);
	public Team selectDetailRecruitForm_TeamTable(int req_eid);
	public String ChangeUsetimetoAMPM(String usetime);
	public String ChangeinputDatatoUsetime(String date , String time);
	public int determineFee(String time);
	
}
