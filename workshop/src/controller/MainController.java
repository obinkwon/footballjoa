package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import model.Member;
import model.Recruit;
import model.Reserve;
import model.Team;
import service.MainService;

@Controller
public class MainController {

	@Autowired
	private MainService service;
	
	@RequestMapping("loginForm.do")
	public String loginForm() {
		return "loginMain";
	}
	
	@RequestMapping("login.do")
	public void login(String id, String pw,HttpServletResponse resp, HttpSession session) throws IOException {
		Member member = service.selectById(id);
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter p = resp.getWriter();
		String str="";
		if(member != null) {
			if(id.equals(member.getId()) && pw.equals(member.getPw())){
				//db의 아이디 패스워드 정보가 일치할때
				session.setAttribute("session_id", id);
				str = "<script language='javascript'>"; 
				str += "alert('로그인 되었습니다');";  
				str += "location.href='main.do'";
				str += "</script>";
			}else{
				str = "<script language='javascript'>"; 
				str += "alert('아이디 또는 비밀번호가 일치하지 않습니다');";
				str += "history.go(-1);";    
				str += "</script>";
			}	
		}else {
			str = "<script language='javascript'>"; 
			str += "alert('아이디 또는 비밀번호가 일치하지 않습니다');";
			str += "history.go(-1);";    
			str += "</script>";
		}
		p.print(str);	
	}
	
	@RequestMapping("main.do")
	public void main() {}
	
	@RequestMapping("logout.do")
	public void logout(HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter p = resp.getWriter();
		 String str="";
		   str = "<script language='javascript'>"; 
		   str += "alert('로그아웃이 정상적으로 되었습니다');";   //얼럿창 띄우기
		   str += "location.href = 'loginForm.do'";   
		   str += "</script>";
		 p.print(str);
	}
	
	@RequestMapping("memberRegistForm.do")
	public ModelAndView memberRegistForm(@RequestParam(defaultValue ="user.png") String path) {
		ModelAndView mav = new ModelAndView();
		if(path != null) mav.addObject("path",path);
		mav.setViewName("register");
		return mav;
	}
	
	@RequestMapping("findForm.do")
	public void findForm(HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter p = resp.getWriter();
		   String str="";
		   str = "<script language='javascript'>"; 
		   str += "alert('아이디/비밀번호 창으로 이동합니다');";
		   str += "location.href='find.do';"; 
		   str += "</script>";
		  p.print(str);	
	}
	
	@RequestMapping("find.do")
	public void find() {}
	
	@RequestMapping("findId.do")
	public ModelAndView findId(String name,String phone,HttpServletResponse resp) throws IOException {
		ModelAndView mav = new ModelAndView();
		int input_phone = Integer.parseInt(phone);
		String getId = service.selectFindId(name, input_phone);
		if(getId != null) {
			String msg="회원님의 ID는 "+ getId + "입니다";
			mav.addObject("check",msg);
			mav.setViewName("checkSuccess");
			return mav;
		}else {
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter p = resp.getWriter();
			String str="";
			str = "<script language='javascript'>"; 
			str += "alert('회원정보가 일치하지 않습니다');";
			str += "window.close();";
			str += "location.href='find.do'";
			str += "</script>";
			p.print(str);
			return null;
		}
	}
	
	@RequestMapping("findPw.do")
	public ModelAndView findPw(String id, String name, String phone, HttpServletResponse resp) throws IOException {
		ModelAndView mav = new ModelAndView();
		int input_phone = Integer.parseInt(phone);
		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter p = resp.getWriter();
		String str="";
		
		String getPw = service.selectFindPw(id, name, input_phone);
		if(getPw != null) {
			String msg="회원님의 비밀번호는 "+ getPw + "입니다";
			mav.addObject("check",msg);
			mav.setViewName("checkSuccess");
			return mav;
		}
		else {
			str = "<script language='javascript'>"; 
			str += "alert('회원정보가 존재하지 않습니다');";
			str += "window.close();";
			str += "</script>";
			p.print(str);
			return null;
		}
	}
	
