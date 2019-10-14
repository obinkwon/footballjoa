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
		border: 0px solid #d9d9d9;
	}
	table.info{
		margin : auto;
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
</style>
</head>
<body>

	<form>
	<div class="main">
	<h2 class="title">상대팀 정보</h2>
	<hr>
	</div>
		<script type="text/javascript">
			function after(){
				var x = confirm("수락하시겠습니까?");
				if(x==true){
					window.opener.parent.location.href='teamMatchAccept.do?rid=${r.rid}';
					window.close();
				}
			}
			function prev(){
				window.close();
			}
			function reject(){
				var x = confirm("거부 하시겠습니까?");
				if(x==true){
					window.opener.parent.location.href='teamMatchReject.do?rid=${r.rid}';
					window.close();
				}
			}
		</script>
	</form>
	<form>
		<table class="info">
			<tr>
				<td>팀 이름</td>
				<td><input type="text" name="teamname" class="text" value="${ t.teamname }" readonly></td>
				<td rowspan="4"><img class="teamImg" src="teamImg.png"></td>
			</tr>
			<tr>
				<td>팀 지역</td>
				<td><input type="text" name="teamloc" class="text" value="${ t.teamloc }" readonly></td>
			</tr>
			<tr>
				<td>팀 회원수</td>
				<td><input type="text" name="teamcount" class="text" value="${ t.teamcount }" readonly></td>
			</tr>
			<tr>
				<td>팀 소개</td>
				<td><input type="text" name="teamoutlook" class="text" value="${t.teamoutlook}" readonly></td>
			</tr>
		</table><br>
		<input class="btn" type="button" value="매칭" onclick="after()">
		<input class="btn" type="button" value="거부" onclick="reject()">
		<input class="btn" type="button" value="취소" onclick="prev()">
	</form>
</body>
</html>