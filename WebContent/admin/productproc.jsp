<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  
<%request.setCharacterEncoding("utf-8"); %> 
<jsp:useBean id="productMgr" class="my.shop.product.ProductManager"/>
<% 

String flag = request.getParameter("flag");

boolean result = false;

if(flag.equals("insert")){
	result = productMgr.insertProduct(request);
}else if(flag.equals("update")){
	result = productMgr.updateProduct(request);
	
}else if(flag.equals("delete")){
	result = productMgr.deleteProduct(request.getParameter("no"));
	
}


if(result){
	%>
	<script>
		alert("정상처리");
		location.href="productmanager.jsp";
	</script>
	<%
}else{
	%>
	<script>
		alert("처리실패");
		location.href="productmanager.jsp";
	</script>
	<%
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