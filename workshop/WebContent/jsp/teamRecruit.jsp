<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/board.js"></script>
<style type="text/css">
	h2,form{
		margin-top : 70px;
		text-align : center;
	}
	input.btn:hover,input.btn2:hover{
		cursor: pointer;
		color : #f2f2f2;
		background-color : #a6a6a6;
		border-color: #a6a6a6;
	}
	input.btn{
		border-radius: 4px;
		border-color: #666666;
		background-color: #666666;
		color : white;
		width : 80px;
		height : 30px;
	}
	div.main{
		text-align : center;
		margin : 20px 0px 0px 0px;
	}
	h2.title{
		text-align : left;
		margin-left : 230px;
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
	td.right{
		padding-left : 43px;
	}
	td.top{
		vertical-align : center;
	}
	input#left{
		margin-right : 150px;
	}
</style>
</head>
<body>
	<form>
	<script type="text/javascript">
		this.moveTo(170,100);
	</script>
	<div class="main">
		<h2 class="title">모집 정보</h2><hr>
	</div>
		<script type="text/javascript">
			function after(){
				var teamname = document.getElementById('teamname').value;
				var teamcount = document.getElementById('teamcount').value;
				var teamtitle = document.getElementById('teamtitle').value;
				window.opener.parent.location.href='teamRecruit.do?teamname='+teamname+'&teamcount='+teamcount+'&teamtitle='+teamtitle;
				alert("모집완료 하였습니다");
				window.close();
			}
		</script>
	</form>
	<form>
		<table class="info">
			<tr>
				<td>팀 이름</td>
				<td><input type="text" name="teamname" class="text2" value="${teamname}" readonly="readonly" id="teamname"></td>
				<td rowspan="3"><img class="teamImg" src="teamImg.png"></td>
			</tr>
			<tr>
				<td>모집 인원수</td>
				<td><input type="text" name="count" class="text" placeholder="인원수를 입력하세요(숫자)" id="teamcount"></td>
			</tr>
			<tr>
				<td class="text_pre">제목</td>
				<td class="text_pre"><textarea name="title" class="text_pre" rows="5" cols="32" maxlength="50" placeholder="50자 제한" id="teamtitle"></textarea></td>
			</tr>
		</table><br>
		<input class="btn" type="button" value="등록" onclick="after()">
	</form>
</body>
</html>