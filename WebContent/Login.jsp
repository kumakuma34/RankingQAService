<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Login</title>
</head>
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
function goAdmin()
{
	var input = prompt("비밀번호를 입력하세요.\n비밀번호는 오늘의 년도 + 달 + 일 입니다.\n(ex. 2018년 11월 30일이면 2018+11+30=>2059)");
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth() +1;
	var yyyy = today.getFullYear();
	var answer = dd + mm + yyyy;
	if(input == answer)
	{
		location.href = "Admin.jsp";
	}
	else
	{
		alert("틀렸습니다!다시하세요.");
	}
}//관리자 페이지로 가는 함수
function gosignup() {
    location.href="SignUp.jsp";
}
function mylogin() {
    var id = document.getElementById("login_id").value;
    var pw = document.getElementById("login_pw").value;

    var user_data = firebase.database().ref('Login_Data');

    var mycheck = 0;
    user_data.once('value', function(snapshot) {
      snapshot.forEach(function(childSnapshot) {
        var tmp = childSnapshot.val();
        if(tmp.user_id==id){
          if(tmp.user_pw==pw){
            alert("로그인 성공");
            //updateLoginTime(childSnapshot.key, id, pw);
            location.href = "Main.jsp?user_id="+id;
            mycheck = 1;
          } else {
            alert("잘못된 비밀번호입니다");
            mycheck = 1;
          }
        }
      });
      if(mycheck==0){
        alert("존재하지 않는 아이디입니다");
      }
    });
  }
</script>
<style>
url (https: //fonts.googleapis.com /css?family=BenchNine: 700);

        html, body {
	margin: 0;
	padding: 0;
	height: 100%
}

.header {
	width: 100%;
	height: 30%;
}

.nav {
	width: 100%;
	height: 40%;
	background-color: darkgray;
	line-height: 15px;
	text-align: center;
	font-size: 30px;
	text-decoration-color: aliceblue;
}

.footer {
	text-align: center;
	font-size: 10px;
	width: 100%;
	height: 30%;
}

button {
	background-color: gray;
	border: none;
	color: #ffffff;
	cursor: pointer;
	display: inline-block;
	font-family: 'BenchNine', Arial, sans-serif;
	font-size: 1em;
	font-size: 22px;
	line-height: 1em;
	margin: 15px 40px;
	outline: none;
	padding: 12px 40px 10px;
	position: relative;
	text-transform: uppercase;
	font-weight: 700;
}

button:before, button:after {
	border-color: transparent;
	-webkit-transition: all 0.25s;
	transition: all 0.25s;
	border-style: solid;
	border-width: 0;
	content: "";
	height: 24px;
	position: absolute;
	width: 24px;
}

button:before {
	border-color: gray;
	border-right-width: 2px;
	border-top-width: 2px;
	right: -5px;
	top: -5px;
}

button:after {
	border-bottom-width: 2px;
	border-color: gray;
	border-left-width: 2px;
	bottom: -5px;
	left: -5px;
}

button:hover, button.hover {
	background-color: gray;
}

button:hover:before, .button.hover:before, button:hover:after,
	.snip1535.hover:after {
	height: 100%;
	width: 100%;
}
.admin {
	-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #f9f9f9), color-stop(1, #e9e9e9) );
	background:-moz-linear-gradient( center top, #f9f9f9 5%, #e9e9e9 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f9f9f9', endColorstr='#e9e9e9');
	background-color:#f9f9f9;
	-webkit-border-top-left-radius:20px;
	-moz-border-radius-topleft:20px;
	border-top-left-radius:20px;
	-webkit-border-top-right-radius:20px;
	-moz-border-radius-topright:20px;
	border-top-right-radius:20px;
	-webkit-border-bottom-right-radius:20px;
	-moz-border-radius-bottomright:20px;
	border-bottom-right-radius:20px;
	-webkit-border-bottom-left-radius:20px;
	-moz-border-radius-bottomleft:20px;
	border-bottom-left-radius:20px;
	text-indent:0;
	border:1px solid #dcdcdc;
	display:inline-block;
	color:#666666;
	font-family:Verdana;
	font-size:15px;
	font-weight:bold;
	font-style:normal;
	height:50px;
	line-height:50px;
	width:100px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 1px 0px #ffffff;
}
.admin:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #e9e9e9), color-stop(1, #f9f9f9) );
	background:-moz-linear-gradient( center top, #e9e9e9 5%, #f9f9f9 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#e9e9e9', endColorstr='#f9f9f9');
	background-color:#e9e9e9;
}.admin:active {
	position:relative;
	top:1px;
}
</style>
<body>
	<h1 style="text-align : center">인터넷 프로그래밍 기말 프로젝트</h1>
	<header class="header"> </header>
	<nav class="nav"> <br>
	<p style="color: blanchedalmond">아이디</p>
	<input type="text" id="login_id">
	<p style="color: blanchedalmond">비밀번호</p>
	<input type="password" id="login_pw"> <br>
	<button onclick="mylogin()">LOGIN</button>
	<button onclick="gosignup()">SIGNUP</button>
	
	<!-- <input type="button" onclick="mylogin()" id="login" value="로그인">
	<input type="button" onclick="gosignup()" id="join" value="회원가입"> -->
	</nav>

	<footer>
	<p style="text-align: center;">22212 인천광역시 미추홀구 인하로 100, 대표전화 :
		032-860-7114, FAX : 032-863-1333, 긴급전화(24시간) : 032-860-9119</p>
	<p style="text-align: center;">Copyright 2018. INHA UNIVERSITY All
		Rights Reserved.</p>
	<p style="font-size: 20px;">
	<strong>바로가기</strong>
	</p>
	<a href="http://www.inha.ac.kr/mbshome/mbs/kr/index.do">인하대학교 공식
		페이지</a>
	<br>
	<a href="https://portal.inha.ac.kr/">인하대학교 포털</a>
	<br>
	<a href="http://sugang.inha.ac.kr/sugang/">인하대학교 수강신청</a>
	<br>
	<a href="http://lib.inha.ac.kr/">정석학술정보관</a>
	<br>
	<br><br><br><br><br>
	<input type = "button" class = "admin" onclick ="goAdmin()" value = "관리자페이지"> 
	</footer>

</body>
</html>