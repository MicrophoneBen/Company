function getXHR(){
	var xmlhttp;
	
	if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
	  xmlhttp=new XMLHttpRequest();
	}else{// code for IE6, IE5
	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	if(xmlhttp!=null)
		return xmlhttp;
	else{
		alert("你的浏览器不支持AJAX,请使用现代浏览器,如Chrome、Firefox等,或升级你的浏览器，以保证正常使用")
		return false;
	}
		
}

function getVerifyCode(){
	
	var codeImage = document.getElementById("codeImage");
	
	var xhr = getXHR();
	
	xhr.open("POST","getVerifyCode.action");
	xhr.setRequestHeader("CONTENT-TYPE","application/x-www-form-urlencoded");
	xhr.send(null);
	
	xhr.onreadystatechange = function(){
		if (xhr.readyState == 4 && xhr.status == 200) {
			codeImage.src = "getVerifyCode.action?time="+
				new Date().getTime();
		}
	}
}
	
function login(){

	var xhr = getXHR();

	var f = document.getElementById("loginForm");	//得到登陆表单
	var username = f.username.value;
	var password = f.password.value;
	var verifyCode = f.verifyCode.value;
	
	var param = "username="+username+"&"+"password="+password+"&"+"verifyCode="+verifyCode;

	console.log("param:"+param);
	
	xhr.open("POST","login.action");
	xhr.setRequestHeader("CONTENT-TYPE","application/x-www-form-urlencoded");
	xhr.send(param);
	
	xhr.onreadystatechange = function(){
		if (xhr.readyState == 4 && xhr.status == 200) {
			var rt = xhr.responseText;
			console.log(rt);
			if (rt == "login000") {	//登陆成功
				alert("登陆成功");
				location.href = "console/home";
				return true;
			}else if (rt == "login001") {	//账号或密码错误
				alert("账号或密码错误");
			}else if (rt == "login002") {	//验证码错误
				alert("验证码错误");
			}else if (rt == "login003") {	//格式错误
				alert("错误，请检查输入是否为空");
			}		
			//重新得到验证码
			getVerifyCode();
			return false;
		}
	}
}

function newsEdit(){
	var xhr = getXHR();
	
	var f = document.getElementById("newsEditForm");	//得到表单
	
	var newsAction = f.newsAction.value;
	
	var title = f.title.value;
	var isShow = f.isShow.value;
	var content = f.content.value;
	
	var param = "title="+title+"&"+"isShow="+isShow+"&"+"content="+content;
	if(newsAction=='newsUpdate'){
		var newsid = f.newsid.value;
		param += "&newsid="+newsid;
	}
	
	console.log("param:"+param);
	
	if(newsAction=='newsUpdate')
		xhr.open("POST","console/newsUpdate.action");
	else if(newsAction=='newsRelease')
		xhr.open("POST","console/newsRelease.action");
	
	xhr.setRequestHeader("CONTENT-TYPE","application/x-www-form-urlencoded");
	xhr.send(param);
	
	xhr.onreadystatechange = function(){
		if (xhr.readyState == 4 && xhr.status == 200) {
			var rt = xhr.responseText;
			console.log(rt);
			
			if (rt == "success") {	//发布成功
				alert("操作成功");
				location.href = "console/newsManage";
			}else if (rt == "fail") {	//发布失败
				alert("操作失败，请重试！");
			}
		}
	}
}




function test(){
	alert("测试");
}