<%@page import="my.shop.product.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<jsp:useBean id="productMgr" class="my.shop.product.ProductManager"/>
<%
String no =  request.getParameter("no");

ProductBean bean = productMgr.getProduct(no);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/script.js"></script>
<script type="text/javascript">
function backFunc(){
	location.href= "productlist.jsp";
}
</script>
</head>
<body>
<%@include file="guest_top.jsp" %>
<br>
<form action="cartproc.jsp" method="post">
<table style="margin: 0 auto;">
	<tr>
		<td colspan=2 style="text-align:center; font-size:15px"><b>상품 상세</b>
		<input type="hidden" name="product_no" value="<%=no%>"></td>
		
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
				
				<td colspan=2>주문수량:&nbsp;&nbsp;<input type="text" style= "text-align:center" name="quantity" value="1" size="4">
				<br><br>
									 <input  style="width:100px ; hegiht:200px" type="submit" value="장바구니에 담기" name="submitBtn">
				</td>		
			</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan=2><hr></td>
	</tr>
	<tr><td colspan =2 style="text-align: center">
		<br>
		<input  type="button" value="상품목록" id="back" onclick="backFunc()">
	</td>
	</tr>
</table>
</form>
</body>
</html>