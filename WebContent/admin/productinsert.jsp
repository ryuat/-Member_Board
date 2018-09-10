<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

window.onload = function(){
	
}
</script>
</head>
<body>
<%@include file="admin_top.jsp" %>
<br><br>


<form action="productproc.jsp?flag=insert" enctype="multipart/form-data" method="post">

<table style="margin: 0 auto;">
	<tr>
		<td colspan=2 style="text-align:center; font-size:15px"><b>상품 등록</b></td>
	</tr>
	<tr>
		<td colspan=2><hr></td>
	</tr>
	<tr>
		<td>상품명</td>
		<td><input type="text" name="name"></td>
	</tr>
	
	<tr>
		<td>가 격</td>
		<td><input type="text" name="price"></td>
	</tr>
	<tr>
		<td>설 명</td>
		<td><input type="text" name="detail"></td>
	</tr>
	<tr>
		<td>수량</td>
		<td><input type="text" name="stock"></td>
	</tr>
	<tr>
		<td>이미지</td>
		<td colspan=2><input type="file" name="image"></td>
	</tr>
	<tr>
		<td colspan=2><hr></td>
	</tr>
	<tr><td colspan =2 style="text-align: center">
		<br>
		<input  type="submit" value="상품등록" id="regProd">
		<input  type="button" value="상품목록" id="back" onclick="history.back()">
	</td>
	</tr>

</table>
</form>

</body>
</html>