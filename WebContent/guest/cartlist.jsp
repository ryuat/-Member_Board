<%@page import="my.shop.product.ProductBean"%>
<%@page import="my.shop.product.OrderBean"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cartMgr" class="my.shop.product.CartManager" scope="session"/>
<jsp:useBean id="productMgr" class="my.shop.product.ProductManager"/>
<%//System.out.println("cartlist.jsp 내 carMgr 주소: " + cartMgr); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
<script src="../js/script.js"></script>
</head>
<body>
<%@ include file="guest_top.jsp" %>

<table  style="margin: 0 auto;">
		<tr><td colspan=5 style="text-align: center;  font-size:15px"><b>상품 목록</b></td></tr>
		<!-- <tr><td colspan=6 style="text-align: right;"><input  type="submit" value="상품등록" id="regProd"></td></tr> -->
		<tr><td colspan=5 style="text-align: center"><hr></td></tr>
		<% 
		int totalPrice =0;
		Hashtable hCart = cartMgr.getCartList();
	
		
		if(hCart.size() == 0){
			%>
				<tr><td colspan=7 style="text-align:center">장바구니가 비었습니다.</td></tr>
			<%
		}else{
			
			%>
			<tr>
			
				<th  style="width:200px; height:40px; text-align: left; font-size:14px;">상품명</th>
				<th  style="width:80px; height:40px; font-size:14px; text-align: left;">소계</th>
				<th  style="width:80px; height:40px; font-size:14px; text-align: center;">수량</th>
				<th  style="width:200px; height:40px; font-size:14px; text-align: center;">수정/삭제</th>
				<th  style="width:80px; height:40px; font-size:14px; text-align: center;">상세보기</th>
			</tr>
			<tr><td colspan=5><hr></td></tr>
			<%
			Enumeration enu = hCart.keys();
			while(enu.hasMoreElements()){ // 각 주문의 정보를 가져온다.
				OrderBean order = (OrderBean)hCart.get(enu.nextElement());
				ProductBean product = productMgr.getProduct(order.getProduct_no());
				
				int price = Integer.parseInt(product.getPrice());
				System.out.println("cartlist.jsp order 주소:" + order);
				System.out.println("order 수량:" + order.getQuantity() );
				
				int quantity = Integer.parseInt(order.getQuantity());
				int subTotal = price * quantity;
				totalPrice += subTotal;
				%>
				  <form action ="cartproc.jsp" method="post">
					<input type="hidden" name="flag">
					<input type="hidden" name="product_no" value="<%=product.getNo()%>">
					
					<tr>
						<td style="text-align: left;">
							<label style="width:80px; height:40px; font-size:14px"><%=product.getName() %></label>
						</td>
						<td>
							<label style="width:80px; height:40px; font-size:14px"><%=subTotal %></label>
						</td>
						<td style="text-align:center;">
							<input type="text" style= "text-align:center" name="quantity" value="<%=quantity%>" size="4">
						</td>		
						<td style="text-align:center;">
							<input  type="button" value="수정" id="upBtn" text-align="center" size="4" onclick="cartUpdate(this.form)">
							<input  type="button" value="삭제" id="delBtn" onclick="cartDelete(this.form)">
						</td>
						<td style="text-align:center;">
							<label style="width:80px; height:40px; font-size:14px;"><a href="productdetail.jsp?no=<%=product.getNo()%>">상세보기</a></label>
						</td>
					</tr>
				  </form>
			<%		
			}
			%>
			<tr><td colspan=5><hr></td></tr>
			<tr><td colspan=5 style="text-align:right;">
						<input  type="button" value="주문" id="upBtn" text-align="center" size="4" onclick="orderFunc()">
						<input  type="button" value="상품목록" id="upBtn" text-align="center" size="4" onclick="history.back()">
				</td>
			</tr>
			
			<%
		}
		%>
</table>
</body>
</html>