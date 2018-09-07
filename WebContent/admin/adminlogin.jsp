<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload= function(){
	
	document.getElementById("btnLogin").onclick = funcAdminLogin;
}
function funcAdminLogin(){
	if(adminloginForm.id.value==""){
		alert("아이디를 입력하세요.");
		adminloginForm.id.getfoucs();
		return;
	}
	if(adminloginForm.passwd.value==""){
		alert("비밀번호를 입력하세요.");
		adminloginForm.passwd.getfoucs();
		return;
	}
	
	adminloginForm.submit();
	
}
</script>
</head>
<%
//String id = request.getParameter("id");
//String pwd = request.getParameter("pwd");

//if(id.equals("admin") && pwd.equals("aaa")){
	//session.setAttribute("adminOk", id);
	//out.println("로그인성공<br>");
//}else{
	//out.println("로그인실패<br>");
//}
%>
<body>
<h2 align=center>관리자 로그인</h2>&nbsp;&nbsp;&nbsp;&nbsp; 
<hr style="width:490px">
<form action="adminloginproc.jsp" name="adminloginForm" method="post">
<table style="margin: 0 auto;">
		<tr>
			<td colspan=2 style="text-align:center">
			
			</td>
		</tr>
		
		<tr>
			<td>
				<label style="width:80px; height:40px; font-size:14px">아이디</label>&nbsp;&nbsp;&nbsp;&nbsp; 
			</td>
			<td>
				<input style="width:400px; height:30px;" type="text" name="id" >
			</td>
		<td/></tr>
		<tr>
			<td>
				<label style="width:80px; height:40px; font-size:14px">비밀번호</label>&nbsp;&nbsp;&nbsp;&nbsp; 
			</td>
			<td>
				<input style="width:400px; height:30px;" type="text" name="passwd" >
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

</body>
</html>