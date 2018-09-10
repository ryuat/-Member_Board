<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
 <% request.setCharacterEncoding("utf-8"); %>
 <jsp:useBean id="bean" class="my.shop.member.MemberBean"/>
 <jsp:setProperty property="*" name="bean"/>
 <jsp:useBean id="memberMgr" class="my.shop.member.MemberManager"/>

<%

boolean result = memberMgr.memberUpdate(bean, bean.getId());

if(result){
	
	%>
	<script>
	
	alert("수정성공");
	location.href="membermanager.jsp";
	</script>
	<%
}else{

	%>
	<script>
	
	alert("수정실패 관리자에게 문의");
	location.href="memberupdate2.jsp";
	</script>
	<%
}

%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>