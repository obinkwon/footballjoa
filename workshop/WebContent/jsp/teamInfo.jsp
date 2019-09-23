<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js" ></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#teamInfo").click(function(){
			//팀 정보 조회 눌렀을때 반응 
			location.href="teamInfoSelectForm.do";
		});
		$("#teamCreate").click(function(){
			//팀 등록 눌렀을때 반응
			location.href="teamRegistForm.do";
		});
		$("#recruit").click(function(){
			//팀원 모집 눌렀을때 반응
			location.href="teamRecruitBoardForm.do";
		});
	});
</script>
<style type="text/css">
	li.sub2{
		margin-left : 100px;
		width : 200px;
		height : 200px;
		padding-top : 0px;
	}
	li.sub2_1{
		width : 200px;
		height : 200px;
		padding-top : 0px;
	}
	img.mainImg{
		width : 200px;
		height : 200px;
	}
	.info{
		text-align : center;
		margin-top : 100px;
	}
</style>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<div class="info">
		<ul class="info">
			<li class="sub2_1" id="teamInfo"><img class="mainImg" src="team.png"><br><a>팀 정보 조회</a></li>
			<li class="sub2" id="teamCreate"><img class="mainImg" src="teamCreate.png"><br><a>팀 등록</a></li>
			<li class="sub2" id="recruit"><img class="mainImg" src="recruit.png"><br><a>팀원 모집</a></li>
		</ul>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>