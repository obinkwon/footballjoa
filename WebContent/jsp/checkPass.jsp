<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		if(window.name == "update"){//내 정보 수정 폼으로
			window.opener.parent.location.href="memberInfoUpdateForm.do";
		}else if(window.name == "delete"){// 내정보 삭제 액션으로
			window.opener.parent.location.href="memberInfoDelete.do";
		}
		window.close();//자식창은 종료 시킨다
	</script>
</body>
</html>