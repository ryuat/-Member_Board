<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="bean" class="my.shop.board.BoardBean"/>
<jsp:setProperty property="*" name="bean"/>
<jsp:useBean id="boardMgr" class="my.shop.board.BoardManager"/>

<%

bean.setBip(request.getRemoteAddr());


if(request.getRemoteAddr().equals("192.168.0.13"))
{
	System.out.println("true");
	response.sendRedirect("failip.jsp");
	return;
}
bean.setBdate();
int maxNum = boardMgr.currentGetMaxNum() + 1;
bean.setNum(maxNum); // 새글의 번호
bean.setGnum(maxNum); // 그룹번호도 새글번호를 그대로
boardMgr.saveData(bean); 

response.sendRedirect("boardlist.jsp?page=1");
%>
