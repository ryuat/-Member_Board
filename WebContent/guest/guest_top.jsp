<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="../css/style.css" rel="stylesheet" type=""/>
</head>
<body>
<%

String id = (String)session.getAttribute("idKey");
//String adminOk = (String)session.getAttribute("adminOk");
//id = id ==null ? adminOk:id;
String log ="";
String mem="";

if(id == null){
	log = "<a style='text-decoration:none' href='../member/login.jsp'>[로그인]</a>";
	mem = "<a style='text-decoration:none' href='../member/register.jsp'>[회원가입]</a>";
}else{
	log = "<a style='text-decoration:none' href='../member/logout.jsp'>[로그아웃]</a>";
	mem = "<a style='text-decoration:none' href='../member/memberupdate.jsp'>[회원수정]</a>";
}

%>
<table align=center >
	<tr>
	<td><%=log%></td>
	<td><%=mem%></td>
	<td><a style='text-decoration:none' href="productlist.jsp">[상품목록]</a></td>
	<td><a style='text-decoration:none' href="cartlist">[장바구니]</a></td>
	<td><a style='text-decoration:none' href="orderlist.jsp">[상품목록]</a></td>
	<td><a style='text-decoration:none' href="../board/boardlist.jsp">[게시판]</a></td>
	</tr>

</table>
</body>
</html>
