<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function leave(){
		var url="MainServlet?command=teamLeave";
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
		border: 1px solid #d9d9d9;
		
	}
	.text2{
		width : 250px;
		height : 30px;
		margin : 10px 0px 0px 10px;
		border-radius: 2px;
		border: 0px solid #d9d9d9;
		
	}
	textarea.text_pre{
		margin : 10px 0px 0px 10px;
		border-radius: 2px;
		border: 1px solid #d9d9d9;
		resize: none;
	}
	td.text_pre{
		padding-top : 30px;
		vertical-align: top;
	}
	table.info{
		margin-left : 19%;
	}
	td{
		text-align : left;
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
<jsp:include page="header.jsp"/>
	<div class="main">
	<h2 class="title">팀 등록</h2>
	<hr>
	<form>
		<script type="text/javascript">
		function prev(){
			location.href = "teamInfoForm.do";
		}
		function regist(){
			var teamloc = document.getElementById("teamloc");
			var teamname = document.getElementById("teamname");
			var team
			if(teamloc.value==""){
				alert("팀 지역을 입력해주세요");
				teamloc.focus();
				return false;
			}else if(teamname.value==""){
				alert("팀 이름을 입력해주세요");
				teamname.focus();
				return false;
			}else {
				alert("팀 등록을 하겠습니다");
				return true;
			}
		}
		</script>
	</form>
	<form action="teamRegist.do" method="post" onsubmit="return regist()">
		<table class="info">
			<tr>
				<td>팀 이름</td>
				<td><input type="text" name="teamname" class="text2"></td>
				<td rowspan="3"><img class="info" src="teamImg.png"></td>
			</tr>
			<tr>
				<td>팀 지역</td>
				<td><input type="text" name="teamloc" class="text" id="teamloc"></td>
			</tr>
			<tr>
				<td class="text_pre">팀 소개</td>
				<td class="text_pre"><textarea name="teamoutlook" class="text_pre" rows="10" cols="32" maxlength="100" placeholder="100자 제한"></textarea></td>
			</tr>
		</table><br>
		<input class="btn" type="submit" value="등록">
		<input class="btn" type="button" value="이전" onclick="prev()">
	</form>
	</div>
<jsp:include page="footer.jsp"/>
</body>
</html>