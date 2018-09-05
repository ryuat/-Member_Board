<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="memberMgr" class="my.shop.member.MemberManager"/>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
boolean result = memberMgr.checkId(id);
System.out.println(result);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="../js/script.js"></script>
</head>
<body>

<%if(result) 
{	
%>

	<b style="color: red"><%=id%>는(은) 이미 사용 중인 ID입니다.</b><p>
	<input type="button" onclick="opener.document.regForm.id.value='';opener.document.regForm.id.focus(); window.close();" value="닫기">
<%
}else{
%>
	<b><%=id%>는(은) 사용할 수 있는 아이디입니다.</b><p>
	<input type="button" onclick="opener.document.regForm.id.value=<%=id%>; window.close();" value="사용">
	<input type="button" onclick="opener.document.regForm.id.value='';opener.document.regForm.id.focus(); window.close();" value="다시입력">
<%}

%>
</body>
</html>