<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");
%>    
<jsp:useBean id="memberMgr" class="my.shop.member.MemberManager"/>    
<jsp:useBean id="bean" class="my.shop.member.MemberBean"/>
<jsp:setProperty property="*" name="bean"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

String id = (String)session.getAttribute("idKey");
boolean result = memberMgr.memberUpdate(bean, id);
if(result){
%>
	<script>alert("수정 성공");
			location.href="../guest/guest_index.jsp"</script>
<%
}else{
	%>
	<script>alert("수정 실패");
	history.back();</script>
<%}
%>
</body>
</html>