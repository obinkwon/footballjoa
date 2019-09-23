<%@page import="model.Reserve"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/board.js"></script>
<script type="text/javascript">
	function acceptForm(rid){
		var x=open_team('MainServlet?command=teamMatchAcceptForm&rid='+rid+'&id=${ session_id }','accept');
		x.moveTo(170,100);
	}
</script>
<style type="text/css">
	th.title{
		text-align : center;
	}
	input.btn2{
		border-radius: 4px;
		border-color: #666666;
		background-color: #666666;
		color : white;
		width : 80px;
		height : 30px;
		float : right;
		margin-right : 52px;
	}
</style>
</head>
<body>

<% 
	List<Reserve> matchBoardList = (List<Reserve>)request.getAttribute("matchBoardList");
	List<Reserve> reserveBoardList = (List<Reserve>)request.getAttribute("reserveBoardList");
	%>
	<jsp:include page="header.jsp"/>
	<!-- 예약현황 테이블 -->
	<div class="table-responsive"  >
	<h2 class="sub-header">예약 현황</h2>
	<form>

	    <table class="table table-striped" >
	      <thead>
	        <tr>
	          <th class="title">번호</th>
	          <th class="title">팀 이름</th>
	          <th class="title">제목</th>
	          <th class="title">구장</th>
	          <th class="title">난이도</th>
	          <th class="title">작성 일자</th>
	          <th class="title">조회수</th>
	          <th class="title">수락여부</th>
	        </tr>
	      </thead>
	      <tbody>
	       <%for(Reserve r :reserveBoardList) {%>
	        <tr>
	        	<td><%= r.getRid() %></td>
	        	<td><%= r.getTeamname() %></td>
	        	<td><a href="reserveInfo.do?rid=<%=r.getRid() %>" class="content"><%= r.getTitle() %></a></td>
	        	<td><%= r.getStadium() %></td>
	        	<td><%= r.getLevels() %></td>
	        	<td><%= r.getWritedate()  %></td>
	        	<td><%= r.getReadcount()  %></td>
	        	<% if(r.getAway()!=null){%>
	        	<td><input class="btn" type="button" value="수락" onclick="acceptForm(<%= r.getRid()%>)"></td>
	        	<% }else {%>
	        	<td><input class="btn" type="button" value="-"></td>
	        	<% } %>
	        	
	        </tr>
	        <% } %>
	        
	      </tbody>
	    </table>
	    <input class="btn2" type="button" onclick="location.href='reserveInsertForm.do?id=<%= session.getAttribute("session_id")%>'" value="등록">
	</form>
    </div>
    <!-- 매칭현황 테이블 -->
    <div class="table-responsive" >
	<h2 class="sub-header">매칭 현황</h2>
	<form>
	    <table class="table table-striped">
	      <thead>
	        <tr>
	          <th class="title">번호</th>
	          <th class="title">예약 팀</th>
	          <th class="title">홈</th>
	          <th class="title">어웨이</th>
	          <th class="title">장소</th>
	          <th class="title">이용 요금</th>
	          <th class="title">이용 날짜</th>
	        </tr>
	      </thead>
	      <tbody>
	      <!-- 여기부터  -->
	          <%for(Reserve r : matchBoardList) {%>
	        <tr>
	        	<td><%= r.getRid() %></td>
	        	<td><%= r.getTeamname() %></td>
	        	<td><%= r.getTeamname() %></td>
	        	<td><%= r.getAway() %></td>
	        	<td><%= r.getStadium() %></td>
	        	<td><%= r.getFee() %></td>
	        	<td><%= r.getUsetime() %></td>
	        </tr>
	        <% } %>
	      <!-- 여기까지 for문 반복  -->
	      </tbody>
	    </table>
	</form>
    </div>
	<jsp:include page="footer.jsp"/>
</body>
</html>