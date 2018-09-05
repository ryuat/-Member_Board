<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="bean" class="my.shop.board.BoardBean"/>
<jsp:setProperty property="*" name="bean"/>
<jsp:useBean id="boardMgr" class="my.shop.board.BoardManager"/>
<%

String spage = request.getParameter("page");

int num = bean.getNum();

//replay.java에서 hidden으로 넘어오는 값들
int gnum = bean.getGnum();
int onum = bean.getOnum() + 1; // 부모 + 1
int nested = bean.getNested() + 1; // 부모 + 1

// 같은 그룹 내에서 새로운 댓글의 onum보다 크거나 같은 값을 댓글 입력 전에 1씩 증가
boardMgr.updateOnum(gnum, onum);// onum 갱신
bean.setOnum(onum);
bean.setGnum(gnum);
bean.setNested(nested);
bean.setBip(request.getRemoteAddr());
bean.setBdate();
bean.setNum(boardMgr.currentGetMaxNum() + 1);



boardMgr.saveReplyData(bean);
response.sendRedirect("boardlist.jsp?page=" +spage);

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