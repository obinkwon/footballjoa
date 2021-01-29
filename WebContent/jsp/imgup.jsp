<%@page import="org.springframework.web.multipart.MultipartRequest"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<script type="text/javascript">
	if(window.name=="regist"){
		window.opener.parent.location.href='memberRegistForm.do?path=${fileName}';
	}else{
		window.opener.parent.location.href='memberInfoUpdateForm.do?path=${fileName}';
	}
	window.close();
</script>
<title>Insert title here</title>
</head>
<body>
</body>
</html>