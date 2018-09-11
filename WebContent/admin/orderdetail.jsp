<%@page import="my.shop.product.ProductBean"%>
<%@page import="my.shop.product.OrderBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="orderMgr" class="my.shop.product.OrderManager"/>
<jsp:useBean id="productMgr" class="my.shop.product.ProductManager"/>

<%
OrderBean order = orderMgr.getOrderDetail(request.getParameter("no"));
ProductBean product = productMgr.getProduct(order.getProduct_no());

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
<form action="orderproc_admin.jsp" method="post" name="orderDetailFrm">
<table style="margin: 0 auto;">
	<tr>
		<td colspan=2 style="text-align:center; font-size:15px"><b>주문 상세</b>
		
	</tr>
	<tr>
		<td colspan=2><hr></td>
	</tr>
	<tr>
		<td>
			<table>
			<tr>
				<td colspan=2 style="text-align:center; font-size:17px">주문번호:<b><%=order.getNo()%></b><br><br></td>
			</tr>
			<tr>
				<td colspan=2 style="text-align:left;">상품명:<b><%=product.getName()%></b></td>
			</tr>
			<tr>
				
				<td colspan=2>수량:<%=order.getQuantity() %></td>
			</tr>
			<tr>
				
				<td colspan=2>주문일: <%=order.getSdate() %></td>
			</tr>
			<tr>
				
				<td colspan=2><select name="state">
								<option value="1">접수</option>
								<option value="2">입금확인</option>
								<option value="3">배송준비</option>
								<option value="4">배송중</option>
								<option value="5">배송완료</option>
							  </select>			
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
		<input  style=" width:100px ; hegiht:200px" type="button" value="수정" onclick="orderUpdate(this.form)">
		<input  type="button" value="뒤로가기" id="back" onclick="history.back()">
		<input  type="hidden" name="no" value="<%=order.getNo() %>">
		<input  type="hidden" name="flag">
	</td>
	</tr>
</table>
</form>
</body>
</html>