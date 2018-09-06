<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = (String)session.getAttribute("idKey");
String adminOk = (String)session.getAttribute("adminOk");
id = id == null ? adminOk:id;

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/board.css">
</head>
<body style="text-align:center">
<h1 >게시판</h1><br>

<a style="text-decoration:none" href="board/boardlist.jsp">[게시판]</a><br>

<%if(id == null){
%>	
	&nbsp;&nbsp;<a style="text-decoration:none" href="member/login.jsp">[로그인]</a>
	<a style="text-decoration:none" href="member/register.jsp">[회원가입]</a><br>
<%
}else{
	%>
	<a style="text-decoration:none" href="member/logout.jsp">[로그아웃]</a><br>	
	
<%
}%>

</body>
</html>