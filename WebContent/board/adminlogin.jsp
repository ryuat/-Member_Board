<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

if(id.equals("admin") && pwd.equals("aaa")){
	session.setAttribute("adminOk", id);
	out.println("로그인성공<br>");
}else{
	out.println("로그인실패<br>");
}
%>
<body>
[<a href="#" onclick="javascript:window.close()">창닫기</a>]
</body>
</html>