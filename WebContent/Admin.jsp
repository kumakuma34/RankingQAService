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
allUserData();//모든 회원 정보를 불러온다.
//allDelData();//탈퇴한 모든 회원 정보를 출력한다.
function goback()
{
	location.href = "Login.jsp";
}
function del_click(){
	var id = prompt("탈퇴시킬 회원의 아이디를 입력하세요");
	console.log(id);
	
	var user_course = firebase.database().ref('user_course/'+id);
	user_course.remove();
	var user_profile = firebase.database().ref('user_profile/'+id);
	user_profile.remove();
	var user_data = firebase.database().ref('Login_Data/'+id);
	user_data.remove();
	
	alert("변경 완료");
	window.location.reload();
}
function allUserData()
{
	
	var user_data = firebase.database().ref('Login_Data');
	user_data.once('value', function(snapshot) {
	    snapshot.forEach(function(childSnapshot) {
	      var tmp = childSnapshot.val();
	      allUserProfile(tmp.user_id);
	    });
	  });
}
function allUserProfile(id){
	table = document.getElementById("infotable");
	var user_data = firebase.database().ref('user_profile');
	user_data.once('value', function(snapshot) {
		snapshot.forEach(function(childSnapshot)
		{
		      var tmp = childSnapshot.val();
	    	  console.log(tmp.id);
	    	  if(tmp.id == id)
	    		  {
	    		     new_tr = document.createElement("tr");
	   		      
	    	 	     td_id = document.createElement("td");
	    		   	      td_id.innerHTML = tmp.id;
	    		   	      new_tr.appendChild(td_id);
	    	 	     //아이디
	    		      td_name = document.createElement("td");
	    		      td_name.innerHTML = tmp.name;
	    		      new_tr.appendChild(td_name);
	    		      //이름
	    		      td_grade = document.createElement("td");
	    		      td_grade.innerHTML = tmp.grade;
	    		      new_tr.appendChild(td_grade);
	    	//학년
	    		      td_major = document.createElement("td");
	    		      td_major.innerHTML = tmp.major;
	    		      new_tr.appendChild(td_major);
	    	//전공
	    		      td_stdid = document.createElement("td");
	    		      td_stdid.innerHTML = tmp.student_id;
	    		      new_tr.appendChild(td_stdid);
	    	//학번 	      
	    		     td_point = document.createElement("td");
	    		      td_point.innerHTML = tmp.point;
	    		      new_tr.appendChild(td_point);
	    	//학번 	      
	    		    
	    		      table.appendChild(new_tr);

	    		  }
	 	
		});
	});
	
}
allDelData();//탈퇴한 모든 회원 정보를 출력한다.
function allDelData()
{
	var user_data = firebase.database().ref('Del_User');
	user_data.once('value', function(snapshot) {
	    snapshot.forEach(function(childSnapshot) {
	      var tmp = childSnapshot.val();
	      allDelProfile(tmp.user_id);
	    });
	  });
}
function allDelProfile(id){
	table2 = document.getElementById("deltable");
	console.log(table2);
	var user_data = firebase.database().ref('Del_User');
	user_data.once('value', function(snapshot) {
		snapshot.forEach(function(childSnapshot)
		{
		      var tmp = childSnapshot.val();
	    	  if(tmp.user_id == id)
	    		  {
	    		     new_tr = document.createElement("tr");
	   		      
	    	 	     td_id = document.createElement("td");
	    		   	      td_id.innerHTML = tmp.user_id;
	    		   	      new_tr.appendChild(td_id);
	    	 	     //아이디
	    		      td_date = document.createElement("td");
	    		      td_date.innerHTML = tmp.time;
	    		      new_tr.appendChild(td_date);
	    		      //탈퇴일자
	    		      td_reason = document.createElement("td");
	    		      td_reason.innerHTML = tmp.reason;
	    		      new_tr.appendChild(td_reason);
	    	//탈퇴사유
	    		      table2.appendChild(new_tr);

	    		  }
	 	
		});
	});
	
}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>관리자 페이지</title>
</head>
<style>
html,body{margin :0; padding:0; height: 100%}
.infotable
{
	width : 40%;
	height : 80%;
	float : left;
}
.del
{
	width : 50%;
	height : 80%;
	float : left;
}
  table {
    width: 100%;
    
    border-top: 1px solid #E3CEF6;
    border-collapse: collapse;
    float : left;
  }
  th, td {
    border-bottom: 1px solid #E3CEF6;
    padding: 10px;
    text-align: center;
  }
  th {
    background-color: #E3CEF6;
  }
  td {
    background-color: #ECE0F8;
  }
.delbutton {
	-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #615861), color-stop(1, #dfdfdf) );
	background:-moz-linear-gradient( center top, #615861 5%, #dfdfdf 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#615861', endColorstr='#dfdfdf');
	background-color:#615861;
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
	color:#f2eaf2;
	font-family:Georgia;
	font-size:15px;
	font-weight:bold;
	font-style:normal;
	height:45px;
	line-height:45px;
	width:94px;
	text-decoration:none;
	text-align:center;
}
.delbutton:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #dfdfdf), color-stop(1, #615861) );
	background:-moz-linear-gradient( center top, #dfdfdf 5%, #615861 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#dfdfdf', endColorstr='#615861');
	background-color:#dfdfdf;
}.delbutton:active {
	position:relative;
	top:1px;
}
/* This button was generated using CSSButtonGenerator.com */
</style>
<body>
<nav class = "infotable">
<table id="infotable" border=1>
		<tr>
			<th>ID</th>
			<th>이름</th>
			<th>학년</th>
			<th>전공</th>
			<th>학번</th>
			<th>포인트</th>
		</tr>
	</table>
</nav>
<nav class = "del">
<table id="deltable" border=1>
		<tr>
			<th>ID</th>
			<th>탈퇴일자</th>
			<th>탈퇴사유</th>
		</tr>
	</table>
</nav>
</body>
<footer>
<input type = "button" onclick ="del_click()" class = "delbutton" value = "회원탈퇴"> 
<input type = "button" onclick ="goback()" class = "delbutton" value = "돌아가기"> 
</footer>
<!-- </body> -->
</html>