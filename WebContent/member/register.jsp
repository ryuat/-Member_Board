<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<title>회원가입</title>
<!-- 
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link href="../css/style.css" rel="stylesheet" type="text/css">
 -->
<script src="../js/script.js"></script>
<script type="text/javascript">

window.onload = function(){
	regForm.id.focus();
	document.getElementById("btnZip").onclick = zipCheck;
	document.getElementById("btnId").onclick = idCheck;
	document.getElementById("btnLogin").onclick = inputCheck;
}
</script>
</head>

<body>
<h2 align="center">SIGN UP</h2>
	<hr style="width:518px">
<form name="regForm" method="post" action="registerproc.jsp">
	<table style="margin: 0 auto;">
		<tr>
			<td>
				<label style="width:80px; height:40px; font-size:14px">아이디</label>
			</td>
			<td>
				<input style="width:300px; height:30px;" type="text" name="id" >
				<input style="width:95px; height:35px; outline:0; background-color: white" type="button" value="ID중복확인" id="btnId">
			</td>
		<td/></tr>
		<tr><td>
				<label style="width:80px; height:40px; font-size:14px">비밀번호</label>&nbsp;&nbsp;&nbsp;&nbsp; 
			</td>
			<td>
			<input style="width:400px; height:30px;" type="text" name="passwd" >
			</td>
		<tr><td>
				<label style="width:80px; height:40px; font-size:14px">비밀번호 확인</label>&nbsp;&nbsp;&nbsp;&nbsp; 
			</td>
			<td>
				<input style="width:400px; height:30px;" type="text" name="repasswd" >
			<td/>
		</tr>
		<tr><td>
				<label style="width:80px; height:40px; font-size:14px">이름</label>&nbsp;&nbsp;&nbsp;&nbsp; 
			</td>
			<td>
				<input style="width:400px; height:30px;" type="text" name="name" >
			<td/>
		</tr>
		<tr><td colspan=2 style="text-align:center"><br>선택 입력<br><hr style="width:520px; border-style:dotted;"></td>
		<tr><td>
				<label style="width:80px; height:40px; font-size:14px">이메일</label>&nbsp;&nbsp;&nbsp;&nbsp; 
			</td>
			<td>
				<input style="width:400px; height:30px;" type="text" name="email" >
			<td/>
		</tr>
		<tr><td>
				<label style="width:80px; height:40px; font-size:14px">휴대전화</label>&nbsp;&nbsp;&nbsp;&nbsp; 
			</td>
			<td>
				<input style="width:400px; height:30px;" type="text" name="phone" >
			<td/>
		</tr>
		<tr><td>
				<label style="width:80px; height:40px; font-size:14px">주소</label>&nbsp;&nbsp;&nbsp;&nbsp; 
			</td>
			<td>
				<input style="width:95px; height:30px;" type="text" name="zipcode">
				<input style="width:195px; height:30px;" type="text" name="address" >
				<input style="width:95px; height:35px; background-color: white"
								type="button" value="우편번호찾기" id="btnZip">
			<td/>
		</tr>
		<tr><td>
				<label style="width:80px; height:40px; font-size:14px">직업</label>&nbsp;&nbsp;&nbsp;&nbsp; 
			</td>
			<td><select style="width:403px; height:35px;" name=job>
									<option value="0">선택하세요
									<option value="회사원">회사원
									<option value="학생">학생
									<option value="자영업">자영업
									<option value="주부">주부 
									<option value="기타">기타
				</select>
			<td/>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<br>
				<input style=" font-weight: bold; border:0; outline:0; width:518px; height:40px; font-size:17px; color:white; background-color:rgb(0,0,0)" 
						type="button" value="회원가입" id="btnLogin"> <br> 
			</td>
		</tr>
	</table>	

	<br>
</form>
</body>
</html>