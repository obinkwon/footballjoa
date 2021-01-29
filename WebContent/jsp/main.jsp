<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
form{
	text-align : center;
}
img.mainImg{
	width : 500px;
	height : 500px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<div class="main">
		<form>
			<img class="mainImg" src="main.png">
		</form>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>