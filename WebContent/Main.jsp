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

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Main</title>
    <style>
            html,body{margin :0; padding:0; height: 100%}
             #name {
        		background-color: #F2F2F2;
        		color: #222222;
        		text-shadow: 2px 2px 3px rgba(255,255,255,0.2);
        		
      			}
            .myname{
                width : 30%;
                height : 20%;
                border: 0px solid #FF8C00;
                        		background-color: #F2F2F2;
                
/*                 background-color: #666666;
 */        		color: #222222;
        		text-shadow: 2px 2px 3px rgba(255,255,255,0.2);
                float: left;
            }
            .mylist{
                width : 30%;
                height : 80%;

                line-height:25px;
                text-align: center;
                font-size:20px;
                text-decoration-color: aliceblue;
                background-color : #D8D8D8;

                float : left;
            }
            .above {
                width : 70%;
                height : 20%;
                background-color : #A4A4A4;
                float : left;
            }
            #btn {
	-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ededed), color-stop(1, #dfdfdf) );
	background:-moz-linear-gradient( center top, #ededed 5%, #dfdfdf 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ededed', endColorstr='#dfdfdf');
	background-color:#ededed;
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
	color:#777777;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	font-style:normal;
	height:40px;
	line-height:40px;
	width:77px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 1px 0px #ffffff;
}
#btn:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #dfdfdf), color-stop(1, #ededed) );
	background:-moz-linear-gradient( center top, #dfdfdf 5%, #ededed 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#dfdfdf', endColorstr='#ededed');
	background-color:#dfdfdf;
}#btn:active {
	position:relative;
	top:1px;
}
/* This button was generated using CSSButtonGenerator.com */
ul#course_list li, ol#course_list li {
    padding: 5px 0px 5px 5px;
    margin-bottom: 5px;
    border-bottom: 1px solid #efefef;
    font-size: 12px;
}

        </style>
    </head>
    <body>
    	<script>
			<% String id = request.getParameter("user_id");%>
			var id = "<%=id %>";
			var user_course = firebase.database().ref("user_course/"+id);
			var user_profile = firebase.database().ref('user_profile/' + id);
			var user_data = firebase.database().ref('Login_Data/' + id);
			
			var data = new Array();
			user_course.once('value', function(snapshot){
				data.splice(0, data.length);
				var tmp = snapshot.val();
				data.push(tmp.l0);
				data.push(tmp.l1);
				data.push(tmp.l2);
			});
			function mypage(){
				var form = document.getElementById("form1");
			//	alert(id);
        		form.setAttribute("action", "./LoginServlet?id="+id);
        		form.submit();
			}
			function Remove(){
				location.href = "DelUser.jsp?user_id="+id;
				
			}
			function logout(){
				location.href = "Login.jsp";
			}
			function mylist(parent){
				var myul = document.getElementById("course_list");
			//	alert(myul.childNodes.length);
				if(myul.childNodes.length > 5){
					var len = myul.childNodes.length;
					for(var j=5;j<len;j++)
						myul.removeChild(myul.childNodes[5]);
				}
				for(var i =0;i<data.length;i++){
					if(data[i]=='None')
						continue;
					var newli = document.createElement("li");
					var newhl = document.createElement("a");
					//newhl.setAttribute("href", newlink[i]);
					newhl.setAttribute("href", "./QnA.jsp?course_id=l"+i+"&&user_id="+id);
					newhl.innerHTML = data[i];
					newli.appendChild(newhl);
					myul.appendChild(newli);
				}
			}
		</script>
		<div class="myname">
             <p id = "name"><%=id %>님 안녕하세요:)</p><br>
        </div>
        <div class="above">
            <form id = "form1" method="POST">
                <input type="button" id = "btn" value="My Page" onclick="mypage()">
                <input type="button" id = "btn" value="탈퇴" onclick="Remove()">
                <input type="button" id = "btn" value="LogOut" onclick="logout()">
            </form>
        </div>
        <iframe name="iframe3" src="Clock.jsp" style="top:0%; left:90%; width:200; height: 200; position: absolute; border: none"></iframe>
        <div class="mylist">
        	<details onload="Resetlist(this)" onclick="mylist(this)" id = "course_list">
        		<summary>수강과목</summary>
        		<ul id="course_list" class = "one"></ul>
        	</details>
        </div>
        <iframe name="iframe1" src="Rank.jsp" style="top:20%; left:30%; width:70%; height: 80%; position: absolute; border: none"></iframe>
<!--         <iframe name="iframe2" src="Rank.jsp" style="top:20%; left:65%; width:35%; height: 80%; position: absolute; "></iframe>
 -->        
        
    </body>
</html>