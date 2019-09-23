<%@page import="model.Team"%>
<%@page import="model.Reserve"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function pass(){
		var title = document.getElementById("b_title");
		var usetime = document.getElementById("b_usetime");
		
		if(title.value==""){
			alert("제목을 입력하세요");
			title.focus();
			return false;
		}else if(usetime.value==""){
			alert("이용할 날짜를 선택하세요");			
			usetime.focus();
			return false;
		}else return true;
	}
	function remove(){
		var x = confirm("정말 삭제하시겠습니까?");
		if(x==true){
			location.href="reserveDelete.do?rid=${Reserve.rid}&id=${session_id}";
		}
		else{
			return false;
		}	
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
	.text2{
		width : 250px;
		height : 30px;
		margin : 10px 0px 10px 10px;
		border-radius: 2px;
		border: 0px;
	}
	table.info{
		margin : auto;
		border: 1px solid #d9d9d9;
	}
	td.right{
		padding-left : 43px;
	}input#left{
		margin-right : 50px;
	}
	

</style>
</head>
<body>
<%
	Reserve r = (Reserve)request.getAttribute("Reserve");
	Team t = (Team)request.getAttribute("Team");
	String usetime = (String)request.getAttribute("usetime");
	
%>
<jsp:include page="header.jsp"/>
	<div class="main">
	<hr>
	<form action="reserveUpdateForm.do" method="post">
	<input type="hidden" name="id" value="${session_id}">
		<table class="info">
			<tr>
				<td class="right">번호</td>
				<td><input type="text" name="rid" class="text2" value ="${Reserve.rid}" readonly></td>
				<td class="right">조회수</td>
				<td><input type="text" name="readcount" class="text2"  value="${Reserve.readcount}" readonly></td>
			</tr>
			<tr>
				<td class="right">제목</td>
				<td><input type="text" name="title" class="text2" value="${Reserve.title}" readonly></td>
				<td class="right">난이도</td>
				<td><input type="text" name="levels" class="text2" value="${Reserve.levels}" readonly></td>
			</tr>
			<tr>
				<td class="right">팀 이름</td>
				<td><input type="text" name="teamname" class="text2" value="${Team.teamname}" readonly></td>
				<td class="right">작성일자</td>
				<td><input type="date" name="writedate" class="text2" value="${Reserve.writedate}" readonly></td>
			</tr>
			<tr>
				<td class="right">팀 인원</td>
				<td><input type="text" name="teamcount" class="text2" value="${Team.teamcount}" readonly></td>
				<td class="right">구장</td>
				<td><input type="text" name="stadium" class="text2" value="${Reserve.stadium}" readonly></td>
			</tr>
			<tr>
				<td class="right">이용날짜</td>
				<td><input type="text" name="usetime" class="text2" value="${usetime}" readonly></td>
				<td></td>
				<td></td>
			</tr>
		</table><br>
		<input id="left" class="btn" type="submit" value="수정">
		<input id="left" class="btn" type="button" value="삭제" onclick="return remove()">
		<input class="btn" type="button" value="이전" onclick="location.href='reserveForm.do'">
	</form>
	</div>
<jsp:include page="footer.jsp"/>
</body>
</html>