<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<jsp:useBean id="memberMgr" class="my.shop.member.MemberManager"/>

<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");

int result = memberMgr.loginCheck(id, passwd);
if(result == 0){
	%> <script>alert("아이디가 존재하지 않습니다. 아이디를 확인하세요.");
				location.href="login.jsp";
				loginForm.id.value=<%=id%>;
				loginForm.id.focus();</script> <%
	
}else if(result == 1){
	%>
	<script>alert("비밀번호가 틀렸습니다. 비밀번호를 확인하세요.");
			location.href="login.jsp"</script>
	<%
}else if(result == 2){
	session.setAttribute("idKey", id);

	System.out.println("idKey 세션에 세팅");
	%>
	<script>alert("로그인 성공");
			location.href="../guest/guest_index.jsp"</script>
	<%
	
}

%>