<%@page import="my.shop.member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberMgr" class="my.shop.member.MemberManager"/>


<% 
request.setCharacterEncoding("utf-8");
String id = (String)session.getAttribute("idKey");
String admin = (String)session.getAttribute("adminOk");
MemberBean bean = memberMgr.getMember(id);
if(admin != null){
	%>
	<script>alert("관리자로 접속 중입니다.");
			location.href="../guest/guest_index.jsp";</script>
	<%
	return;
}
if(bean == null){
	response.sendRedirect("../guest/guest_index.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/script.js"></script>
<script>
window.onload = function(){
	document.getElementById("btnSubmit").onclick = memUpdateFunc;
	document.getElementById("btnDel").onclick = memDelFunc;
	document.getElementById("btnCancel").onclick = memCancelFunc;
}

</script>
</head>

<body>
	<br>
	<table align=center class="table">
		<tr>
			<td align="center" valign="middle" style="background-color: ">
				<form name="regForm" method="post" action="memberupdateproc.jsp">
					<table border="1">
						<tr align="center" style="background-color: grey">
							<td colspan="2"><b style="color: white">회원수정</b></td>
						</tr>
						<tr>
							<td width="16%">아이디</td>
							<td width="57%"><input style="background-color: lightgrey" type="text" readonly name="id" size="15" value=<%=bean.getId()%>></td>
						</tr>
						<tr>
							<td>패스워드</td>
							<td><input style="background-color: lightgrey" type="password" name="passwd"  readonly size="15" value="<%=bean.getPasswd()%>"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="name" size="15" value=<%=bean.getName()%>></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="text" name="email" size="27" value=<%=bean.getEmail()%>></td>						</tr>
						<tr>
							<td>전화번호</td>
							<td><input type="text" name="phone" size="20" value=<%=bean.getPhone()%>></td>
						</tr>
						<tr>
							<td>우편번호</td>
							<td><input type="text" name="zipcode" size="7" value=<%=bean.getZipcode()%>> <input
								type="button" value="우편번호찾기" id="btnZip"></td>
						</tr>
						<tr>
							<td>주소</td>
							<td><input type="text" name="address" size="60"  value=<%=bean.getAddress()%>></td>
						</tr>
						<tr>
							<td>직업</td>
							<td><select name=job>
									<option value="<%=bean.getJob()%>"><%=bean.getJob()%></option>
									<option value="회사원">회사원
									<option value="학생">학생
									<option value="자영업">자영업
									<option value="주부">주부 
									<option value="기타">기타
							</select></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
							<input type="button" style="hegiht:80px; width:500px; color: white; background-color: rgb(0, 0, 0);" value="수정" id="btnSubmit"><br> 
						    <input type="button" style="hegiht:80px; width:500px; color: white; background-color: rgb(0, 0, 0);" value="회원탈퇴" id="btnDel"><br>
						      <input type="button" style="hegiht:80px; width:500px; color: white; background-color: rgb(0, 0, 0);" value="수정취소" id="btnCancel"></td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>