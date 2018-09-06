<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/board.css">
<script>

function check(){

	if(frm.id.value == "" || frm.pwd.value==""){
		alert("비밀번호를 입력하세요.");
		return;
	}

	
	frm.submit();
	
}
</script>
</head>
<body>

<form action="adminlogin.jsp" name="frm" method="post">
<table>
	<tr>
		<td>
		<%String sessionValue = (String)session.getAttribute("adminOk");
			if(sessionValue != null){
		%>
			이미 로그인했습니다.<br><br>		
			[<a href="adminlogout.jsp" onclick="check()">로그아웃</a>]
			[<a href="#" onclick="javascript:window.close()">창닫기</a>]
		<% 
			}else{
						
		%>
			<table style="width:100%">
				<tr>
					<td>I D: <input type="text" name="id"></td>
				</tr>
				<tr>
					<td>PWD: <input type="password" name="pwd"></td>
				</tr>
				<tr>
					<td>
						[<a href="#" onclick="check()">로그인</a>]
						[<a href="#" onclick="javascript:window.close()">창닫기</a>]
				</tr>
			</table>	
		<%
			}
		%>
			
		</td>
	</tr>
</table>

</form>
</body>
</html>