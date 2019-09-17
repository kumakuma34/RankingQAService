<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Sign Up</title>
</head>
<script src="https://www.gstatic.com/firebasejs/5.5.9/firebase.js"></script>
<script>
	// Initialize Firebase
	var config = {
		apiKey : "AIzaSyD5lNiLX75BJqlxHMxFN4oP6244Y3iBhvg",
		authDomain : "final-40990.firebaseapp.com",
		databaseURL : "https://final-40990.firebaseio.com",
		projectId : "final-40990",
		storageBucket : "final-40990.appspot.com",
		messagingSenderId : "59514043316"
	};
	firebase.initializeApp(config);
</script>
<script>
	var user_data = firebase.database().ref('Login_Data');
	var user_profile = firebase.database().ref('user_profile');
	var data = new Array();
	user_data.on('value', function(snapshot) {
		data.splice(0, data.length);
		snapshot.forEach(function(childSnapshot) {
			var childData = childSnapshot.val();
			data.push(childData.user_id);
		});
	});

	function signup() {
		var id = document.getElementById("join_id").value;
		var pw = document.getElementById("join_pw").value;
		var pw2 = document.getElementById("join_pw2").value;

		var name = document.getElementById("name").value;
		//var major = document.getElementById("major").value;
		var grade = document.getElementById("grade").value;
		var checkedValue = null;
		var inputElements = document.getElementsByClassName('major');
		var cboxes = document.getElementsByName('major');
		var course_boxes = document.getElementsByName('course');
		var course = {};
		var len = cboxes.length;
		var major = -1;
		var point =  0;
		var user_data = firebase.database().ref('Login_Data/'+id);
		var user_profile = firebase.database().ref('user_profile/'+id);
		var user_course = firebase.database().ref('user_course/'+id);
		
		for (var i = 0; i < len; i++) {
			if (cboxes[i].checked == true) {
				major = i;
				break;
			}
		}
		for(var i = 0; i< course_boxes.length;i++){
			if(course_boxes[i].checked == true){
				course["l"+i] = course_boxes[i].value;
			}
			else{
				course["l"+i] = 'None';
			}
		}
		if (major == 0) {
			major = "��ǻ�Ͱ���"
		} else if (major == 1) {
			major = "���ڰ��а�";
		} else if (major == 2) {
			major = "�����а�";
		}
		var grade = document.getElementById("grade").value;
		var student_id = document.getElementById("student_id").value;
		var email = document.getElementById("email").value;

		if (document.getElementById("join_id").disabled) {
			if (pw == pw2) {
				user_data.set({
					user_id : id,
					user_pw : pw,
				});
				user_profile.set({
					id : id,
					grade : grade,
					major : major,
					name : name,
					student_id :student_id,
					email : email,
					point : point,
				});
				user_course.update(course);
				alert("ȸ�������� �Ϸ�Ǿ����ϴ�");
				history.back();
			}
			else
				{
				alert("��й�ȣ�� �ٽ� Ȯ���� �ּ���.")
				}

		} else {
			alert("���̵� �ߺ�Ȯ���� �����ּ���");
		}

	}

	function mycheck() {
		var id = document.getElementById("join_id").value;
		var checked = 0;

		data.forEach(function(tmp) {
			if (tmp == id) {
				alert("�̹� ������� ���̵��Դϴ�");
				checked = 1;
			}
		});
		if (checked == 0) {
			alert("��� ������ ���̵��Դϴ�");
			document.getElementById("join_id").disabled = true;
		}
	}
</script>

