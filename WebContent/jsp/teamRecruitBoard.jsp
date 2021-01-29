<%@page import="model.Recruit"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	th.title{
		text-align : center;
	}
	div.search{
		text-align : center;
		margin-top : 100px;
	}
	.text{
		width : 250px;
		height : 30px;
		margin : 10px 0px 0px 10px;
		border-radius: 2px;
		border: 1px solid #d9d9d9;
	}
	.btn2{
		border-radius: 2px;
		width : 75px;
		height : 30px;
		border: 1px solid #d9d9d9;
		margin : 0px 30px 0px 5px;
	}
	img.search{
		width : 30px;
		height : 30px;
	}
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js" ></script>
<script type="text/javascript">
	function match(){
		location.href="MainServlet?command=teamMatchSelectForm";
	}
	$(document).ready(function(){
		$("#btn2").click(function(){
			var search = $("#search").val();
			var select = $("#select").val();
			location.href="MainServlet?command=teamMatchSearch&search="+search+"&select="+select;
		});
	});
</script>
</head>
<body>
	<% List<Recruit> recruitList = (List<Recruit>)request.getAttribute("recruitList"); %>
	
	<jsp:include page="header.jsp"/>
	<div class="table-responsive">
	<h2 class="sub-header">팀원 모집 현황</h2>
	<form>
	    <table class="table table-striped">
	      <thead>
	        <tr>
	          <th class="title">번호</th>
	          <th class="title">팀 이름</th>
	          <th class="title">제목</th>
	          <th class="title">모집 인원수</th>
	          <th class="title">작성 일자</th>
	          <th class="title">조회수</th>
	        </tr>
	      </thead>
	      <tbody>
	     
	        	<%for(Recruit e : recruitList){ %>
	        	<tr>
		        	<td><%= e.getEid() %></td>
		        	<td><%= e.getTeamname() %></td>
		        	<td><a href="teamRecruitInfo.do?eid=<%= e.getEid() %>" class="content"><%= e.getTitle() %></a></td>
		        	<td><%= e.getCount() %></td>
		        	<td><%= e.getWritedate() %></td>
		        	<td><%= e.getReadcount() %></td>
	        	</tr>
	        	<% } %>
	   
	      </tbody>
	    </table>
	</form>
    </div>
    <!-- <div class="search">
		<input type="text" name="search" class="text" id="search"><button class="btn2" id="btn2"><img src="search.png" class="search">검색</button>
		<select name="select" class="text" id="select">
			<option value="">전체</option>
			<option value="stadium">구장 별</option>
			<option value="teamname">팀 이름 별</option>
		</select>
	</div> -->
	<jsp:include page="footer.jsp"/>
</body>
</html>