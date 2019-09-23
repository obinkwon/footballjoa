<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	div{
		text-align : center;
		margin : 20px 0px 0px 0px;
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
	input#left{
		margin-right : 75px;
	}
	div.main{
		height : 60%;
	}
</style>
<script type="text/javascript">
function pass(){
	var id = document.getElementById("id_login");
	var pw = document.getElementById("pw_login");
	if (id.value!=""){
		if(pw.value==""){
			alert("비밀번호를 입력해주세요");
			pw.focus();
			return false;
		}else return true;
	}else {
		alert("아이디를 입력해주세요");
		id.focus();
		return false;
	} 
}
function register(){
	alert("회원가입 페이지로 넘어갑니다");
	location.href='memberRegistForm.do';
}
</script>
</head>
<body>
	<div class="main">
		<h2>풋볼조아</h2>
		<form action="login.do" method="post" onsubmit="return pass()">
			<div>
				<input type="text" name="id" id="id_login"><br>
				<input type="password" name="pw" id="pw_login"><br>
			</div>
			<div>
				<a href="findForm.do">아이디/비밀번호를 잊어버리셨습니까?</a><br>
			</div>
			<div>
			<input class="btn" id="left" type="button" onclick="register()" value="회원가입">
			<input class="btn" id="right" type="submit" value="로그인">
			</div>
			<jsp:include page="footer.jsp"/>
		</form>
	</div>
</body>
</html>