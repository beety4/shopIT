// Register value Check



function checkValue() {
	var name = document.getElementById("name");
    var pw = document.getElementById("pw");
    var pwc = document.getElementById("pwc");
    var addr1 = document.getElementById("addr1");
    var addr2 = document.getElementById("addr2");
    var addr3 = document.getElementById("addr3");
    var address = document.getElementById("address");
    var phone = document.getElementById("phone");
    var gender = document.getElementsByName("gender");



    if (name.value == "") {
        alert("이름을 입력하세요");
        name.focus();
        return false;
    };

    if (pw.value == "") {
        alert("비밀번호를 입력하세요");
        pw.focus();
        return false;
    };

    var pwform = /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,15}$/;
    if (!pwform.test(pw.value)) {
        alert("영문자+숫자 조합으로 6~15자리 사용해야 합니다");
        pw.focus();
        return false;
    };

    if (pwc.value !== pw.value) {
        alert("비밀번호가 일치하지 않습니다!");
        pw.focus();
        return false;
    };

    
    if ((addr1.value || addr2.value || addr3.value) == "") {
		alert("주소를 입력하세요");
		addr3.focus();
		return false;
	} else {
		address.value = addr1.value + " " + addr2.value + " " + addr3.value;
	}
	
	if (phone.value == "") {
		alert("전화번호를 입력하세요");
		phone.focus();
		return false;
	}
	
	if (gender.value == "") {
		alert("성별을 입력하세요");
		return false;
	}


    document.editUser.submit();   
}


function writeBoard() {
	var title = document.getElementById("title");
    var content = document.getElementById("content");
    var price = document.getElementById("price");

	if (title.value == "") {
		alert("제목을 입력해 주세요!");
		title.focus();
		return false;
	}
	if (content.value == "") {
		alert("내용을 입력해 주세요!");
		content.focus();
		return false;
	}
	if (price.value == "") {
		alert("가격을 입력해 주세요!");
		price.focus();
		return false;
	}

	
	document.writeBoard.submit();  
}



