<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = (String)session.getAttribute("idKey");
String admin = (String)session.getAttribute("adminOk");

id = id == null ? admin:id;
if(id == null){
	
}


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="../css/style.css" rel="stylesheet" type=""/>
</head>
<body>
<h2 align=center>관리자 모드</h1>
<table align=center >
	<tr>
	<td><a style='text-decoration:none' href="productlist.jsp">[상품목록]</a></td>
	<td><a style='text-decoration:none' href="cartlist">[장바구니]</a></td>
	<td><a style='text-decoration:none' href="orderlist.jsp">[상품목록]</a></td>
	<td><a style='text-decoration:none' href="../board/boardlist.jsp">[게시판]</a></td>
	</tr>

</table>
</body>
</html>