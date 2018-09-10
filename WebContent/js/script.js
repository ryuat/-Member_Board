
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