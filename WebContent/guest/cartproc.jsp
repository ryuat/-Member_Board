<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cartMgr" class="my.shop.product.CartManager" scope="session"/>
<jsp:useBean id="order" class="my.shop.product.OrderBean"/>
<jsp:setProperty property="*" name="order"/>

<%//System.out.println("cartproc.jsp 내 carMgr 주소: " + cartMgr);
	System.out.println("getprod 넘어온 값 : "+ request.getParameter("product_no"));%>
<% 
String flag = request.getParameter("flag");
String id = (String)session.getAttribute("idKey");

if(id == null){
	response.sendRedirect("../member/login.jsp");
}else{
	if(flag == null){
		// cart 주문에 담기
		order.setId(id);		
		cartMgr.addCart(order);
		System.out.println("cartporc.jsp : order 주소:" + order);
	%>
		<script>
			location.href = "cartlist.jsp";
		</script>
	
	<%
	}else if(flag.equals("update")){
		order.setId(id);
		//System.out.println("cartproc.jsp order: " + order);
		cartMgr.updateCart(order);
		System.out.println("cartporc.jsp : order 주소:" + order);
		System.out.println("수정완료");
		%>
		<script>location.href="cartlist.jsp";</script>
		<%
	}else if(flag.equals("delete")){
		order.setId(id);
		cartMgr.deleteCart(order);
		%>
		<script>location.href="cartlist.jsp"</script>
		<%
	}
	
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