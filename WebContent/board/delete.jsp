<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="boardMgr" class="my.shop.board.BoardManager"/>
<%
String spage = request.getParameter("page");
String num = request.getParameter("num");

boardMgr.deleteData(num);
response.sendRedirect("boardlist.jsp?page="+ spage);
%>
