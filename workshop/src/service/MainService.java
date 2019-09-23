package service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.IMainDao;
import model.Member;
import model.Recruit;
import model.Reserve;
import model.Team;

@Service
public class MainService {
	@Autowired
	private IMainDao dao;
	
	public Member selectById(String id) {
		return dao.selectOneMember(id);
	}
	
	public String selectFindId(String name,int phone) {
		Member member = dao.selectByPhone(phone);
		if(member != null) {
			if(member.getName().equals(name)) return member.getId();
			else return null;
		}else return null; 
	}
	
	public String selectFindPw(String id, String name, int phone) {
		Member member = dao.selectOneMember(id);
		if(member != null) {
			if(member.getName().equals(name) && member.getPhone() == phone)
				return member.getPw();
			else return null;
		}else return null;
	}
	
	public HashMap<String, Object> registCheck(String id, int phone) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", dao.selectOneMember(id));
		map.put("phone", dao.selectByPhone(phone));
		return map;
	}
	
	public void registMember(Member member) {//회원등록
		dao.insertMember(member);
	}
	
	public String fileUpload(MultipartFile file) {
		String path="D:/image/";//파일 경로
		File dir = new File(path);
		if(!dir.exists()) dir.mkdirs();//경로에 파일이 없으면 만든다
		String fileName = file.getOriginalFilename();//파일명
		File attachFile = new File(path+fileName);//경로 + 파일명
		try {
			file.transferTo(attachFile);//그 경로에 파일을 저장한다
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return fileName;
	}
	
	public File getAttachedFile(String path) {
		String fileName = path;
		String prepath="D:/image/";
		return new File(prepath + fileName);
	}
	
	public List<Reserve> getReserveList() {//예약 리스트 가져오기
		return dao.selectReserveBoard();
	}
	
	public List<Reserve> getMatchingList() {//매칭 리스트 가져오기
		return dao.selectMatchingBoard();
	}
	
	public HashMap<String, Object> checkTeamInfo(String session_id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Member member = dao.selectOneMember(session_id);
		Team t = dao.selectOneTeamByStatusId(session_id);
		
		if(t != null) map.put("flag", t.getStatus_id());
		else map.put("flag", null);
		
		map.put("exist", member.getTeamname());//팀이 있을때 팀이름을 가져온다
		if(member.getTeamname() != null)
			map.put("t", dao.selectOneTeamByTeamname(member.getTeamname()));
		else map.put("t", null);
		return map;
	}
	
	public List<Recruit> getRecruitList() {
		List<Recruit> recruitList = dao.selectAllRecruitBoard();
		for(Recruit e : recruitList) {
			if(e.getCount()==0) dao.deleteRecruit(e.getEid());
		}
		return dao.selectAllRecruitBoard();
	}
	
	public HashMap<String, Object> teamRegistCheck(String teamname, String teamloc, String teamoutlook, String session_id) {
		Member member = new Member();
		member.setTeamname(teamname);
		member.setId(session_id);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("team", dao.selectOneTeamByTeamname(teamname));
		if(map.get("team")==null) {
			dao.insertTeam(new Team(teamname, teamloc,1,teamoutlook,session_id));
			dao.updateMemberSetTeamName(member);
		}
		return map;
	}
	
	public HashMap<String, Object> teamRecruitCheck(String session_id) {
		//사용자의 팀이름을 구함
		HashMap<String, Object> map = new HashMap<String, Object>();
		Team team = dao.selectOneTeamByStatusId(session_id);
		map.put("team", team);
		map.put("recruit", dao.selectOneRecruitByTeamName(team.getTeamname()));
		return map;
	}
	
	public void insertRecruit(String teamname, String teamtitle, int teamcount) {
		Recruit recruit = new Recruit();
		recruit.setTeamname(teamname);
		recruit.setTitle(teamtitle);
		recruit.setCount(teamcount);
		dao.insertRecruit(recruit);
	}
	
	public Team teamUpdateCheck(String status_id, String session_id) {//팀정보 수정시 팀장 여부 체크
		Team team = dao.selectOneTeamByStatusId(session_id);
		if(status_id.equals(team.getStatus_id())) return team; //팀장인 경우
		else return null;
	}
	
	public void teamDelete(String teamname) {
		dao.deleteTeam(teamname);
	}
	
	public void teamUpdate(String teamname, String teamoutlook, String teamloc) {
		Team team = new Team();
		team.setTeamname(teamname);
		team.setTeamloc(teamloc);
		team.setTeamoutlook(teamoutlook);
		dao.updateTeam(team);
	}
	
	public HashMap<String, Object> teamRecruitInfo(int eid){
		HashMap<String, Object> map = new HashMap<String, Object>();
		Recruit recruit = dao.selectOneRecruit(eid);
		Team team = dao.selectOneTeamByTeamname(recruit.getTeamname());
		dao.updateRecruitReadcountUp(eid);
		map.put("e", recruit);
		map.put("t", team);
		return map;
	}
	
	public String teamRecruitDelete(String session_id, int eid) {
		Recruit recruit = dao.selectOneRecruit(eid);
		Team team = dao.selectOneTeamByTeamname(recruit.getTeamname());
		if(session_id.equals(team.getStatus_id())) dao.deleteRecruit(eid);
		return team.getStatus_id();
	}
	
	public String teamRecruitUpdate(int eid) {
		Recruit recruit = dao.selectOneRecruit(eid);
		Team team = dao.selectOneTeamByTeamname(recruit.getTeamname());
		return team.getStatus_id();
	}
	
	public Team teamJoin(String session_id, int eid, String teamname) {
		Team team = dao.selectOneTeamByStatusId(session_id);
		Member member = new Member();
		member.setId(session_id);
		member.setTeamname(teamname);
		if(team == null) {
			dao.updateMemberSetTeamName(member);
			dao.updateRecruitcountMinus(eid);
			dao.updateTeamcountPlus(teamname);
		}
		return team;
	}
	
	public void updateRecruitFrom(int eid, String title, int count) {
		Recruit recruit = new Recruit();
		recruit.setEid(eid);
		recruit.setTitle(title);
		recruit.setCount(count);
		dao.updateRecruit(recruit);
	}
	
	public void teamLeave(String teamname, String session_id) {
		dao.updateTeamcountMinus(teamname);
		dao.updateTeamName(session_id);
	}
	
	public HashMap<String, Object> teamMatchSelectForm(int rid) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Reserve reserve = dao.selectOneReserve(rid);
		Team team = dao.selectOneTeamByTeamname(reserve.getTeamname());
		map.put("t", team);
		map.put("r", reserve);
		return map;
	}
	
	public String teamLeaderCheck(String teamname) {
		return dao.selectOneLeaderByTeamname(teamname);
	}
	
	public String duplicateDate(String usetime) {
		return dao.selectOneUseTimeByUseTime(usetime);
	}
	
	public void reserveInsert(Reserve reserve) {
		dao.insertReserve(reserve);
	}
	public HashMap<String, Object> reserveInfo(int rid) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		Reserve r = dao.selectOneReserve(rid);
		Team t = dao.selectOneTeamByTeamname(r.getTeamname());
		dao.updateReserveReadcountUp(r.getRid());
		
		String time = r.getUsetime();
		String usetime = ChangeUsetimetoDate(time) + " " + ChangeUsetimetoAMPM(time);
		param.put("Reserve", r);
		param.put("Team", t);
		param.put("usetime", usetime);
		return param;
	}
	public void memberInfoDelete(String id) {
		Team t = dao.selectOneTeamByStatusId(id);
		if(t != null) {
			dao.updateTeamcountMinus(t.getTeamname());
		}
		dao.deleteMember(id);
	}
	public void memberUpdate(Member member) {
		dao.updateMember(member);
	}
	public Team getTeamInfo(String id) {
		return dao.selectOneTeamByStatusId(id);
	}
	public String matchCheck(int rid) {
		return dao.matchConditionCheck(rid);
	}
	public void matchAccept(String away_teamname, int rid) {
		Reserve r = new Reserve();
		r.setAway(away_teamname);
		r.setRid(rid);
		dao.updateAcceptCondition(r);
	}
	public void deleteReserve(int rid) {
		dao.deleteReserve(rid);
	}
	
	
	
	//이용시간 폼 바꾸기
	public String ChangeUsetimetoDate(String usetime) {
		String[] splittime = usetime.split("/");
		String date= splittime[0];
		String changetime="";
		
		String YYYY="";
		String MM="";
		String DD="";
		
		for(int i=0 ; i<date.length();i++) {
			if(i<4) {
				YYYY += date.charAt(i);
			}
			if(i>=4 && i<6) {
				MM += date.charAt(i);
			}
			if(i>=6 && i<date.length()) {
				DD += date.charAt(i);
			}
		}
		changetime = YYYY+"-"+MM+"-"+DD;
		return changetime;
	}
	public String ChangeUsetimetoAMPM(String usetime) {
		String[] splittime = usetime.split("/");
		String date= splittime[1];
		
		return date;
	}
	
}
