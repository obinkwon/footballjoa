<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js" ></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#h_reserveBoard").click(function(){
			location.href="reserveForm.do";
		});
		$("#h_teamMatch").click(function(){
			location.href="teamMatchForm.do";
		});
		$("#h_teamInfo").click(function(){
			location.href="teamInfoForm.do";
		});
		$("#h_myInfo").click(function(){
			location.href="memberInfoForm.do";
		});
		$("#h_logout").click(function(){
			var x = confirm("정말 로그아웃 하시겠습니까?");
			if(x==true){
				location.href="logout.do";
			}else{
				
			}
			
		});
	});
</script>
<style type="text/css">
	div#header{
		text-align : center;
		font-size : 13px;
		width:100%;
		clear : both;
	}
	div.header{
		margin-bottom : 100px;
	}
	ul.menu{
		list-style:none;
	    margin:0;
	    padding:0;
	    text-align : center;
	}
	li{
		display : inline-block;
		padding-top : 20px;
		height : 80px;
		margin-left : 50px;
	}
	li.logout{
		width: 80px;
		height: 50px;
		margin-left : 30px;
		padding-top : 20px;
	}
	li.first{
		margin-left : 0px;
		padding-top : 20px;
		height: 80px;
	}
	li:hover{
		border-radius: 4px;
		background-color : #d9d9d9; 
		cursor: pointer;
	}
	img{
		width: 50px;
		height: 50px;
	}
	a:hover{
		text-decoration : none;
	}
	a.content:hover{
		text-decoration : none;
		color : #d9d9d9;
	}
	a:focus{
		text-decoration : none;
	}
	a{
		text-decoration : none;
		color : black;
	}
</style>
</head>
<body>
	
    <!-- <li class="active"><a href="#">Home</a></li> 눌렀을때 색 변경-->
	<!-- Fixed navbar -->
	<div class="header">
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <a class="navbar-brand" href="main.do"><img src="home.png"></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="menu">
            <li class="first" id="h_reserveBoard"><a><img src="reserveBoard.png">예약게시판</a></li>
            <li id="h_teamMatch"><a><img src="teamMatch.png">팀매칭</a></li>
            <li id="h_teamInfo"><a><img src="teamInfo.png">팀정보</a></li>
            <li class="sub" id="h_myInfo"><a><img src="myInfo.png"></a>${ session_id }의 정보</li>
         	<li class="logout" id="h_logout"><a>로그아웃</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
    </div>
    <br>
</body>
</html>