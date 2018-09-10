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
				<td>상품명</td>
				<td><input type="text" name="name" value="<%=bean.getName()%>"></td>
			</tr>
			<tr>
				<td>가 격</td>
				<td><input type="text" name="price"value="<%=bean.getPrice()%>"></td>
			</tr>
			<tr>
				<td>설 명</td>
				<td><input type="text" name="detail" value="<%=bean.getDetail() %>"></td>
			</tr>
			<tr>
				<td>수량</td>
				<td><input type="text" name="stock" value="<%=bean.getStock() %>"></td>
			</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td colspan=2><hr></td>
	</tr>
	<tr><td colspan =2 style="text-align: center">
		<br>
		<input  type="button" value="상품목록" id="back" onclick="history.back()">
	</td>
	</tr>

</table>
</body>
</html>