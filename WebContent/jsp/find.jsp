<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/board.js"></script>
<script type="text/javascript">
	function passId(){
		var name = document.getElementById("id_name");
		var phone = document.getElementById("id_phone");
		if(name.value==""){
			alert("이름을 입력해주세요");
			name.focus();
		}else if(phone.value==""){
			alert("전화번호를 입력해주세요");
			phone.focus();	
		}else {
			open_win('findId.do?name='+name.value+'&phone='+phone.value+'','checkId');
		}
	}
	
	function passPw(){
		var id = document.getElementById("pw_id");
		var name = document.getElementById("pw_name");
		var phone = document.getElementById("pw_phone");
		if(id.value==""){
			alert("아이디를 입력해주세요");
			id.focus();
		}else if(name.value==""){
			alert("이름을 입력해주세요");
			name.focus();
		}else if(phone.value==""){
			alert("전화번호를 입력해주세요");
			phone.focus();	
		}else{
			open_win('findPw.do?id='+id.value+'&name='+name.value+'&phone='+phone.value+'','checkPw');
		}
	}
</script>
<style type="text/css">
	div{
		text-align : center;
		margin : 20px 0px 0px 0px;
	}
	div.left{
		display : inline;
		float:left;
		height: 300px;
	}
	div#left{
		margin-left : 21%;
	}
	div#right{
		margin-left : 43px;
		border-left: 1px solid black;
	}
	h2{
		text-align : center;
		margin-top : 150px;
	}
	input{
		width : 250px;
		height : 30px;
		margin : 10px 0px 0px 0px;
		border-radius: 2px;
		border: 1px solid #d9d9d9;
	}
	input.btn{
		border-radius: 4px;
		border-color: #666666;
		background-color: #666666;
		color : white;
		width : 80px;
		height : 30px;
		float : right;
	}
</style>
</head>
<body>
	<div class="main">
		<h2>풋볼조아</h2>
		<form>
			<div class="left" id="left">
			<h3>ID찾기</h3>
				<table>
					<tr>
						<td>이름</td>
						<td><input type="text" name="name" id="id_name"></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input type="tel" name="phone" id="id_phone"></td>
					</tr>
					<tr>
						<td><br></td>
					</tr>
				</table>
			<input class="btn" id="checkId" type="button" value="확인" onclick="passId()">
			</div>
		</form>
		<form>
			<div class="left" id="right">
			<h3>PW찾기</h3>
				<table>
					<tr>
						<td>아이디</td>
						<td><input type="text" name="id" id="pw_id"></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="name" id="pw_name"></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input type="tel" name="phone" id="pw_phone"></td>
					</tr>
				</table>
				<input class="btn" id="checkPw" type="button" value="확인" onclick="passPw()">
			</div>
		</form>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>