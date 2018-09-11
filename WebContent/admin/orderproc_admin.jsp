<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="orderMgr" class="my.shop.product.OrderManager"/>

<%
String flag = request.getParameter("flag");
String no = request.getParameter("no");
String state = request.getParameter("state");


if(flag.equals("update")){
	boolean result = false;
	result = orderMgr.updateState(no, state);
	if(result){
		%>
		<script>
			alert("정상처리")
			location.href = "ordermanager.jsp";
		</script>
	    <%
	}else{
		%>
		<script>
			alert("수정 처리실패")
			location.href = "ordermanager.jsp";
 		</script>
	    <%
	}

}else if(flag.equals("delete")){
		
}else{
	response.sendRedirect("ordermanager.jsp");
}
%>