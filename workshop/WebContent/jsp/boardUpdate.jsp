<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	alert("수정화면 페이지입니다.");
	function pass(){
		var x = confirm("정말 수정하시겠습니까?");
		if(x==true){
			var title = document.getElementById("bu_title");
			var usetime = document.getElementById("bu_usetime");
			
			if(title.value==""){
				alert("제목을 입력하세요");
				title.focus();
				return false;
			}else if(usetime.value==""){
				alert("이용할 날짜를 선택하세요");			
				usetime.focus();
				return false;
			}else return true;
		}else{
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
	.text{
		width : 250px;
		height : 30px;
		margin : 10px 0px 10px 10px;
		border-radius: 2px;
		border: 1px solid #d9d9d9;
	}
	.text2{
		width : 250px;
		height : 30px;
		margin : 10px 0px 10px 10px;
		border-radius: 2px;
		border: 0px solid #d9d9d9;
	}
	table.info{
		margin-left : 22%;
		border: 1px solid #d9d9d9;
	}
	td.right{
		padding-left : 43px;
	}
	input#left{
		margin-right : 150px;
	}
</style>
</head>
<body>
<% 
	String rid = (String)request.getAttribute("rid");
	String readcount = (String)request.getAttribute("readcount");
	String title = (String)request.getAttribute("title");
	String levels = (String)request.getAttribute("levels");
	String teamname = (String)request.getAttribute("teamname");
	String writedate = (String)request.getAttribute("writedate");
	String teamcount = (String)request.getAttribute("teamcount");
	String stadium = (String)request.getAttribute("stadium");
	String usetime = (String)request.getAttribute("usetime");
%>
<jsp:include page="header.jsp"/>
	<div class="main">
	<hr>
	<form action="MainServlet" method="post" onsubmit="return pass()">
	<input type="hidden" name="command" value="reserveUpdate">
		<table class="info">
			<tr>
				<td class="right">번호</td>
				<td><input type="text" name="rid" class="text2" value="<%=rid%>" readonly></td>
				<td class="right">조회수</td>
				<td><input type="text" name="readcount" class="text2" value="<%=readcount%>" readonly></td>
			</tr>
			<tr>
				<td class="right">제목</td>
				<td><input type="text" name="title" class="text" value="<%=title%>" id="bu_title"></td>
				<td class="right">난이도</td>
				<td>
					<select name="levels" class="text">
						<option value="상">상</option>
						<option value="중">중</option>
						<option value="하">하</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="right">팀 이름</td>
				<td><input type="text" name="teamname" class="text2" value="<%=teamname%>" readonly></td>
				<td class="right">작성일자</td>
				<td><input type="date" name="writedate" class="text2" value="<%=writedate%>" readonly></td>
			</tr>
			<tr>
				<td class="right">팀 인원</td>
				<td><input type="text" name="teamcount" class="text2" value="<%=teamcount%>" readonly></td>
				<td class="right">구장</td>
				<td>
					<select name="stadium" class="text">
						<option value="화이트 하트레인">화이트 하트레인</option>
						<option value="안필드">안필드</option>
						<option value="캄프누">캄프누</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="right">이용날짜</td>
				<td>
					<input type="date" name="usetime" class="text" value="<%=usetime %>" id="bu_usetime"></td>
				<td colspan="2">
					<input type="radio" name="time" value="오전" checked="checked">오전
					<input type="radio" name="time" value="오후">오후
				</td>
			</tr>
		</table><br>
		<input id="left" class="btn" type="submit" value="수정">
		<input class="btn" type="button" value="이전" onclick="history.go(-1)">
	</form>
	</div>
<jsp:include page="footer.jsp"/>
</body>
</html>