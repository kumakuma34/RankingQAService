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
         //alert(JSON.stringify(sorted));//여기꺄지 배열에 포인트를 넣는 과정
         showRanking(sorted);
         return;
         //alert(JSON.stringify(obj));//여기꺄지 배열에 포인트를 넣는 과정
      });//user_profile로 부터 포인트 정보를 가져와 내림차순으로 정렬
      //showRanking(obj);//이제 point를 기준으로 테이블에 정보를 출력할 것임.

   }
   function showRanking(obj) {
      var now;
      var previous = -1;
      table = document.getElementById("ranking");
      for (var i = 0; i < obj.length; i++) {
         now = obj[i];
         if(now != previous)
	         show(now);//정렬된 값을 변수로넘겨서, 그 포인트에 해당하는 유저 정보 출력
    	 previous = obj[i];;
      }
   }
   function show(value)//포인트에 해당하는 유저 정보를 출력하는 함수
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
      답변을 많이 단 사람의 순위입니다. <br> 서로의 지식을 나누고 서로에게 도움을 주는 사이트가 되기를 희망합니다:)
   </blockquote>

   <table id="ranking" border=1>
      <tr>
         <th>ID</th>
         <th>이름</th>
         <th>학년</th>
         <th>전공</th>
         <th>포인트</th>
      </tr>
   </table>
</body>
</html>