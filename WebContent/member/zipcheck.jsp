<%@page import="my.shop.member.ZipcodeBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="memberMgr" class="my.shop.member.MemberManager"/>
<jsp:useBean id="bean" class="my.shop.member.ZipcodeBean"/>
<%
	request.setCharacterEncoding("utf-8");
	String check = request.getParameter("check");
	String p_area3 = request.getParameter("area3");
	System.out.println("check: " + check);
	ArrayList<ZipcodeBean> list = memberMgr.getZip(p_area3);	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호 검색</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="../js/script.js"></script>
<script type="text/javascript">
window.onload = function(){
	document.getElementById("btnZipfind").onclick = area3Check;
	document.getElementById("btnZipClose").onclick = function(){
		window.close();
	}
}
function area3Check(){
	if(zipForm.area3.value === ""){
		alert("검색할 동이름을 입력하세요.");
		zipForm.area3.focuse();
		return;
	}	
	zipForm.submit();
}

function send(zip, a1, a2, a3, a4){
	//alert(zip + " " + a1 + " " + a2 );
	opener.document.regForm.zipcode.value = zip;
	var addr = a1 + " " + a2+ " " + a3 + " " + a4;
	opener.document.regForm.address.value = addr;
	window.close();
}
</script>
</head>
<body>
<b>**우편번호 찾기**</b><br>
<form action="zipcheck.jsp" name="zipForm" method="post">
<table>
	<tr>
		<td>
		동이름 입력: <input type="text" name="area3">
		<input type="button" value="검색" id="btnZipfind">
		<input type="button" value="닫기" id="btnZipClose">
		<input type="hidden" name="check" value="n">
		</td>
	</tr>
</table>
</form>
<br>
<%
if(check.equalsIgnoreCase("n")){ 
	if(list.isEmpty()){
	%>
		<b>검색결과가 없습니다.</b>
	<%
	}else{
		%>
		<table ><tr><td colspan=5>검색자료를 클릭하면 자동으로 주소가 입력됩니다.</td></tr>
			<% for(int i=0;i<list.size();i++){
				
			%>
				<tr><td>
					<a href="#" onclick="javascript:send('<%=list.get(i).getZipcode() %>','<%=list.get(i).getArea1()%>','<%=list.get(i).getArea2()%>','<%=list.get(i).getArea3()%>','<%=(list.get(i).getArea4()!= null)? list.get(i).getArea4():""%>')">
					<%=list.get(i).getZipcode()%>&nbsp;
					<%=list.get(i).getArea1()%>&nbsp;
					<%=list.get(i).getArea2()%>&nbsp;
					<%=list.get(i).getArea3()%>&nbsp;
					<%=(list.get(i).getArea4()!= null)? list.get(i).getArea4():""%></a>
				</td></tr>
			<%	
			}
			%>
		</table>
	<%
	}
}%>

</body>
</html>