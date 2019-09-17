<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
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
   sort()
   var obj = new Array();
    var sorted = new Array();
   function sort() {
      table = document.getElementById("ranking");
      var user_d = firebase.database().ref('user_profile');
      user_d.once('value', function(snapshot) {
         snapshot.forEach(function(childSnapshot) {
            var tmp = childSnapshot.val();
            var point = tmp.point;
            //console.log(tmp.point);
            obj.push(tmp.point);
         });
         sorted = obj.sort(function(a, b) {
            return b - a;
         });
         //alert(JSON.stringify(sorted));//���ⲥ�� �迭�� ����Ʈ�� �ִ� ����
         showRanking(sorted);
         return;
         //alert(JSON.stringify(obj));//���ⲥ�� �迭�� ����Ʈ�� �ִ� ����
      });//user_profile�� ���� ����Ʈ ������ ������ ������������ ����
      //showRanking(obj);//���� point�� �������� ���̺� ������ ����� ����.

   }
   function showRanking(obj) {
      var now;
      var previous = -1;
      table = document.getElementById("ranking");
      for (var i = 0; i < obj.length; i++) {
         now = obj[i];
         if(now != previous)
	         show(now);//���ĵ� ���� �����γѰܼ�, �� ����Ʈ�� �ش��ϴ� ���� ���� ���
    	 previous = obj[i];;
      }
   }
   function show(value)//����Ʈ�� �ش��ϴ� ���� ������ ����ϴ� �Լ�
   {      
      var user_data = firebase.database().ref('user_profile');
      user_data.on('value', function(snapshot) {
         snapshot.forEach(function(childSnapshot) {
            var tmp = childSnapshot.val();
            if (tmp.point == value) {
               new_tr = document.createElement("tr");

               td_id = document.createElement("td");
               td_id.innerHTML = tmp.id;
               new_tr.appendChild(td_id);
               //���̵�
               td_name = document.createElement("td");
               td_name.innerHTML = tmp.name;
               new_tr.appendChild(td_name);
               //�̸�
               td_grade = document.createElement("td");
               td_grade.innerHTML = tmp.grade;
               new_tr.appendChild(td_grade);
               //�г�
               td_major = document.createElement("td");
               td_major.innerHTML = tmp.major;
               new_tr.appendChild(td_major);
               //����
               td_point = document.createElement("td");
               td_point.innerHTML = tmp.point;
               new_tr.appendChild(td_point);
               //point          

               table.appendChild(new_tr);

            }

         });
      });
   }
</script>
</head>
<style>
 table {
    width: 100%;
    border-top: 1px solid #2E64FE;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #2E64FE;
    padding: 10px;
    text-align: center;
  }
  th {
    background-color: #2E64FE;
  }
  td {
    background-color: #81BEF7;
  }
blockquote {
   width: 100%;
   max-width: 480px;
   background: #f9f9f9;
   border-left: 10px solid #dedede;
   margin: 1.5em auto;
   padding: 1em;
   quotes: "\201C" "\201D" "\2018" "\2019";
}

blockquote:before {
   color: #ccc;
   content: open-quote;
   font-size: 4em;
   line-height: .1em;
   margin-right: .25em;
   vertical-align: -.4em;
}

blockquote p {
   display: inline;
}
</style>
<body>
   <h3>
      Ranking
      <hr>
   </h3>
   <blockquote>
      �亯�� ���� �� ����� �����Դϴ�. <br> ������ ������ ������ ���ο��� ������ �ִ� ����Ʈ�� �Ǳ⸦ ����մϴ�:)
   </blockquote>

   <table id="ranking" border=1>
      <tr>
         <th>ID</th>
         <th>�̸�</th>
         <th>�г�</th>
         <th>����</th>
         <th>����Ʈ</th>
      </tr>
   </table>
</body>
</html>