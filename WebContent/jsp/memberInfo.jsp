<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/board.js"></script>
<script type="text/javascript">
	
</script>
<script type="text/javascript">
	function pwCheck_update(){
		open_win('pwCheckForm.do','update');
	}
	function pwCheck_leave(){
		open_win('pwCheckForm.do','delete');
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
	img.info{
		width : 150px;
		height : 180px;
	}
</style>
</head>
<body>
<jsp:include page="header.jsp"/>
	<div class="main">
	<h2 class="title"> 내 정보</h2>
	<hr>
	<form>
		<table class="info">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" class="text" value="${ m.id }" readonly></td>
				<td class="right">사진</td>
				<td rowspan="5" class="right"><img class="info" src="upload.do?path=${m.profile}"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" class="text" value="${ m.name }" readonly></td>
				<td class="right"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="tel" name="phone" class="text" value="0${ m.phone }" readonly></td>
				<td class="right"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="address" class="text" value="${ m.address }" readonly></td>
				<td class="right"></td>
			</tr>
			<tr>
				<td>포지션</td>
				<td><input type="text" name="name" class="text" value="${ m.position }" readonly></td>
				<td class="right"></td>
			</tr>
			<tr>
				<td>팀이름</td>
				<td><input type="text" name="teamname" class="text" value="${ m.teamname }" readonly></td>
				<td class="right"></td>
			</tr>
		</table><br>
		<input id="left" class="btn" type="button" value="수정" onclick="pwCheck_update()">
		<input class="btn" type="button" value="탈퇴" onclick="pwCheck_leave()">
	</form>
	</div>
<jsp:include page="footer.jsp"/>
</body>
</html>