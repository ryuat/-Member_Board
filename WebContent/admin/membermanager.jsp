<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberMgr" class="my.shop.member.MemberManager"/>
<jsp:useBean id="bean" class="my.shop.member.MemberBean"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<%@include file="admin_top.jsp" %>
<br><br>
<h3 style="text-align: center">회원관리</h3>
<table  style="margin: 0 auto;">
		<tr><td colspan=5><hr></td></tr>
		<tr>
			<th  style="width:80px; height:40px; font-size:14px;">아이디</a></th>
			<th  style="width:80px; height:40px; font-size:14px;">패스워드</th>
			<th  style="width:80px; height:40px; font-size:14px;">이름</th>
			<th  style="width:80px; height:40px; font-size:14px;">이메일</th>
			<th  style="width:80px; height:40px; font-size:14px;">전화</th>
		</tr>
		<tr><td colspan=5><hr></td></tr>
		
		<% 
		ArrayList<MemberBean> list = memberMgr.getMemeberAll();
		
		System.out.println("jsp 내 list size: " + list.size());
		for(MemberBean m:list){
			%>
		<tr>
			<td>
				<label style="width:80px; height:40px; font-size:14px"><a href="memberupdate2.jsp?id=<%=m.getId()%>"><%=m.getId() %></a></label>
			</td>
			<td>
				<label style="width:80px; height:40px; font-size:14px"><%=m.getPasswd() %></label>
			</td>
			<td>
				<label style="width:80px; height:40px; font-size:14px"><%=m.getName() %></label>
			</td>
			<td>
				<label style="width:80px; height:40px; font-size:14px"><%=m.getEmail() %></label>
			</td>
			<td>
				<label style="width:80px; height:40px; font-size:14px"><%=m.getPhone() %></label>
			</td>
		</tr>
		<tr><td colspan=5><hr></td></tr>
			<%
		}
		
		%>
</table>
<%-- <%@include file="admin_bottom.jsp" %>--%>
</body>
</html>