<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function pass(){
		var title = document.getElementById("b_title");
		var usetime = document.getElementById("b_usetime");
		
		if(title.value==""){
			alert("제목을 입력하세요");
			title.focus();
			return false;
		}else if(usetime.value==""){
			alert("이용할 날짜를 선택하세요");			
			usetime.focus();
			return false;
		}else return true;
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
		border: 0px;
	}
	table.info{
		margin: auto;
	}
	td.right{
		padding-left : 43px;
	}
	input#left{
		margin-right : 150px;
	}
</style>
</head>
<body>
<jsp:include page="header.jsp"/>
	<div class="main">
	<h2 class="title">게시판 등록</h2>
	<hr>
	<form action="reserveInsert.do" method="post" onsubmit="return pass()">
	<input type="hidden" name="id" value="${session_id}">
		<table class="info">
			<tr>
				<td>팀 이름</td>
				<td><input type="text" name="teamname" value="${teamname}" class="text2" readonly></td>
				<td class="right">구장</td>
				<td>
					<select name="stadium" class="text" id="b_stadium">
						<option value="화이트 하트레인">화이트 하트레인</option>
						<option value="안필드">안필드</option>
						<option value="캄프누">캄프누</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" class="text" id="b_title"></td>
				<td class="right">난이도</td>
				<td>
					<select name="levels" class="text" id="b_position">
						<option value="상">상</option>
						<option value="중">중</option>
						<option value="하">하</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>이용시간</td>
				<td><input type="date" name="usetime" class="text" id="b_usetime"></td>
				<td colspan="2">
					<input type="radio" name="time" value="오전" checked="checked">오전
					<input type="radio" name="time" value="오후">오후
				</td>
			</tr>
		</table><br>
		<input id="left" class="btn" type="submit" value="등록">
		<input class="btn" type="button" value="취소" onclick="location.href='reserveForm.do'">
	</form>
	</div>
<jsp:include page="footer.jsp"/>
</body>
</html>