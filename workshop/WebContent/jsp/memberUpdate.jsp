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
<script type="text/javascript">
	function fileUpload(){
		open_file("fileUpload.do","info");
	}
	function check(){
		var name = document.getElementById("name");
		var phone = document.getElementById("phone");
		var address = document.getElementById("address");
		
		if(name.value==""||phone.value==""||address.value==""){
			alert("누락된 정보가 있습니다");
			return false;
		}else
			return true;
	}
</script>
</head>
<body>
<jsp:include page="header.jsp"/>
	<div class="main">
	<h2 class="title"> 내 정보</h2>
	<hr>
	<form action="memberInfoUpdate.do" onsubmit="return check()">
		<input type="hidden" name="profile" value="${path}">
		<table class="info">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" class="text" value = "${session_id}" readonly></td>
				<td class="right">사진</td>
				<td rowspan="4" class="right"><img class="info" src="upload.do?path=${path}"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" class="text" id="name" value="${m.name}"></td>
				<td class="right"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="tel" name="phone" class="text" size="11" id="phone" value="0${m.phone}"></td>
				<td class="right"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="address" class="text" id="address" value="${m.address}"></td>
				<td class="right"></td>
			</tr>
			<tr>
				<td>포지션</td>
				<td>
					<select name="position" class="text" >
						<option value="GK">GK</option>
						<option value="DF">DF</option>
						<option value="MD">MD</option>
						<option value="FW">FW</option>
					</select>
				</td>
				<td class="right"></td>
				<td class="right"><input class="btn_long" type="button" value="사진 업로드" onclick="fileUpload()"></td>
			</tr>
			<tr>
				<td>팀이름</td>
				<td><input type="text" name="teamname" class="text" value = "${m.teamname}" readonly></td>
				<td class="right"></td>
				<td class="right"></td>
			</tr>
		</table><br>
		<input id="left" class="btn" type="submit" value="수정">
		<input class="btn" type="button" value="취소" onclick="location.href='memberInfoForm.do'">
	</form>
	</div>
<jsp:include page="footer.jsp"/>
</body>
</html>