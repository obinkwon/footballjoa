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
		border-radius: 2px;
		border: 1px solid #d9d9d9;
		resize: none;
	}
	td.text_pre{
		padding-top : 10px;
		text-align : left;
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
<jsp:include page="header.jsp"/>
<div class="main">
	<form>
		<script type="text/javascript">
		var team = "<%=request.getAttribute("team")%>";
		this.moveTo(170,100);
		
		</script>
		<div class="main">
	<h2 class="title">모집 정보</h2>
	<hr>
	</div>
		<script type="text/javascript">
			function update(){
				var title =  $("#title").val();
				var count =  $("#count").val();
				var x = confirm("정말 수정하시겠습니까?");
				if(x==true)
					location.href='teamRecruitUpdate.do?eid=${e.eid}&title='+ title +'&count=' + count;
			}
			function prev(){
				var x = confirm("페이지 이동시 해당 내용은 저장되지 않습니다.");
				if(x==true) history.go(-1);
			}
		</script>
	</form>
	<form action="MainServlet" method="post">
		<table class="info">
			<tr>
				<td>팀 이름</td>
				<td class="right"><input type="text" name="teamname" class="text2" value="${t.teamname}" readonly></td>
				<td class="text_pre">제목</td>
			</tr>
			<tr>
				<td>팀 인원수</td>
				<td class="right"><input type="text" name="count" class="text2" value="${t.teamcount }" readonly ></td>
				<td rowspan="5" class="text_pre"><textarea name="title" class="text_pre" rows="5" cols="32" maxlength="50" placeholder="50자 제한" id = "title">${e.title}</textarea></td>
			</tr>
			<tr>
				<td>팀 지역</td>
				<td class="right"><input type="text" name="teamloc" class="text2" value="${t.teamloc}" readonly></td>
			</tr>
			<tr>
				<td>모집 인원수</td>
				<td class="right"><input type="text" name="count" id="count" class="text" value="${e.count }" id="count"></td>
			</tr>
			<tr>
				<td>작성일자</td>
				<td class="right"><input type="text" name="writedate" class="text2" value="${e.writedate}" readonly></td>
			</tr>
			<tr>
				<td>조회수</td>
				<td class="right"><input type="text" name="readcount" class="text2" value="${e.readcount}" readonly></td>
			</tr>
		</table><br>
		<input class="btn" type="button" value="수정" onclick="update()">
		<input class="btn" type="button" value="이전" onclick="prev()">
	</form>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>