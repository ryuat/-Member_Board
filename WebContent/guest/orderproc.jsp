<%@page import="my.shop.product.ProductBean"%>
<%@page import="my.shop.product.OrderBean"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cartMgr" class="my.shop.product.CartManager" scope="session"/>
<jsp:useBean id="orderMgr" class="my.shop.product.OrderManager" />
<jsp:useBean id="productMgr" class="my.shop.product.ProductManager" />


<%
Hashtable hCart = cartMgr.getCartList();


if(hCart.size() == 0){
	%>
	<script>
		alert("선택한 상품이 없습니다.");
		location.href="orderlist.jsp";
	</script>
	
	<%
}else{
	Enumeration enu = hCart.keys();
	while(enu.hasMoreElements()){ // 
		OrderBean order = (OrderBean)hCart.get(enu.nextElement());
		orderMgr.insertOrder(order); // 주문 테이블에 insert
		productMgr.reduceProduct(order); // 주문수량만큼 재고수량 감소
		cartMgr.deleteCart(order); // 장바구니에서 제거
	}
	
	%> <script>location.href="orderlist.jsp";</script><%
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