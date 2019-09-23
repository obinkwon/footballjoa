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
</style>
</head>
<body>
	<form>
		<script type="text/javascript">
		var check = "<%=request.getAttribute("check")%>";
		
		this.moveTo(400,250);
		
		document.write("<h2>"+check+"</h2>");
		</script>
		<input class="btn" type="button" value="확인" onclick="check()">
		<script type="text/javascript">
			function check(){
				window.opener.parent.location.href='loginForm.do';
				window.close();
			}
		</script>
	</form>
</body>
</html>