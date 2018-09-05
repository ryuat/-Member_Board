<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="boardMgr" class="my.shop.board.BoardManager"/>
<jsp:useBean id="dto" class="my.shop.board.BoardDto"/>
<% request.setCharacterEncoding("utf-8"); %>
<%

String num = request.getParameter("num");
String spage = request.getParameter("page");
dto = boardMgr.getData(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/board.css">
<script type="text/javascript">
window.onload = function(){
}
function check(){
	if(frm.pass.value === ""){
		frm.pass.focus();
		alert("비밀번호를 입력하세요.");
		return;
	}

	if(confirm("정말 수정할까요?")){
		frm.submit();
	}
}
</script>
</head>
<body>
<h2>** 게시글 수정 **</h2>
<form action="editsave.jsp" name="frm" method="post">
<input type="hidden" name="num" value="<%=num%>">
<input type="hidden" name="page" value="<%=spage%>">


<table border="1">
	<tr>
		<td>작성자</td>
		<td><input type="text" name="name" size="15" value="<%=dto.getName()%>"></td>
	</tr>
	<tr>
		<td>암  호</td>
		<td><input type="password" name="pass" size="15" ></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="text" name="mail" size="25" value="<%=dto.getMail()%>"></td>
	</tr>
	<tr>
		<td>제  목</td>
		<td><input type="text" name="title" size="49" value="<%=dto.getTitle() %>"></td>
	</tr>
	<tr>
		<td>내  용</td>
		<td><textarea rows="10" cols="50" name="cont"><%=dto.getCont()%></textarea></td>
	</tr>
	<tr>
		<td colspan="2" style="text-align:center;">
			<input type="button" value="수 정" onclick = "check()">&nbsp;
			<input type="button" value="목 록" onclick = "location.href='boardlist.jsp?page=<%=spage%>'">&nbsp;
		</td>
	</tr>
</table>
</form>
</body>
</html>