	@RequestMapping("memberRegist.do")
	public void memberRegist(Member member,HttpServletResponse resp) throws IOException {
		//아이디 중복체크
		HashMap<String, Object> map = service.registCheck(member.getId(), member.getPhone());
		System.out.println(map);
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter p = resp.getWriter();
		String str="";
		
		if(map.get("id")==null) { //아이디가 없을때
			if(map.get("phone")==null) {//전화번호가 중복안될때
				service.registMember(member);
				str = "<script language='javascript'>"; 
				str += "alert('성공적으로 회원가입 완료하였습니다.');";
				str += "location.href='loginForm.do';"; 
				str += "</script>";
			}
			else {//전화번호가 중복될때
				str = "<script language='javascript'>"; 
				str += "alert('중복되는 전화번호가 있습니다');";
				str += "history.go(-1);";
				str += "</script>";
			}
		}
		else { //아이디가 잇을때
			str = "<script language='javascript'>"; 
			str += "alert('중복되는 아이디가 있습니다');";
			str += "history.go(-1);";    //
			str += "</script>";
		}	
		p.print(str);
	}
	
	@RequestMapping("fileUpload.do")
	public void fileUpload() {}
	
	@RequestMapping("imgup.do")
	public ModelAndView imgUp(@RequestParam("ufile")MultipartFile file) {
		ModelAndView mav = new ModelAndView();
		String fileName = service.fileUpload(file);
		mav.addObject("fileName",fileName);
		mav.setViewName("imgup");
		return mav;
	}
	
	@RequestMapping("upload.do")
	public View upload(String path) {
		File attachFile = service.getAttachedFile(path);
		View view = new DownloadView(attachFile);//스프링 관련 view로 임폴트
		return view;
	}
	
	@RequestMapping("memberInfoForm.do")
	public ModelAndView memberInfoForm(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Member member = service.selectById((String)session.getAttribute("session_id"));
		if(member.getTeamname() == null) member.setTeamname("없음");
		mav.addObject("m",member);
		mav.setViewName("memberInfo");
		return mav;
	}
	
