<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js" ></script>
<script type="text/javascript" src="js/board.js"></script>
<style type="text/css">
	h2,form{
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
	}
	h2.title{
		text-align : left;
		margin-left : 50px;
		font-weight: bold;
		font-size : 25px;
	}
	table.info{
		margin-left: 110px;
	}
	img{
		width : 150px;
		height : 180px;
	}
</style>
<script type="text/javascript">
	var sel_files = [];
	
	$(document).ready(function(){
		$("#file").on("change",SelectImg);
	});
	function SelectImg(e){
		var files=e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			sel_file = f;
			var reader = new FileReader();
			reader.onload = function(e){
				$("#img").attr("src",e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}
</script>
</head>
<body>

	<form>
		<script type="text/javascript">
		this.moveTo(400,200);
		</script>
	<div class="main">
	<h2 class="title">사진 등록</h2>
	<hr>
	</div>
	</form>
	<form action="imgup.do" method="post" enctype="multipart/form-data">
		<table class="info">
			<tr>
				<td><img id="img"></td>
			</tr>
			<tr>
				<td><input type="file" id="file" accept="image/*" name="ufile"></td>
			</tr>
			<tr>
				<td><input class="btn" type="submit" value="등록"></td>
			</tr>
		</table><br>
	</form>
</body>
</html>