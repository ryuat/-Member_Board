<%@page import="my.shop.product.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<jsp:useBean id="productMgr" class="my.shop.product.ProductManager"/>
<%
String no =  request.getParameter("no");
System.out.println("no: "  + no);
ProductBean bean = productMgr.getProduct(no);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/script.js"></script>
</head>
<body>
<%@include file="admin_top.jsp" %>
<br>
<table style="margin: 0 auto;">

	<tr>
		<td colspan=2 style="text-align:center; font-size:15px"><b>상품 상세</b></td>
	</tr>
	<tr>
		<td colspan=2><hr></td>
	</tr>
	<tr>
		<td style="text-align:center"><img src="../data/<%=bean.getImage()%>" width=300></td>
		<td>
			<table>
			<tr>
				<td colspan=2 style="text-align:center; font-size:17px"><b><%=bean.getName()%></b><br><br></td>
			</tr>
			<tr>
				<td colspan=2 style="text-align:left; color:red;"><b><%=bean.getPrice()%>원</b></td>
			</tr>
			<tr>
				
				<td colspan=2><%=bean.getDetail() %></td>
			</tr>
			<tr>
				
				<td colspan=2><%=bean.getStock() %></td>
			</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td colspan=2><hr></td>
	</tr>
	<tr><td colspan =2 style="text-align: center">
		<br>
		<input  type="button" value="수정" id="prodUpd" onclick="productUpdate('<%=bean.getNo()%>')">
		<input  type="button" value="삭제" id="prodDel" onclick="productDelete('<%=bean.getNo()%>')">
		<input  type="button" value="상품목록" id="back" onclick="back()">
	</td>
	</tr>

</table>

<form action="productproc.jsp?flag=delete" name="delFrm" method="post">

</form>

</body>
</html>