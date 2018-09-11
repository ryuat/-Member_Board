<%@page import="my.shop.product.ProductBean"%>
<%@page import="my.shop.product.OrderBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="orderMgr" class="my.shop.product.OrderManager"></jsp:useBean>
<jsp:useBean id="productMgr" class="my.shop.product.ProductManager"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="guest_top.jsp" %>

<table  style="margin: 0 auto;">
		<tr><td colspan=5 style="text-align: center;  font-size:15px"><b>주문 목록</b></td></tr>
		<!-- <tr><td colspan=6 style="text-align: right;"><input  type="submit" value="상품등록" id="regProd"></td></tr> -->
		<tr><td colspan=5 style="text-align: center"><hr></td></tr>
		<% 
		

		id = (String)session.getAttribute("idKey");
		
		ArrayList<OrderBean> list = orderMgr.getOrder(id);
		
		
		if(list.size() == 0){
			%>
				<tr><td colspan=5 style="text-align:center">주문내역이 없습니다.</td></tr>
			<%
		}else{
			
			%>
			<tr>
			
				<th  style="width:80px; height:40px; text-align: left; font-size:14px;">주문번호</th>
				<th  style="width:200px; height:40px; font-size:14px; text-align: left;">상품명</th>
				<th  style="width:80px; height:40px; font-size:14px; text-align: center;">주문 수</th>
				<th  style="width:200px; height:40px; font-size:14px; text-align: center;">주문일</th>
				<th  style="width:80px; height:40px; font-size:14px; text-align: center;">주문상태</th>
			</tr>
			<tr><td colspan=5><hr></td></tr>
			<%
			for(int i=0;i<list.size();i++){ // 각 주문의 정보를 가져온다.
				OrderBean order = list.get(i);
				ProductBean product = productMgr.getProduct(order.getProduct_no());
				%>
					<tr>
						<td style="text-align: left;">
							<label style="width:80px; height:40px; font-size:14px"><%=order.getNo() %></label>
						</td>
						<td style="text-align: left;">
							<label style="width:80px; height:40px; font-size:14px"><%=product.getName() %></label>
						</td>
						<td style="text-align:center;">
							<label style="width:80px; height:40px; font-size:14px"><%=order.getQuantity()%></label>
							<!-- <input type="text" style= "text-align:center" name="quantity" value="<%=order.getQuantity()%>" size="4"> -->
						</td>	
						<td style="text-align:center;">
							<label style="width:80px; height:40px; font-size:14px"><%=order.getSdate()%></label>
						</td>	
						<!-- 
						<td style="text-align:center;">
							<input  type="button" value="수정" id="upBtn" text-align="center" size="4" onclick="cartUpdate(this.form)">
							<input  type="button" value="삭제" id="delBtn" onclick="cartDelete(this.form)">
						</td> -->
						<td style="text-align:center;">
						<%
						switch(Integer.parseInt(order.getState())){
						case 1: out.println("접수"); break;
						case 2: out.println("입금확인"); break;
						case 3: out.println("배송준비"); break;
						case 4: out.println("처리완료"); break;
						default: out.println("접수중"); 
						}
						//	<label style="width:80px; height:40px; font-size:14px;"><%=order.getState()"></label>

						%>
						</td>
					</tr>
			<%		
			}
			%>
			<tr><td colspan=5><hr></td></tr>
			<%
		}
		%>
</table>
</body>
</html>