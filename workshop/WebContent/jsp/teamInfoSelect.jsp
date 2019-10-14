<%@page import="model.Team"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/board.js"></script>
<script type="text/javascript">
	function leave(){//팀 탈퇴
		var teamname = document.getElementById('teamname').value;
		var x = confirm("정말 팀에서 탈퇴 하시겠습니까?");
		if(x==true){
			location.href="teamLeave.do?teamname="+teamname;
			return true;
		}else return false;
	}
	function disint(){//팀 해체
		var teamname = document.getElementById('teamname').value;
		var x = confirm("정말 해체 하시겠습니까?");
		if(x==true) location.href="teamInfoDelete.do?teamname="+teamname;
	}
	function update(){//팀 수정
		alert("팀 정보 수정페이지로 이동합니다");
		location.href="teamInfoUpdateForm.do?status_id=${t.status_id}";
	}
	function regist(){//팀원 모집
		open_team("teamRecruitForm.do","recruit");
	}
	function prev(){//이전
		var url="teamInfoForm.do";
		location.href= url;
	}
</script>
<style type="text/css">
	div.main{
		text-align : center;
		margin : 20px 0px 0px 0px;
	}
	h2.title{
		text-align : left;
		margin-left : 250px;
		font-weight: bold;
		font-size : 25px;
	}
	.text{
		width : 250px;
		height : 30px;
		margin : 10px 0px 0px 10px;
		border-radius: 2px;
		border: 0px solid #d9d9d9;
		
	}
	textarea.text_pre{
		margin : 10px 0px 0px 10px;
		border-radius: 2px;
		border: 0px solid #d9d9d9;
		resize: none;
	}
	table.info{
		margin : auto;
	}
	td{
		text-align : left;
	}
	td.text_pre{
		padding-top : 30px;
		vertical-align: top;
	}
	td.right{
		padding-left : 43px;
	}
	tr.center{
		text-align : center;
	}
	input#left{
		margin-right : 150px;
	}
	img.info{
		width : 400px;
		height : 400px;
	}
</style>
</head>
<body>
<%String flag = (String)request.getAttribute("flag");
	Team t = (Team)request.getAttribute("t");
%>
<jsp:include page="header.jsp"/>
	<div class="main">
	<h2 class="title">우리팀 정보</h2>
	<hr>
	<form action="MainServlet" method="post">
		<table class="info">
			<tr>
				<td>팀 이름</td>
				<td><input type="text" name="teamname" class="text" value="<%= t.getTeamname() %>" readonly id="teamname"></td>
				<td rowspan="4"><img class="info" src="teamImg.png"></td>
			</tr>
			<tr>
				<td>팀 지역</td>
				<td><input type="text" name="teamloc" class="text" value="<%= t.getTeamloc() %>" readonly></td>
			</tr>
			<tr>
				<td>팀 회원수</td>
				<td><input type="text" name="teamcount" class="text" value="<%= t.getTeamcount() %>" readonly></td>
			</tr>
			<tr>
				<td class="text_pre">팀 소개</td>
				<td><textarea name="teamoutlook" class="text_pre" rows="10" cols="20" maxlength="100" placeholder="100자 제한" readonly><%= t.getTeamoutlook() %></textarea></td>
			</tr>
		</table><br>
		<%
			if(flag!=null){//팀장일때 보여짐
		%>
		<input class="btn" type="button" value="모집" onclick="regist()">
		<input class="btn" type="button" value="수정" onclick="update()">
		<input class="btn" type="button" value="팀 해체" onclick="disint()">
		<% 	
			}else {//팀원일때 보여짐
		%>
		<input class="btn" type="button" value="팀 탈퇴" onclick="leave()">
		<%
			}
		%>
		<input class="btn" type="button" value="이전" onclick="prev()">
	</form>
	</div>
<jsp:include page="footer.jsp"/>
</body>
</html>