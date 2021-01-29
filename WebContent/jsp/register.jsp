<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js" ></script>
<script type="text/javascript" src="js/board.js" ></script>
<style type="text/css">
	div{
		text-align : center;
		margin : 20px 0px 0px 0px;
	}
	h2{
		text-align : center;
		margin-top : 150px;
	}
	input,select{
		width : 250px;
		height : 30px;
		margin : 10px 0px 0px 0px;
		border-radius: 2px;
		border: 1px solid #d9d9d9;
	}
	table{
		margin : auto;
	}
	td.right{
		padding-left : 43px;
	}
	tr.center{
		text-align : center;
	}
	img{
		width : 150px;
		height : 180px;
	}
</style>
<script type="text/javascript">
	function pass(){
		
		var id = document.getElementById("id_regist");
		var pw = document.getElementById("pw_regist");
		var pw2 = document.getElementById("pw2_regist");
		var name = document.getElementById("name_regist");
		var phone = document.getElementById("phone_regist");
		var position = document.getElementById("position_regist");
		var address = document.getElementById("address_regist");
		
		if (id.value==""){
			alert("아이디를 입력해주세요");
			id.focus();
			return false;
		}else if(pw.value==""){
			alert("비밀번호를 입력해주세요");
			pw.focus();
			return false;
		}else if(name.value==""){
			alert("이름을 입력해주세요");
			name.focus();
			return false;
		}else if(phone.value==""){
			alert("전화번호를 입력해주세요");
			phone.focus();
			return false;
		}else if(position.value==""){
			alert("포지션을 선택해주세요");
			position.focus();
			return false;
		}else if(address.value==""){
			alert("주소를 입력해주세요");
			address.focus();
			return false;
		}else if(pw.value==pw2.value){
			return true;
		}else{
			alert("비밀번호 확인이 틀립니다");
			return false;
		}
	}
	function fileUpload(){
		open_file("fileUpload.do","regist");
	}
	
</script>
</head>
<body>
	<div class="main">
		<h2>풋볼조아</h2>
	<h3>회원가입</h3>
	
	<form id="writeForm" action="memberRegist.do" method="post" onsubmit="return pass()">
		<input type="hidden" name="profile" value="${path}">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" id="id_regist"></td>
				<td class="right">사진</td>
				<td rowspan="4"><img src="upload.do?path=${path}"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw" id="pw_regist"></td>
				<td class="right"></td>
				<td></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="pw2" id="pw2_regist"></td>
				<td class="right"></td>
				<td></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" id="name_regist"></td>
				<td class="right"></td>
				<td></td>
				
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="phone" id="phone_regist"></td>
				<td class="right"></td>
				<td><input class="btn" type="button" value="사진 업로드" onclick="fileUpload()"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="address" id="address_regist"></td>
				<td class="right">포지션</td>
				<td>
					<select name="position" id="position_regist">
						<option value="GK">GK</option>
						<option value="DF">DF</option>
						<option value="MD">MD</option>
						<option value="FW">FW</option>
					</select>
				</td>
			</tr>
		</table><br>
		<input class="btn" type="submit" value="확인">
	</form>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>