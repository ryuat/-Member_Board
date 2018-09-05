<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="boardMgr" class="my.shop.board.BoardManager"/>
<jsp:useBean id="dto" class="my.shop.board.BoardDto"/>

<%
String num = request.getParameter("num");
String spage = request.getParameter("page");
dto = boardMgr.getReplyData(num);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<h2> ** 댓글 쓰기 ** </h2>
<form action="replysave.jsp" name="frm" method="post">
<input type="hidden" name="num" value="<%=num %>">
<input type="hidden" name="page" value="<%=spage %>">
<input type="hidden" name="gnum" value="<%=dto.getGnum() %>">
<input type="hidden" name="onum" value="<%=dto.getOnum() %>">
<input type="hidden" name="nested" value="<%=dto.getNested() %>">

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
		<td><input type="text" name="title" size="49" value="[Re]:<%= dto.getTitle()%>"></td>
	</tr>
	<tr>
		<td>내  용</td>
		<td><textarea rows="10" cols="50" name="cont"></textarea></td>
	</tr>
	<tr>
		<td colspan="2" style="text-align:center;">
			<input type="button" value="메 인" onclick = "location.href='../index.jsp'">&nbsp;
			<input type="button" value="작 성" onclick = "check()">&nbsp;
			<input type="button" value="목 록" onclick = "location.href='boardlist.jsp?page=<%=spage%>'">&nbsp;
			
		</td>
	</tr>
</table>

</form>
</body>
</html>