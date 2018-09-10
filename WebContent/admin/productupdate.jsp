<%@page import="my.shop.product.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="productMgr" class="my.shop.product.ProductManager"/>
<%

ProductBean bean = productMgr.getProduct(request.getParameter("no"));

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

<form action="productproc.jsp?flag=update" method="post" enctype="multipart/form-data" > 
<table style="margin: 0 auto;">
	<tr>
		<td><input type="hidden" name="no" value=<%=bean.getNo() %>> </td>
	</tr>
	<tr>
		<td colspan=2 style="text-align:center; font-size:15px; width:479px"><b>상품 수정</b></td>
	</tr>
	<tr>
		<td colspan=2><hr></td>
	</tr>
	<tr>
		<td style="text-align:center"><img src="../data/<%=bean.getImage()%>" width=300></td>
		<td>
			<table>
			<tr>
				<td>이미지</td>
				<td><input type="file" name="image" value="<%=bean.getImage()%>"></td>
			</tr>
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
		<input  type="submit" value="수정완료">
		<input  type="button" value="상품목록" onclick="back()">
	</td>
	</tr>

</table>
</form>

</body>
</html>