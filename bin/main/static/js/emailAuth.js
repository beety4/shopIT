// Register value Check

window.onload = function() {
	var time = 180;	// 3분 -> 180초
	var min = "";
	var sec = "";
	try {
		var isinfo = document.getElementById("isinfo");
        if (isinfo.value == "1" ){
        	var what = document.getElementById("info");
           	what.style.display = 'block';
           	
           	var x = setInterval(function() {
				   min = parseInt(time/60);
				   sec = time%60;
				   
				   document.getElementById("timer").innerHTML = min + "분" + sec + "초";
				   time--;
				   
				   if(time<0) {
					   clearInterval(x);
					   document.getElementById("timer").innerHTML = "시간초과";
					   document.getElementById("authKey").value = null;
				   }
			}, 1000);
           	     	
        }   	
	} catch (error) {
		console.log(error);
	}
}



function emailCHK() {
	try {
		var dbkey = document.getElementById("authKey");
		var inkey = document.getElementById("inputKey");
		
		if(dbkey.value == "") {
			alert("인증코드가 만료되었습니다!");
			inkey.focus();
			return false;
		} else if(inkey.value == "") {
			alert("인증코드를 입력해 주세요!");
			inkey.focus();
			return false;
		} else if(dbkey.value != inkey.value) {
			alert("인증코드가 일치하지 않습니다!");
			inkey.focus();
			return false;
		} else {
			document.emailCheck.submit();
		}
	} catch (error) {
		console.log(error);
	}
}


function registercheck() {
    var id = document.getElementById("id");
    var name = document.getElementById("name");
    var pw = document.getElementById("pw");
    var pwc = document.getElementById("pwc");
    var addr1 = document.getElementById("addr1");
    var addr2 = document.getElementById("addr2");
    var addr3 = document.getElementById("addr3");
    var address = document.getElementById("address");
    var phone = document.getElementById("phone");
    var gender = document.getElementsByName("gender");
    var email = document.getElementById("email");


    if (id.value == "") {
        alert("아이디를 입력하세요");
        id.focus();
        return false;
    };

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

	if (email.value == "") {
		alert("이메일을 입력하세요");
		email.focus();
		return false;
	}

	var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
    if (!exptext.test(email.value)) {
        alert("올바른 형식의 이메일이 아닙니다");
        email.focus();
        return false;
    };

    document.register.submit();   
}