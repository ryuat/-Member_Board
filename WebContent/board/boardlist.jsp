<%@page import="my.shop.board.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <jsp:useBean id="boardMgr" class="my.shop.board.BoardManager"/>
 <jsp:useBean id="dto" class="my.shop.board.BoardDto"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" type="text/css" href="../css/board.css">
<script type="text/javascript">
	window.onload=function(){
		document.getElementById("btnSearch").onclick = function(){
			if(frm.sword.value==""){
				frm.sword.focus();
				alert("검색어를 입력하세요.");
				return;
			}
			frm.submit();
		}
	}
</script>
</head>
<body>
<table>
	<tr><td>
		[<a href="../index.jsp">메인으로</a>]&nbsp;
		[<a href="../index.jsp">최근 목록</a>]&nbsp;
		[<a href="boardwrite.jsp">새 글 작성</a>]&nbsp;
		[<a href="#" onclick="window.open('admin.jsp','','width=300,height=150,top=200,left=300')">관리자용</a>]&nbsp;
	<br><br>
	<table style="width:100%;" border=1>
		<tr style="background-color: silver;">
			<th style="width:30px">번호</th><th>제목</th><th>작성자</th><th style="width:140px">작성일</th><th style="width:40px;">조회수</th>
		</tr>
		<%
			int pageCnt, sPage = 1;
			request.setCharacterEncoding("utf-8");
			
			
			try{
				sPage = Integer.parseInt(request.getParameter("page")); // boaredsave에서 1, index에서 없음
			}catch(Exception e){
				sPage = 1;
			}
			sPage = (sPage < 1) ? 1 : sPage;
			
			String sType = request.getParameter("stype");
			String sWord = request.getParameter("sword");
		
			boardMgr.setTotalCnt(); // 전체 레코드 수 멤버변수로 set
			pageCnt = boardMgr.getPageCnt(); // 전체 페이지 수
			
			ArrayList<BoardDto> list = boardMgr.getDataAll(sPage, sType, sWord);
			for(int i=0;i<list.size();i++){
				dto = (BoardDto)list.get(i);
				// 댓글 들여 쓰기
				int nested = dto.getNested();
				String tab = "";
				for(int k=0;k<nested;k++){
					tab += "&nbsp;&nbsp;";
				}
			%>
				<tr>
					<td style="text-align:center"><%= dto.getNum() %></td>
					<td style="text-align:center"><a href="boardcontent.jsp?num=<%=dto.getNum()%>&page=<%=sPage%>"><%=tab%><%= dto.getTitle() %></a></td>
					<td style="text-align:center"><%= dto.getName() %></td>
					<td style="text-align:center"><%= dto.getBdate() %></td>
					<td style="text-align:center"><%= dto.getReadcnt() %></td>
				</tr>
			<%
			}
		%>
	</table>
	<br><br>
	<table style="width:100%">
		<tr>
			<td style="text-align:center; color: red">
				<%
				for(int i=1;i<=pageCnt;i++){
					if(i==sPage){
						out.print("<b>[" + i + "]</b>&nbsp;&nbsp;"); // 현재 페이지는 굵게
					}else{
						out.print("<a href='boardlist.jsp?page="+ i+"'>["+i+"]</a>&nbsp;&nbsp;");
					}
				}
				%>
				<br><br>
				<form action="boardlist.jsp" name="frm" method="post">
					<select name="stype">
						<option value="title" selected>글제목</option>
						<option value="name">작성자</option>
					</select>
					<input type="text" name="sword" >
					<input type="button" value="검색" id="btnSearch">
				</form>
			</td>
		</tr>
	</table>
	</td></tr>
</table>
</body>
</html>