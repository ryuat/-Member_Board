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
<h2 align=center>관리자 모드</h2>
<table align=center>
	<tr>
	<td><a style='text-decoration:none' href="adminlogout.jsp">[로그아웃]</a></td>
	<td><a style="text-decoration: none" href="../index.jsp" >[메인]</a></td>
	<td><a style='text-decoration:none' href="productlist.jsp">[상품목록]</a></td>
	<td><a style='text-decoration:none' href="../board/boardlist.jsp">[게시판]</a></td>
	<td><a style='text-decoration:none; color: red'  href="productmanager.jsp">[상품관리]</a></td>
	<td><a style='text-decoration:none; color: red'  href="ordermanager.jsp">[주문관리]</a></td>
	<td><a style='text-decoration:none; color: red' href="../admin/membermanager.jsp">[회원관리]</a></td>
	</tr>
</table>
</body>
</html>
