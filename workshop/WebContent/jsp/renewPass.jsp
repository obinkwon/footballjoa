<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/board.js"></script>
<style type="text/css">
	form{
		margin-top : 70px;
		text-align : center;
	}
	h2{
		text-align : left;
		margin-left : 75px;
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
	.text{
		width : 250px;
		height : 30px;
		margin : 10px 0px 0px 10px;
		border-radius: 2px;
		border: 1px solid #d9d9d9;
	}
</style>
</head>
<script type="text/javascript">
	this.moveTo(400,250);
</script>
<body>
	<form action="MainServlet" method="post">
		<input type="hidden" name="command" value="renewPass">
		<input type="hidden" name="id" value="${id}">
		<h2>새로운 비밀번호 지정</h2>
		<hr>
		<input class="text" type="password" name="pw">
		<input class="btn" type="submit" value="확인">
	</form>
</body>
</html>