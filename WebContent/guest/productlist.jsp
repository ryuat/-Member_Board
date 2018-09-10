<%@page import="my.shop.product.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productMgr" class="my.shop.product.ProductManager"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="guest_top.jsp" %>
<br><br>
<h4 style="text-align:center"> </h4>

<table  style="margin: 0 auto;">
		<tr><td colspan=7 style="text-align: center;  font-size:15px"><b>상품 목록</b></td></tr>
		<!-- <tr><td colspan=6 style="text-align: right;"><input  type="submit" value="상품등록" id="regProd"></td></tr> -->
		<tr><td colspan=7 style="text-align: center"><hr></td></tr>
		<% 
		ArrayList<ProductBean> list = productMgr.getProductAll();
		
		if(list.size() == 0){
			%>
				<tr><td colspan=7 style="text-align:center">등록된 상품이 없습니다.</td></tr>
			<%
		}else{
			%>

			<tr>
			
				<th  style="width:80px; height:40px; text-align: center; font-size:14px;">상품</th>
				<th  style="width:200px; height:40px; font-size:14px; text-align: left;">상품명</th>
				<th  style="width:80px; height:40px; font-size:14px; text-align: left;">가격</th>
				<th  style="width:200px; height:40px; font-size:14px; text-align: center;">등록일</th>
				<th  style="width:80px; height:40px; font-size:14px; text-align: center;">수량</th>
				<th  style="width:80px; height:40px; font-size:14px; text-align: center;">상세</th>
			</tr>
			<tr><td colspan=7><hr></td></tr>
			<%
			for(ProductBean p:list){
				%>
			<tr>
			
		
				<td style="text-align:center"><img src="../data/<%=p.getImage()%>" width=120; height=80></td>
				<td style="text-align: left;">
					<label style="width:80px; height:40px; font-size:14px"><%=p.getName() %></label>
				</td>
				<td>
					<label style="width:80px; height:40px; font-size:14px"><%=p.getPrice() %></label>
				</td>
				<td style="text-align:center;">
					<label style="width:200px; height:40px; font-size:14px;"  ><%=p.getSdate() %></label>
				</td>		
				<td style="text-align:center;">
					<label style="width:80px; height:40px; font-size:14px;"><%=p.getStock() %></label>
				</td>
				<td style="text-align:center;">
					<label style="width:80px; height:40px; font-size:14px;"><a href="productdetail.jsp?no=<%=p.getNo()%>">보기</a></label>
				</td>
			</tr>
			<tr><td colspan=7><hr></td></tr>
				<%
			}
		}
		%>
</table>
</body>
</html>