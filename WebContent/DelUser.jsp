<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="https://www.gstatic.com/firebasejs/5.5.9/firebase.js"></script>
<script>
  // Initialize Firebase
  var config = {
    apiKey: "AIzaSyD5lNiLX75BJqlxHMxFN4oP6244Y3iBhvg",
    authDomain: "final-40990.firebaseapp.com",
    databaseURL: "https://final-40990.firebaseio.com",
    projectId: "final-40990",
    storageBucket: "final-40990.appspot.com",
    messagingSenderId: "59514043316"
  };
  firebase.initializeApp(config);
</script>
<script>
function addReason(id)
{
	var user_data = firebase.database().ref('Del_User/'+id);
 	var reason_input = document.getElementById("reason").value;
 	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth() +1;
	var yyyy = today.getFullYear();
    var now_date = "" +yyyy + "-" + mm +"-" + dd;
    console.log(now_date);
	user_data.set({
		user_id : id,
		reason : reason_input,
		time : now_date,
	});
	
}
function doremove(id)
{
	var user_course = firebase.database().ref('user_course/'+id);
	user_course.remove();
	var user_profile = firebase.database().ref('user_profile/'+id);
	user_profile.remove();
	var user_data = firebase.database().ref('Login_Data/'+id);
	user_data.remove();
	addReason(id);
	location.href = "Login.jsp";
}
function del_data()
{
    var pw = document.getElementById("pw").value;
    var mycheck = 0;
	<% String id = request.getParameter("user_id");%>
	var id = "<%=id%>";
	var user_ref = firebase.database().ref('Login_Data/'+id);
	user_ref.once('value', function(snapshot) {
	    var tmp = snapshot.val();
	    if(tmp.user_pw == pw)
	    	{
	    		alert("그동안 사용해 주셔서 감사합니다.");
	    		doremove(id);
	    	}
	    else
	    	alert("비밀번호가 틀렸습니다.");
	  });
}

</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<style>
        html,body{margin :0; padding:0; height: 100%}

        header{
            width : 100%;
            height : 8%;
                        background-color: #EFFBFB;
            

        }
        nav
        {
            width : 100%;
            height : 30%;
            background-color: #E0F8F7;
        }
        footer{
            width : 100%;
            height : 20%;
            text-align: center;
			font-size: 20px;
        }
        textarea#reason {
	width: 600px;
	height: 120px;
	border: 3px solid #cccccc;
	padding: 5px;
	font-family: Tahoma, sans-serif;
	background-image: url(bg.gif);
	background-position: bottom right;
	background-repeat: no-repeat;
}
#btn {
	-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #f9f9f9), color-stop(1, #e9e9e9) );
	background:-moz-linear-gradient( center top, #f9f9f9 5%, #e9e9e9 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f9f9f9', endColorstr='#e9e9e9');
	background-color:#f9f9f9;
	-webkit-border-top-left-radius:0px;
	-moz-border-radius-topleft:0px;
	border-top-left-radius:0px;
	-webkit-border-top-right-radius:0px;
	-moz-border-radius-topright:0px;
	border-top-right-radius:0px;
	-webkit-border-bottom-right-radius:0px;
	-moz-border-radius-bottomright:0px;
	border-bottom-right-radius:0px;
	-webkit-border-bottom-left-radius:0px;
	-moz-border-radius-bottomleft:0px;
	border-bottom-left-radius:0px;
	text-indent:0;
	border:1px solid #dcdcdc;
	display:inline-block;
	color:#666666;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	font-style:normal;
	height:41px;
	line-height:41px;
	width:65px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 1px 0px #ffffff;
}
#btn:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #e9e9e9), color-stop(1, #f9f9f9) );
	background:-moz-linear-gradient( center top, #e9e9e9 5%, #f9f9f9 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#e9e9e9', endColorstr='#f9f9f9');
	background-color:#e9e9e9;
}
#btn:active {
	position:relative;
	top:1px;
}
/* This button was generated using CSSButtonGenerator.com */
    </style>
<body>
<header>
<% String id2 = request.getParameter("user_id");%>
            <h2><%=id2%>님 그동안 저희 사이트를 이용해 주셔서 감사합니다.</h2>
            <hr>
</header>
<nav>   
			
            비밀번호<input type = "password"  id = "pw"> <br>
            탈퇴사유<textarea id = "reason" rows = "10" cols = "70" onfocus = "this.value=''; setbg('#e5fff3');" onblur="setbg('white')">탈퇴사유를 적어주세요</textarea><br>
        	<br>
            <input type = "button"  id = "btn" onclick = "del_data()" id = "check" value = "탈퇴">
        </nav>
        <footer>
        Made By HyunSoo, Seong Chul
        </footer>
</body>
</html>