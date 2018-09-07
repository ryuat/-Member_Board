<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String id = (String)session.getAttribute("idKey");
String adminOk = (String)session.getAttribute("adminOk");
id = id ==null ? adminOk:id;
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/script.js"></script>
<script type="text/javascript">
window.onload = function(){
	document.getElementById("btnLogin").addEventListener("click", funcLogin, false);
	//document.getElementById("btnNewMember").addEventListener("click", funcNew, false);
}
function funcLogin(){
	if(loginForm.id.value === "" ){
		loginForm.id.focus();
		alert("아이디를 입력하세요.");
		return;
	}
	if(loginForm.passwd.value === "" ){
		loginForm.passwd.focus();
		alert("비밀번호를 입력하세요.");
		return;	
	}
	
	loginForm.action = "loginproc.jsp";
	loginForm.method = "post";
	loginForm.submit();
}

//function funcNew(){
//	location.href = "register.jsp";
//}

</script>
<!-- <link rel="stylesheet" type="text/css" href="../css/board.css"> -->
</head>
<body>
<%
if(id != null ){
%>
	<b><%=id %>님 환영합니다</b><p/>
	준비된 기능을 사용할 수 있습니다<br>
	<a href="logout.jsp">로그아웃</a>
<%	
}else{
%>	
<h2 align=center>로그인</h2>&nbsp;&nbsp;&nbsp;&nbsp; 
<form action="" name=loginForm>
	<table style="margin: 0 auto;">
		<tr>
			<td colspan=2 style="text-align:center">
				<hr style="width:518px">
			</td>
		</tr>
		<tr>
			<td>
				<label style="width:80px; height:40px; font-size:14px">아이디</label>&nbsp;&nbsp; 
			</td>
			<td>
				<input style="width:400px; height:30px;" type="text" name="id" >
			</td>
		</tr>
		<tr>
			<td>
				<label style="width:80px; height:40px; font-size:14px">비밀번호</label>&nbsp;&nbsp; 
			</td>
			<td>
				<input style="width:400px; height:30px;" type="password" name="passwd" >
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<br>
				<input style="width:518px; height:30px;" type="button"	value="로그인" id="btnLogin"> <br> 
			</td>
		</tr>
	</table>	
	</form>
<%}
%>
</body>
</html>