<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>    
<jsp:useBean id="memBean" class="my.shop.member.MemberBean"/>
<jsp:setProperty property="*" name="memBean"/> 
<jsp:useBean id="memberMgr" class="my.shop.member.MemberManager"/>
<% boolean result = memberMgr.memInsert(memBean); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(result){
	out.println("<b>회원가입을 축하합니다.</b>");
	out.println("<a href='login.jsp'>로그인</a>");
}else{
%>
	out.println("<b>회원가입 실패</b>");
	out.println("<a href='register.jsp'>가입 재시도</a>");
<%
}%>
</body>
</html>