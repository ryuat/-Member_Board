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
<link href="../css/style.css" rel="stylesheet" type="text/css">-->
<script src="../js/script.js"></script>
<script type="text/javascript">

window.onload = function(){
	regForm.id.focus();
	document.getElementById("btnZip").onclick = zipCheck;
	document.getElementById("btnId").onclick = idCheck;
	document.getElementById("btnSubmit").onclick = inputCheck;
}
</script>
</head>

<body>
	<h2 align="center">SIGIN UP</h2>
	<hr style="width:518px">
	<table align="center">
		<tr>
			<td>
				<label style="width:80px; height:40px; font-size:14px">아이디</label>&nbsp;&nbsp;&nbsp;&nbsp; 
			</td>
			<td>
				<input style="width:400px; height:30px;" type="text" name="id" >
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
		<tr><td colspan=2 style="text-align:center"><br>선택 입력<br><hr style="width:518px; border-style:dotted;"></td></td>
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
				<input style="width:300px; height:30px;" type="text" name="address" >
				<input style="width:95px; height:35px;"
								type="button" value="우편번호찾기" id="btnZip">
			<td/>
		</tr>
		<tr><td>
				<label style="width:80px; height:40px; font-size:14px">직업</label>&nbsp;&nbsp;&nbsp;&nbsp; 
			</td>
			<td><select style="width:400px; height:40px;" name=job>
									<option value="0">선택하세요
									<option value="회사원">회사원
									<option value="학생">학생
									<option value="자영업">자영업
									<option value="주부">주부 
									<option value="기타">기타
				</select>
			<td/>
		</tr>
	</table>	
	</ul>
	<br>
	<table class="table">
		<tr>
			<td align="center" valign="middle" style="background-color: ">
				<form name="regForm" method="post" action="registerproc.jsp">
					<table border="1">
						<tr align="center" style="background-color: grey">
							<td colspan="2"><b style="color: white">회원가입</b></td>
						</tr>
						<tr>
							<td style="width:80px; height:40px">아이디</td>
							<td width="57%"><input type="text" name="id" size="15">
								<input type="button" value="ID중복확인" id="btnId"></td>
						</tr>
						<tr>
							<td>패스워드</td>
							<td><input type="password" name="passwd" size="15"></td>
						</tr>
						<tr>
							<td>패스워드 확인</td>
							<td><input type="password" name="repasswd" size="15"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="name" size="15"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="text" name="email" size="27"></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><input type="text" name="phone" size="20"></td>
						</tr>
						<tr>
							<td>우편번호</td>
							<td><input type="text" name="zipcode" size="7"> <input
								type="button" value="우편번호찾기" id="btnZip"></td>
						</tr>
						<tr>
							<td>주소</td>
							<td><input type="text" name="address" size="60"></td>
						</tr>
						<tr>
							<td>직업</td>
							<td><select name=job>
									<option value="0">선택하세요
									<option value="회사원">회사원
									<option value="학생">학생
									<option value="자영업">자영업
									<option value="주부">주부 
									<option value="기타">기타
							</select></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="button"
								value="회원가입" id="btnSubmit"> &nbsp;&nbsp;&nbsp;&nbsp; <input
								type="reset" value="다시쓰기"></td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>