// Menu display JS

function showdown() {
	var arr = ['menu1','menu2','menu3','menu4','menu5','menu6','menu7'];
	for(var i=0; i<arr.length; i++) {
		try{
			var menubar = document.getElementById(arr[i]);
			menubar.style.display = 'none';
		} catch(e) {
			break;
		}
	}
}

function showup(choose) {
	showdown();
	var what = document.getElementById(choose);
	what.style.display = 'block';
}

