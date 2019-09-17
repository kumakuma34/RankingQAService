<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>My Page</title>
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
</head>

<body>
   <nav class="nav">
   <table>
      <tr>
         <td>���̵�</td> <td><input type="text" class = "textbox" id="join_id" name="join_id" style="height: 20px;" disabled=true></td>
      </tr>
      <tr>
         <td>��й�ȣ</td> <td><input type="password" class= "textbox" id="join_pw" name="join_pw" style="height: 20px;"></td>
      </tr>
      <tr>
         <td>�̸�</td><td><input type="text" class = "textbox" name="name" id="name"></td>
      </tr>
      <tr>
         <td>����</td><td><input type="text" class = "textbox" name="major" id="major" disabled=true></td> 
      </tr>
      <tr>
         <td>�г�</td><td><input type="text" name="grade" class = "textbox" id="grade" style="height: 20px;"></td>
      </tr>
      <tr>
         <td>�й�</td><td><input type="text" class = "textbox" name="student_id" id="student_id" style="height: 20px;"></td>
      </tr>
      <tr>
         <td>�̸���</td><td><input type="text" name="email" class = "textbox" id="email" style="height: 20px;"></td>
      </tr>
      <tr>
         <td>��������</td>
         <td><ul id="mylist"></ul></td>
      </tr>
   </table>
   <button onclick="Setting()">����</button>
   </nav>
   <% String ID = (String) request.getSession().getAttribute("id");
   %>
   <script>
      var id = "<%=ID%>";
      var user_ref = firebase.database().ref('Login_Data/'+id);
      var user_profile_ref = firebase.database().ref('user_profile/' + id);
      var user_course_ref = firebase.database().ref('user_course/' + id);
      
      document.getElementById("join_id").value="<%=ID%>";
      
      user_profile_ref.once('value', function(snapshot) {
          var tmp = snapshot.val();
          document.getElementById("name").value = "" + tmp.name;
          document.getElementById("major").value = "" + tmp.major;
          document.getElementById("grade").value = "" + tmp.grade;
          document.getElementById("student_id").value = "" + tmp.student_id;
          document.getElementById("email").value = "" + tmp.email;
        });
      
      var data = new Array();
      user_course_ref.once('value', function(snapshot){
         data.splice(0, data.length);
         var tmp = snapshot.val();
         data.push(tmp.l0);
         data.push(tmp.l1);
         data.push(tmp.l2);
         var list = document.getElementById("mylist");
         for(var i =0;i<data.length;i++){
            if(data[i]=='None')
               continue;
            var newli = document.createElement("li");
            newli.innerHTML=data[i];
            list.appendChild(newli);
         }
      });
      function Setting(){
         var newpw = document.getElementById("join_pw").value;
         var newname = document.getElementById("name").value;
          var newgrade = document.getElementById("grade").value;
          var newsid = document.getElementById("student_id").value;
          var newemail = document.getElementById("email").value;
          if(newpw != ""){
             user_ref.update({
                user_pw: newpw
             });
          }
          user_profile_ref.update({
             email: newemail,
             grade: newgrade,
             name : newname,
             student_id : newsid
          });
          alert("������ �Ϸ�Ǿ����ϴ�");
      }
   </script>
   <br>
</body>
</html>