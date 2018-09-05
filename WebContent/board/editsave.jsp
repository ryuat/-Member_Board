<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
 <jsp:useBean id="bean" class="my.shop.board.BoardBean"/>
<jsp:setProperty property="*" name="bean"/>
<jsp:useBean id="boardMgr" class="my.shop.board.BoardManager"/>

<%

String spage = request.getParameter("page");
System.out.println(bean.getNum() + " " + bean.getPass());
boolean res = boardMgr.checkPass(bean.getNum(), bean.getPass());
if(res){
	boardMgr.editData(bean);
	response.sendRedirect("boardlist.jsp?page=" + spage);
	
}else{
	%>
	<script>alert("비밀번호 불일치"); 
			history.back();
	</script>
	<%
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>