<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" type="text/css" href="../css/board.css">
<script type="text/javascript">
function check(){
	if(frm.name.value == ""){
		alert("작성자의 이름을 입력하세요.");
		frm.name.focus();
		return;
	}
	if(frm.pass.value == ""){
		alert("암호를 입력하세요.");
		frm.pass.focus()
		return;
	}if(frm.mail.value == ""){
		alert("메일을 입력하세요."); 
		frm.mail.focus()
		return;
	}
	frm.submit();
}
</script>
</head>
<body>
<h2>새 글 작성</h2>
<form action="boardsave.jsp" name="frm" method="post">
<table border="1">
	<tr>
		<td>작성자</td>
		<td><input type="text" name="name" size="15" ></td>
	</tr>
	<tr>
		<td>암  호</td>
		<td><input type="password" name="pass" size="15" ></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="text" name="mail" size="25" ></td>
	</tr>
	<tr>
		<td>제  목</td>
		<td><input type="text" name="title" size="49" ></td>
	</tr>
	<tr>
		<td>내  용</td>
		<td><textarea rows="10" cols="50" name="cont"></textarea></td>
	</tr>
	<tr>
		<td colspan="2" style="text-align:center;">
			<input type="button" value="메 인" onclick = "location.href='../index.jsp'">&nbsp;
			<input type="button" value="작 성" onclick = "check()">&nbsp;
			<input type="button" value="목 록" onclick = "location.href='boardlist.jsp'">&nbsp;
		</td>
	</tr>
</table>
</form>
</body>
</html>