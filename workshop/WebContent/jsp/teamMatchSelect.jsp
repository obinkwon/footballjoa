<%@page import="model.Reserve"%>
<%@page import="model.Team"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function leave(){
		var url="MainServlet?command=memberInfoDelete";
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
	.text_pre{
		width : 250px;
		height : 250px;
		margin : 10px 0px 0px 10px;
		border-radius: 2px;
		border: 0px solid #d9d9d9;\
		line-height : 20px;
	}
	table.info{
		margin : auto;
	}
	td{
		text-align : left;
	}
	td.right{
		padding-left : 43px;
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
<jsp:include page="header.jsp"/>
	<div class="main">
	<h2 class="title">상대팀 정보</h2>
	<hr>
	<form>
		<script type="text/javascript">
			function prev(){
				location.href="teamMatchForm.do";
			}
		</script>
	</form>
	<form action="teamMatchSelect.do" method="post">
	<input type="hidden" name="rid" value="${Reserve.rid}">
		<table class="info">
			<tr>
				<td>팀 이름</td>
				<td><input type="text" name="teamname" class="text" value="${Team.teamname}" readonly></td>
				<td rowspan="4"><img class="info" src="teamImg.png"></td>
			</tr>
			<tr>
				<td>팀 지역</td>
				<td><input type="text" name="teamloc" class="text" value="${Team.teamloc}" readonly></td>
			</tr>
			<tr>
				<td>팀 회원수</td>
				<td><input type="text" name="teamcount" class="text" value="${Team.teamcount}" readonly></td>
			</tr>
			<tr>
				<td>팀 소개</td>
				<td><input type="text" name="teamoutlook" class="text_pre" value="${Team.teamoutlook}" readonly></td>
			</tr>
		</table><br>
		<input class="btn" type="submit" value="매칭">
		<input class="btn" type="button" value="취소" onclick="prev()">
	</form>
	</div>
<jsp:include page="footer.jsp"/>
</body>
</html>