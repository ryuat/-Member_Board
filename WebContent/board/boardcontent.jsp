<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="boardMgr" class="my.shop.board.BoardManager"/>
<jsp:useBean id="dto" class="my.shop.board.BoardDto"></jsp:useBean>
<% 
String num = request.getParameter("num");
String spage = request.getParameter("page");

boardMgr.updateReadCnt(num); // 조회수 증가
dto = boardMgr.getData(num); // 해당 자료 읽기

String name = dto.getName();
String pass = dto.getPass();
String mail = dto.getMail();
String title = dto.getTitle();
String cont = dto.getCont();
String bip = dto.getBip();
String bdate = dto.getBdate();
int readcnt = dto.getReadcnt();

String apass = "*****";
String adminOk = (String)session.getAttribute("adminOk");
if(adminOk != null){
	if(adminOk.equals("admin")){
		apass = pass;
	}
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판-상세보기</title>
<link rel="stylesheet" type="text/css" href="../css/board.css">
<script type="text/javascript">
function passCheck(){
	var inputPass = prompt("비밀번호를 입력하세요.");
	if(inputPass == null) {
		return;
	}
	if(inputPass == ""){
		alert("비밀번호를 입력하세요.");
		return;
	}
	
	if(inputPass ==<%=pass%>){
		if(confirm("정말 삭제하겠습니까?"))
			location.href = "delete.jsp?num=<%=num %>&page=<%=spage%>";
		<%--<% boardMgr.deleteData(num); %>--%>
	}else{
		alert("비밀번호가 틀립니다.")
		return;
	}
}
</script>
</head>
<body>
<table>
	<tr>
		<td><b>비밀번호:<%= apass%></b></td>
		<td colspan=2 style="text-align:right"><a href="reply.jsp?num=<%=num %>&page=<%=spage%>"><img src="../images/reply.gif"></a>
			<a href="edit.jsp?num=<%=num %>&page=<%=spage%>"><img src="../images/edit.gif"></a>
			<a href="#" onclick="passCheck()"><img src="../images/del.gif"></a>
			<a href="boardlist.jsp?page=<%=spage%>"><img src="../images/list.gif"></a>
			</td>
	</tr>
	
	<tr>
		<td>작성자: <a href="mailto:><%=mail%>"><%=name %></a>(ip: <%=bip %>)</td>
		<td>작성일: <%=bdate %></td>
		<td>조회수: <%=readcnt %></td>
	</tr>
	<tr>
		<td colspan="3" style="background-color:lightGrey"><b>제목: <%=title %></b></td>
	</tr>
	<tr>
		<td colspan="3"><textarea rows=10 cols=125 readonly><%=cont %></textarea></td>
	</tr>
</table>

</body>
</html>