<style>
url(https://fonts.googleapis.com/css?family=BenchNine:700);
html, body {
	margin: 0;
	padding: 0;
	height: 100%
}

.header {
	width: 100%;
	height: 20%;
	vertical-align: text-bottom;
}

.nav {
	width: 100%;
	height: 50%;
	background-color: darkgray;
	line-height: 30px;
	font-size: 15px;
	font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS',
		sans-serif;
	text-decoration-color: aliceblue;
	color: aliceblue;
}

.footer {
	width: 100%;
	height: 30%;
}
button{
  background:gray;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color:#1AAB8A;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: gray;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}
.textbox {position: relative; width: 200px; margin: 15px}

.textbox label {
  position: absolute;
  top: 1px;  /* input ����� border-top ������ ��ŭ */
  left: 1px;  /* input ����� border-left ������ ��ŭ */
  padding: .8em .5em;  /* input ����� padding �� ��ŭ */
  color: #999;
  cursor: text;
}

.textbox input[type="text"],
.textbox input[type="password"] {
  width: 100%;  /* ���ϴ� �ʺ� ���� */ 
  height: auto;  /* ���̰� �ʱ�ȭ */
  line-height : normal;  /* line-height �ʱ�ȭ */
  padding: .8em .5em; /* ���ϴ� ���� ����, ���ϴ� �������� ���̸� ���� */
  border: 1px solid #999;
  border-radius: 0;  /* iSO �ձٸ𼭸� ���� */
  outline-style: none;  /* ��Ŀ���� �߻��ϴ� ȿ�� ���Ÿ� ���Ѵٸ� */
  -webkit-appearance: none;  /* �������� �⺻ ��Ÿ�ϸ� ���� */
  -moz-appearance: none;
  appearance: none;
}
</style>
<body>
	<header class="header"> <br>
	<br>
	<br>
	<p
		style="color: black; font-size: 30px; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; vertical-align: bottom">
		���ϴ��б� �л����� ���� �������Դϴ�. ȯ���մϴ� :)</p>
	</header>

	<nav class="nav">
	<table>
		<tr>
			<td>���̵�</td> <td><input type="text" class = "textbox" id="join_id" name="join_id" style="height: 20px;"></td>
			<td><input type="button" class = "textbox"onclick="mycheck()" value="�ߺ�Ȯ��"
		style="height: 25px; color: white; text-color:black;"></td>
		</tr>
		<tr>
			<td>��й�ȣ</td> <td><input type="password" id="join_pw" name="join_pw" style="height: 20px;"></td>
		</tr>
		<tr>
			<td>��й�ȣ Ȯ��</td> <td><input type="password" class = "textbox" id="join_pw2" name="join_pw2"
		style="height: 20px;"></td>
		</tr>
		<tr>
			<td>�̸�</td><td><input type="text" class = "textbox" name="name" id="name"></td>
		</tr>
		<tr>
			<td>����</td><td><input type="checkbox" name="major" value="��ǻ�Ͱ���"> ��ǻ�Ͱ��� </td>
		    <td><input type="checkbox" name="major" value="���ڰ��а�"> ���ڰ��а� </td>
		    <td><input type="checkbox" name="major"	value="�����а�"> �����а� </td>
		</tr>
		<tr>
			<td>��������</td><td><input type="checkbox" name="course" value="���ͳ�  ���α׷���"> ���ͳ� ���α׷��� </td>
			<td><input type="checkbox" name="course" value="���н� �ý���  ���α׷���"> ���н� �ý��� ���α׷��� </td>
			<td><input type="checkbox" name="course" value="�Ӻ���� �ý��� ���α׷���"> �Ӻ���� �ý��� ���α׷��� </td>
		</tr>
		<tr>
			<td>�г�</td><td><input type="text" name="grade" class = "textbox" id="grade" style="height: 20px;"></td>
		</tr>
		<tr>
			<td>�й�</td><td><input type="text " class = "textbox" name="student_id" id="student_id" style="height: 20px;"></td>
		</tr>
		<tr>
			<td>�̸���</td><td><input type="text" name="email" class = "textbox" id="email" style="height: 20px;"></td>
		</tr>
	</table>
	<button onclick="signup()">ȸ������</button>
	</nav>
	<footer>
	<p style="text-align: center;">Made By</p>
	<p style="text-align: center;">������ ����ö</p>
	</footer>

</body>
</html>