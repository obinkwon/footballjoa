<%@page import="model.Team"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function update(){//팀 수정
		var teamname = document.getElementById('teamname').value;
		var teamcount = document.getElementById('teamcount').value;
		var teamloc = document.getElementById('teamloc').value;
		var teamoutlook = document.getElementById('teamoutlook').value;
		alert("수정 완료했습니다!");
		this.location.href="teamInfoUpdate.do?teamloc="+teamloc+"&teamoutlook="+teamoutlook+"&teamname="+teamname;
	}
	function prev(){//취소
		var url="teamInfoSelectForm.do";
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
	.text2{
		width : 250px;
		height : 30px;
		margin : 10px 0px 0px 10px;
		border-radius: 2px;
		border: 1px solid #d9d9d9;
		
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
	<h2 class="title">우리팀 정보</h2>
	<hr>
	<form>
		<table class="info">
			<tr>
				<td>팀 이름</td>
				<td><input type="text" name="teamname" class="text" value="${teamname}" readonly id ="teamname"></td>
				<td rowspan="4"><img class="info" src="teamImg.png"></td>
			</tr>
			<tr>
				<td>팀 지역</td>
				<td><input type="text" name="teamloc" class="text2" value ="${t.teamloc}" id= "teamloc"></td>
			</tr>
			<tr>
				<td>팀 회원수</td>
				<td><input type="text" name="teamcount" class="text" value="${t.teamcount}" readonly id= "teamcount" ></td>
			</tr>
			<tr>
				<td class="text_pre">팀 소개</td>
				<td><textarea name="teamoutlook" class="text_pre" rows="10" cols="32" maxlength="100" placeholder="100자 제한" id="teamoutlook">${t.teamoutlook}</textarea></td>
			</tr>
		</table><br>
		<input class="btn" type="button" value="수정" onclick="update()">
		<input class="btn" type="button" value="취소" onclick="prev()">
	</form>
	</div>
<jsp:include page="footer.jsp"/>
</body>
</html>