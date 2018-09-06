<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberMgr" class="my.shop.member.MemberManager"/>
<%
request.setCharacterEncoding("utf-8");

String admin = request.getParameter("id");
String passwd = request.getParameter("passwd");

boolean result = memberMgr.adminLoginChk(admin, passwd);
//boolean result=false;
System.out.println("jsp: " + result);
if(result){
	session.setAttribute("adminOk", admin);
	response.sendRedirect("admin_index.jsp");
}else{
	%>
	<script>alert("관리자 정보가 일치하지 않습니다. 아이디, 비밀번호를 확인하세요.")
			location.href="adminlogin.jsp";</script>
	<%
}
%>