	@RequestMapping("reserveForm.do")
	public ModelAndView reserveForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("reserveBoardList",service.getReserveList());
		mav.addObject("matchBoardList",service.getMatchingList());
		mav.setViewName("board");
		return mav;
	}
	
	@RequestMapping("teamMatchForm.do")
	public ModelAndView teamMatchForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("reserveBoardList",service.getReserveList());
		mav.setViewName("teamMatch");
		return mav;
	}
	
	@RequestMapping("teamInfoForm.do")
	public String teamInfoForm() {
		return "teamInfo";
	}
	
	@RequestMapping("teamInfoSelectForm.do")
	public ModelAndView teamInfoSelectForm(HttpServletResponse resp,HttpSession session) throws IOException {
		ModelAndView mav = new ModelAndView();
		
		String session_id = (String)session.getAttribute("session_id");
		HashMap<String, Object> map = service.checkTeamInfo(session_id);
		String flag = (String)map.get("flag");//status_id
		
		//팀이 있을때와 없을때 
		if(map.get("exist") != null) {
			Team t = (Team)map.get("t"); //내 팀에 대한 정보
			mav.addObject("flag",flag);
			mav.addObject("t",t);
			mav.setViewName("teamInfoSelect");
			return mav;
		}else {
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter p = resp.getWriter();
			String str="";
			str = "<script language='javascript'>"; 
			str += "alert('소속 된 팀이 없습니다 ');"; 
			str += "history.go(-1);";
			str += "</script>";
			p.print(str);
			return null;
		}
	}
	
	@RequestMapping("teamRegistForm.do")
	public String teamRegistForm(HttpSession session,HttpServletResponse resp) throws IOException {
		String id = (String) session.getAttribute("session_id");
		HashMap<String, Object> map = service.checkTeamInfo(id);
		//팀이 없을때
		if(map.get("exist") == null) {
			return "teamRegist";
		}
		//팀이 있을때
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter p = resp.getWriter();
		String str="";
		str = "<script language='javascript'>"; 
		str += "alert('이미 팀이 있습니다');"; 
		str += "history.go(-1);";
		str += "</script>";
		p.print(str);	
		return null;
	}
	
	@RequestMapping("teamRecruitBoardForm.do")
	public ModelAndView teamRecruitBoardForm(HttpSession session,HttpServletResponse resp) throws IOException {
		ModelAndView mav = new ModelAndView();
		mav.addObject("recruitList", service.getRecruitList());
		mav.setViewName("teamRecruitBoard");
		return mav;
	}
	
	@RequestMapping("teamRegist.do")
	public void teamRegist(String teamname, String teamloc, String teamoutlook, HttpSession session,HttpServletResponse resp) throws IOException {
		String session_id = (String)session.getAttribute("session_id");
		HashMap<String, Object> map = service.teamRegistCheck(teamname, teamloc, teamoutlook, session_id);
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter p = resp.getWriter();
		String str="";
		
		if(map.get("team")==null) {
			str = "<script language='javascript'>"; 
		   str += "alert('등록 되었습니다.');";
		   str += "location.href='teamInfoForm.do';";
		   str += "</script>";
		   p.print(str);	
		}
		else {
			str = "<script language='javascript'>"; 
			str += "alert('동일한 이름의 팀이 있습니다');";
			str += "history.go(-1);";
			str += "</script>";
			p.print(str);	
		}
	}
	
	@RequestMapping("teamRecruitForm.do")
	public ModelAndView teamRecruitForm(HttpSession session,HttpServletResponse resp) throws IOException {
		ModelAndView mav = new ModelAndView();
		String session_id = (String)session.getAttribute("session_id");
		HashMap<String, Object> map = service.teamRecruitCheck(session_id);
		
		if(map.get("recruit")==null) {
			//팀모집을 하지 않은 경우
			Team team = (Team)map.get("team");
			mav.addObject("teamname",team.getTeamname());
			mav.setViewName("teamRecruit");
			return mav;
		}
		else {
			//이미 팀모집을 한 경우
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter p = resp.getWriter();
			String str="";
			str = "<script language='javascript'>"; 
			str += "alert('이미 팀원 모집을 하였습니다');";
			str += "window.close();";
			str += "</script>";
			p.print(str);
			return null;
		}
	}
	
	@RequestMapping("teamRecruit.do")
	public String teamRecruit(String teamname, String teamtitle, String teamcount){
		service.insertRecruit(teamname, teamtitle, Integer.parseInt(teamcount));
		return "redirect:teamRecruitBoardForm.do";
	}
	
	@RequestMapping("teamInfoUpdateForm.do")
	public ModelAndView teamInfoUpdateForm(String status_id, HttpSession session,HttpServletResponse resp) throws IOException {
		ModelAndView mav = new ModelAndView();
		String session_id = (String)session.getAttribute("session_id");
		
		Team team = service.teamUpdateCheck(status_id, session_id);
		//팀의 팀장인지 아닌지 구함
		if(team != null) {//팀장인 경우
			mav.addObject("t",team);
			mav.addObject("teamname",team.getTeamname());
			mav.setViewName("teamInfoUpdate");
			return mav;
		}
		else {//팀장이 아닌경우
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter p = resp.getWriter();
			String str="";
			str = "<script language='javascript'>"; 
			str += "alert('오직 팀장만이 수정가능합니다');"; 
			str += "history.go(-1);";
			str += "</script>";
			p.print(str);	
			return null;
		}
	}
	
	@RequestMapping("teamInfoUpdate.do")
	public String teamInfoUpdate(String teamname, String teamoutlook, String teamloc) {
		service.teamUpdate(teamname, teamoutlook, teamloc);
		return "redirect:teamInfoForm.do";
	}
	
	@RequestMapping("teamInfoDelete.do")
	public void teamInfoDelete(String teamname,HttpServletResponse resp) throws IOException {
		service.teamDelete(teamname);
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter p = resp.getWriter();
		String str="";
		str = "<script language='javascript'>"; 
		str += "alert('팀을 해체 하였습니다');"; 
		str += "location.href='teamInfoForm.do'"; 
		str += "</script>";
		p.print(str);	
	}
	
	@RequestMapping("teamRecruitInfo.do")
	public ModelAndView teamRecruitInfo(int eid) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = service.teamRecruitInfo(eid);
		mav.addObject("e", (Recruit)map.get("e"));
		mav.addObject("t", (Team)map.get("t"));
		mav.setViewName("teamRecruitInfo");
		return mav;
	}
	
	@RequestMapping("teamRecruitDelete.do")
	public void teamRecruitDelete(HttpSession session, HttpServletResponse resp, int eid) throws IOException {
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter p = resp.getWriter();
		String str="";
		String session_id = (String)session.getAttribute("session_id");
		str = "<script language='javascript'>"; 
		if(session_id.equals(service.teamRecruitDelete(session_id, eid))) {//팀장일 때  
			str += "alert('게시글이 삭제 되었습니다');";  
			str += "location.href='teamRecruitBoardForm.do'";
		}
		else {//팀장이 아닐 때  
			str += "alert('당신은 팀장이 아닙니다');";
			str += "history.go(-1);";
		}
		str += "</script>";
		p.print(str);	
	}
	
	@RequestMapping("teamRecruitUpdateForm.do")
	public ModelAndView teamRecruitUpdateForm(HttpSession session, HttpServletResponse resp, int eid) throws IOException {
		ModelAndView mav = new ModelAndView();
		String session_id = (String)session.getAttribute("session_id");
		HashMap<String, Object> map = service.teamRecruitInfo(eid);
		//팀장일 때  or 팀장이 아닐때
		if(session_id.equals(service.teamRecruitUpdate(eid))) {
			mav.addObject("e", (Recruit)map.get("e"));
			mav.addObject("t", (Team)map.get("t"));
			mav.addObject("eid", eid);
			mav.setViewName("teamRecruitUpdate");
			return mav;
		}else {
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter p = resp.getWriter();
			String str="";
			str = "<script language='javascript'>"; 
			str += "alert('당신은 팀장이 아닙니다');"; 
			str += "history.go(-1);";   
			str += "</script>";
			p.print(str);	
			return null;
		}	
	}
	
	@RequestMapping("teamJoin.do")
	public void teamJoin(HttpSession session, HttpServletResponse resp, int eid,String teamname) throws IOException {
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter p = resp.getWriter();
		String str="";
		str = "<script language='javascript'>"; 
		String session_id = (String)session.getAttribute("session_id");
		if(service.teamJoin(session_id,eid,teamname)==null) {//팀이 없을때
			str += "alert('해당팀에 입단 하셨습니다');";   
			str += "location.href='teamInfoForm.do'";
		}else {//이미 팀이 있을때
			str += "alert('이미 팀이 있습니다');"; 
			str += "history.go(-1);";    
		}
		str += "</script>";
		p.print(str);
	}
	
	@RequestMapping("teamRecruitUpdate.do")
	public String teamRecruitUpdate(Recruit recruit){
		//해당 정보 업데이트
		service.updateRecruitFrom(recruit);
	    return "redirect:teamRecruitBoardForm.do";
	}
	
	@RequestMapping("teamLeave.do")
	public void teamLeave(HttpSession session, HttpServletResponse resp, String teamname) throws IOException{
		String session_id = (String)session.getAttribute("session_id");
		service.teamLeave(teamname,session_id);
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter p = resp.getWriter();
		String str="";
		str = "<script language='javascript'>"; 
		str += "alert('팀을 떠났습니다.');"; 
		str += "location.href='teamInfoForm.do'";  
		str += "</script>";
		p.print(str);	
	}
	
	@RequestMapping("teamMatchSelectForm.do")
	public ModelAndView teamMatchSelectForm(int rid) throws IOException{
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = service.teamMatchSelectForm(rid);
		mav.addObject("Reserve", (Reserve)map.get("r"));
		mav.addObject("Team", (Team)map.get("t"));
		mav.setViewName("teamMatchSelect");
		return mav;
	}
	
	@RequestMapping("teamMatchSelect.do")
	public ModelAndView teamMatchSelect(int rid, HttpServletResponse resp,HttpSession session) throws IOException{
		String id = (String)session.getAttribute("session_id");
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter p = resp.getWriter();
		String str="";
		HashMap<String, Object> map = service.teamMatchSelectForm(rid);
		Reserve r = (Reserve)map.get("r");// 홈팀 게시글 정보
		
		//현재 접속자가 팀장이여야 하며, 매칭할 홈팀의 수락여부가 false일경우 
		if(service.getTeamInfo(id)!=null) { //팀장인 경우(팀이 없는 경우)
			String away_teamname = service.getTeamInfo(id).getTeamname(); // 접속한 사용자 팀이름
			if(!r.getTeamname().equals(away_teamname)){ //본인 팀과 매칭할 경우
				if(service.matchCheck(rid)==null) { //매칭수락상태가 false인 상대만
					service.matchAccept(away_teamname, rid);
					str = "<script language='javascript'>"; 
					str += "alert('매칭에 성공하였습니다 상대방 팀장이 수락시 성사됩니다 .');";
					str += "location.href='reserveForm.do'"; 
					str += "</script>";
					p.print(str);	
					return null;
				}
				else {
					str = "<script language='javascript'>"; 
					str += "alert('매칭 대기중입니다.');";
					str += "history.go(-1);";
					str += "</script>";
					p.print(str);	
					return null;
				}
			}else {
				str = "<script language='javascript'>"; 
				str += "alert('본인 팀과 매칭을 할 수 없습니다.');";
				str += "history.go(-1);"; 
				str += "</script>";
				p.print(str);	
				return null;
			}
		}else {//팀장이 아닌경우
			str = "<script language='javascript'>"; 
			str += "alert('당신은 팀장이 아닙니다');";
			str += "history.go(-1);";
			str += "</script>";
			p.print(str);	
			return null;
		}
	}
	
	@RequestMapping("reserveInsertForm.do")
	public ModelAndView reserveInsertForm(String id) throws IOException{
		ModelAndView mav = new ModelAndView();
		Team t = (Team)service.checkTeamInfo(id).get("t");
		if(t != null) {
			String teamname = t.getTeamname();
			if(service.teamLeaderCheck(teamname)!=null) {
				mav.addObject("teamname", teamname);
				mav.addObject("id", id);
				mav.setViewName("boardRegist");
			}
			else mav.setViewName("redirect:reserveForm.do");
		}
		else mav.setViewName("redirect:reserveForm.do");
		return mav;
	}
	
	@RequestMapping("reserveInsert.do")
	public ModelAndView reserveInsert(HttpServletResponse resp,Reserve r,String usetime,String time) throws IOException{
		ModelAndView mav = new ModelAndView();
		String splitdate ="";
		String[] str = usetime.split("-");
		for(String s : str) {
			splitdate += s;
		}
		usetime = splitdate+"/"+time;
		r.setUsetime(usetime);
		if(time.equals("오전")) r.setFee(2000);//오전 요금
		else r.setFee(3000);//오후 요금
		//날짜 중복
		if(service.duplicateDate(usetime)==null) { //중복이 안될때
			service.reserveInsert(r);
			mav.setViewName("redirect:reserveForm.do");
		}else {//중복될때
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter p = resp.getWriter();
			String str1 ="";
			str1 = "<script language='javascript'>"; 
			str1 += "alert('날짜가 중복됩니다');";
			str1 += "history.go(-1);";
			str1 += "</script>";
			p.print(str1);	
		}
		return mav;
	}
	
	@RequestMapping("reserveInfo.do")
	public ModelAndView reserveInfo(String rid) throws IOException{
		ModelAndView mav = new ModelAndView();
		int rid_num = Integer.parseInt(rid);
		mav.addAllObjects(service.reserveInfo(rid_num));
		mav.setViewName("boardInfo");
		return mav;
	}
	
	@RequestMapping("pwCheckForm.do")
	public ModelAndView pwCheckForm(HttpSession session) throws IOException{
		ModelAndView mav = new ModelAndView();
		String id = (String)session.getAttribute("session_id");
		mav.addObject("id", id);
		mav.setViewName("pwCheck");
		return mav;
	}
	
	@RequestMapping("pwCheck.do")
	public ModelAndView pwCheck(String id,String pw,HttpServletResponse resp) throws IOException{
		ModelAndView mav = new ModelAndView();
		String pw2=service.selectById(id).getPw();//id로 가져온 pw넣는 변수
		if(pw.equals(pw2)) {//입력한 비밀번호와 id로 뽑아온 비밀번호가 같은지 비교(같을때)
			mav.setViewName("checkPass");
			return mav;
		}else {//(같지 않을때)
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter p = resp.getWriter();
			String str="";
			str +="<script>";
			str +="alert('비밀번호가 틀립니다.');";
			str +="history.go(-1);";
			str +="</script>";
			p.print(str);
			return null;
		}
	}
	
	@RequestMapping("memberInfoUpdateForm.do")
	public ModelAndView memberInfoUpdateForm(HttpSession session,@RequestParam(defaultValue ="user.png") String path) throws IOException{
		ModelAndView mav = new ModelAndView();
		Member m = service.selectById((String)session.getAttribute("session_id"));
		if(m.getTeamname() == null) {//팀이 없을때
			m.setTeamname("없음");
		}
		if(m.getProfile()!=null) path = m.getProfile();
		mav.addObject("m", m);
		mav.addObject("path", path);
		mav.setViewName("memberUpdate");
		return mav;
	}
	
	@RequestMapping("memberInfoDelete.do")
	public String memberInfoDelete(HttpSession session,HttpServletResponse resp) throws IOException{
		String session_id = (String)session.getAttribute("session_id");
		service.memberInfoDelete(session_id);
		resp.setContentType("text/html; charset=UTF-8");
		session.removeAttribute("session_id");
		PrintWriter p = resp.getWriter();
		String str="";
		str = "<script language='javascript'>"; 
		str += "alert('회원탈퇴가 정상적으로  되었습니다');";
		str += "location.href = 'loginForm.do'";   
		str += "</script>";
		p.print(str);
		return null;
	}
	
	@RequestMapping("memberInfoUpdate.do")
	public String memberInfoUpdate(Member member,HttpServletResponse resp) throws IOException{
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter p = resp.getWriter();
		HashMap<String, Object> map = service.registCheck(member.getId(), member.getPhone());
		if(map.get("phone")==null) {//전화번호가 중복 안될때
			service.memberUpdate(member);
			String str="";
			str = "<script language='javascript'>"; 
			str += "alert('수정 되었습니다');";
			str += "location.href = 'memberInfoForm.do'";   
			str += "</script>";
			p.print(str);	
		}
		else {
			String str="";
			str = "<script language='javascript'>"; 
			str += "alert('해당 전화번호는 사용하실수 없습니다.');";
			str += "history.go(-1)";  
			str += "</script>";
			p.print(str);	
		}
		return null;
	}
	@RequestMapping("reserveDelete.do")
	public ModelAndView reserveDelete(int rid, String id) throws IOException{
		ModelAndView mav = new ModelAndView();
		//팀정보에 가져옴
		HashMap<String, Object> map = service.teamMatchSelectForm(rid);
		Team t = (Team)map.get("t");
		//rid로 가져온 상세정보의 팀 이름과 , 세션아이디와 비교한 팀 이름이 같을때 =글쓴이일때
		if(t.getStatus_id().equals(id)){
			service.deleteReserve(rid);
			mav.setViewName("redirect:reserveForm.do");
		}
		else {
			mav.addObject("rid",rid);
			mav.setViewName("redirect:reserveInfo.do");
		}
		return mav;
	}
	@RequestMapping("teamMatchAcceptForm.do")
	public ModelAndView teamMatchAcceptForm(int rid, HttpSession session,HttpServletResponse resp) throws IOException{
		ModelAndView mav = new ModelAndView();
		String id = (String)session.getAttribute("session_id");
		
		HashMap<String, Object> map = service.teamMatchSelectForm(rid);
		Reserve r = (Reserve)map.get("r");
		Team team = service.getTeamInfo(id);
		Team t = (Team)map.get("t");
		Team away = service.getTeamByTeamname(r.getAway());
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter p = resp.getWriter();
		String str="";
		
		//조건 (해당 팀의 팀장만 가능함 (session을 넣어 비교))
		if(team!=null) {
			if(team.getTeamname().equals(t.getTeamname())) {
				mav.addObject("r",r);
				mav.addObject("t", away);
				mav.setViewName("accept");
			}else {
				str = "<script language='javascript'>"; 
				str += "alert('수락할 권한이 없습니다');";
				str += "window.close();";
				str += "</script>";
				p.print(str);
				return null;
			}
		}else {
			str = "<script language='javascript'>"; 
			str += "alert('수락할 권한이 없습니다');";
			str += "window.close();";
			str += "</script>";
			p.print(str);
			return null; 
		}
		return mav;
	}
	@RequestMapping("teamMatchAccept.do")
	public ModelAndView teamMatchAccept(int rid) throws IOException{
		ModelAndView mav = new ModelAndView();
		service.acceptMatching(rid);
		mav.setViewName("redirect:reserveForm.do");
		return mav;
	}
	@RequestMapping("teamMatchReject.do")
	public ModelAndView teamMatchReject(int rid) throws IOException{
		ModelAndView mav = new ModelAndView();
		service.rejectMatching(rid);
		mav.setViewName("redirect:reserveForm.do");
		return mav;
	}
	@RequestMapping("teamMatchSearch.do")
	public ModelAndView teamMatchSearch(@RequestParam(defaultValue = " ")String search, @RequestParam(defaultValue = "all")String select) throws IOException{
		ModelAndView mav = new ModelAndView();
		List<Reserve> reserveBoardList = service.reserveSearch(select, search);
		mav.addObject("reserveBoardList", reserveBoardList);
		mav.setViewName("teamMatch");
		return mav;
	}
}
