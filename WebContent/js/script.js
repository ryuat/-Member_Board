
function zipCheck(){
	url = "zipcheck.jsp?check=y";
	window.open(url, "", "toolbar=no,width=400,height=300,top=200,left=300,scrollbar=yes,menubar=no");
}
function idCheck(){
	if(regForm.id.value===""){
		alert("아이디를 입력하세요.");
		regForm.id.focus();
	}else{
		url = "idcheck.jsp?id=" + regForm.id.value;
		window.open(url, "", "toolbar=no,width=400,height=300,top=200,left=300,scrollbar=yes,menubar=no");
	}
}
function inputCheck(){
	if(regForm.id.value == ""){
		alert("아이디를 입력하세요.");
		regForm.id.focus();
		return;
	}
	if(regForm.passwd.value == ""){
		alert("비밀번호를 입력하세요.");
		regForm.passwd.focus();
		return;
	}
	if(regForm.passwd.value != regForm.repasswd.value){
		alert("입력한 두 비밀번호가 다릅니다.");
		regForm.passwd.focus();
		return;
	}
	if(regForm.job.value === "0"){
		alert("직업을 선택하세요.");
		regForm.job.focus();
		return;
	}
	regForm.submit();
}

function memUpdateFunc(){
	regForm.submit();
}
function memDelFunc(){
	alert("memDelFunc 호출");
	
}
function memCancelFunc(){
	location.href="../guest/guest_index.jsp";
}


// 관리자가 회원 수정
function memUpdate(id){
	document.updateFrm.id.value = id;
	document.updateFrm.submit();
}

function memUpdateAdminFunc(){
	document.updateFormAdmin.submit();
}

function memUpdateCancelAdminFunc(){
	location.href = "membermanager.jsp";
}

// 관리자 product 상세보기
function productDetail(no){
	location.href= "productdetail.jsp?no="+no;
}
function productUpdate(no){
	location.href= "productupdate.jsp?no="+no;
}
function productDelete(no){
	confirm("정말 삭제하시겠습니까?");
	location.href= "productproc.jsp?flag=delete&no="+no;
}

function back(){
	location.href="productmanager.jsp";
}


// 장바구니 관련

function cartUpdate(form){
	location.href="cartproc.jsp?flag=update&product_no="+form.product_no.value+"&quantity=" +form.quantity.value;
}

function cartDelete(form){

	location.href="cartproc.jsp?flag=delete&product_no="+form.product_no.value;
}


// 주문 관련

function orderFunc(){
	
	location.href="orderproc.jsp";
}

function orderDetail(no){
	detailFrm.no.value = no;
	detailFrm.submit();
}

function orderUpdate(form){
//	alert(	.orderDetailFrm.flag.value );
	form.flag.value = "update";
	form.submit();
}