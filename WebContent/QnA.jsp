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
    apiKey: "AIzaSyD5lNiLX75BJqlxHMxFN4oP6244Y3iBhvg",
    authDomain: "final-40990.firebaseapp.com",
    databaseURL: "https://final-40990.firebaseio.com",
    projectId: "final-40990",
    storageBucket: "final-40990.appspot.com",
    messagingSenderId: "59514043316"
  };
  firebase.initializeApp(config);
</script>
</head>
<style>
header
{
   width : 30%;
   height : 100%;
   float : left;
}
article
{
   width : 35%;
   height : 100%;
   float : left;
   background-color: #F7F8E0;
}
nav
{
   width : 35%;
   height : 100%;
   float : left;
   background-color: #F1F8E0;
   
}
ul.one li, ol.one li {
    padding: 5px 0px 5px 5px;
    margin-bottom: 5px;
    border-bottom: 1px solid #efefef;
    font-size: 12px;
    list-style-type: decimal-leading-zero
}
ul.two li:before,
ol.two li:before {
    content: ">";
    display: inline-block;
    vertical-align: middle;
    padding: 0px 5px 6px 0px;
}
</style>
<body>
   <header>
   
   <% String course_id = (String)request.getParameter("course_id");
      String user_id = request.getParameter("user_id");
   %>
   <table style = "background-color: #D8D8D8;">
      <tr>
         <td>과목 이름 </td> <td><input type = "text" id = "course_name" disabled = true></td>
      </tr>
      <tr>
         <td>담당 교수님</td> <td><input type= "text" id = "professor" disabled = true></td>
      </tr>
      <tr>
         <td>수업일시 </td> <td><input type= "text" id="date" disabled = true></td>
      </tr>
   </table>
   </header>
   <script>
      var user_id = "<%=user_id%>";
      var course_id = "<%=course_id%>";
      var course_data = firebase.database().ref("course_data/"+course_id);
      var course_ques = firebase.database().ref("course_data/"+course_id+"/Qus");
      var course_ans = firebase.database().ref("course_data/"+course_id+"/Ans");
      var count = 0;
      
      course_data.once('value', function(snapshot) {
          var tmp = snapshot.val();
          document.getElementById("course_name").value = "" + tmp.course_name;
          document.getElementById("professor").value = "" + tmp.professor;
          document.getElementById("date").value = "" + tmp.date;
        });
      
      course_ques.once('value', function(snapshot) {
         var qlist = document.getElementById("Ques");
          snapshot.forEach(function(childSnapshot) {
             var tmp = childSnapshot.val();
             var newli= document.createElement("li");
             var num = childSnapshot.key;
             count++;
             newli.innerHTML = tmp.question + "<br>";
//             alert(tmp.isAns);
             if(tmp.isAns == false){
               var newbutton = document.createElement("button");
               var a_path = "course_data/"+course_id+"/Ans/"+num;
                 newbutton.innerHTML = "답변하기";
                 newbutton.setAttribute("id", "q"+num);
                  newbutton.setAttribute("type", "button");
                  newbutton.setAttribute("id", "q" + num);
                  newbutton.setAttribute("onclick", "answerQ('"+ tmp.question +"', '"+ num + "', '" + a_path +"')");
                  newli.appendChild(newbutton);
             }
             qlist.appendChild(newli);
          });
        });
      
      course_ans.once('value', function(snapshot) {
            var alist = document.getElementById("Ans");
            snapshot.forEach(function(childSnapshot) {
               var tmp = childSnapshot.val();
               var newli= document.createElement("li");
               var num = childSnapshot.key;
              newli.innerHTML = tmp.answer;
              newli.setAttribute("id", "a"+childSnapshot.key);
              alist.appendChild(newli);
            });
          });
      
       
   function answerQ(question, num, a_path){
       var user_profile = firebase.database().ref("user_profile/"+user_id);
       
       var q_path = "course_data/"+course_id+"/Qus/"+num;
      var parent = document.getElementById("q"+num).parentNode;
      var child = document.getElementById("q"+num);
      
      var ans = prompt(""+question+"에 대한 답변은?");
      var course_addA = firebase.database().ref(a_path);
      var course_q = firebase.database().ref(q_path);
      if(ans != null){
         user_profile.once('value', function(snapshot){
             var tmp = parseInt((snapshot.val().point));
             tmp = tmp + 1;
             user_profile.update({point : tmp});
             alert("" + user_id + "님의 현재 점수는 " + tmp +"점 입니다");
          });
         course_addA.set({answer : ans});
         course_q.update({isAns : true});
         parent.removeChild(child);
         document.getElementById("a"+num).innerHTML = ans;
      }
   }
   function makeQuestion(){
      var ques = prompt("아래에 질문을 적어주세요");
      if(ques == "null")
         return;
      count++;
      var num = "" + count;
      var q_path = "course_data/"+course_id+"/Qus/"+num;
      var a_path = "course_data/"+course_id+"/Ans/"+num;
      var course_addQ = firebase.database().ref(q_path);
      var course_addA = firebase.database().ref(a_path);
      
      var q = {};
      q["isAns"] = false;
      q["question"] = ques;
      
      course_addQ.set(q);
      course_addA.set({answer:"답변을 기다리는 질문입니다"});
      
      var qlist = document.getElementById("Ques");
       var newli= document.createElement("li");
       var newbutton = document.createElement("button");
       newbutton.innerHTML = "답변하기";
       newbutton.setAttribute("type", "button");
       newbutton.setAttribute("id", "q"+num);
       newbutton.setAttribute("onclick", "answerQ('"+ ques +"', '"+ num +"', '" + a_path +"')");
       newli.innerHTML = ques + "<br>";
       newli.appendChild(newbutton);
       qlist.appendChild(newli);
       
       var alist = document.getElementById("Ans");
       var newli= document.createElement("li");
       newli.innerHTML = "답변을 기다리는 질문입니다";
       newli.setAttribute("id", "a" + num);
       alist.appendChild(newli);
   }
   </script>
   <article>
<!--       <h1>QnA</h1>
 -->      <h2>질문</h2>
          <hr>
      <ul id = "Ques" class = "one"></ul>
         <input type="button" onclick="makeQuestion()" value='질문하기'>
      
      
   </article>
   <nav>
   <h2>답변</h2>
      <hr>
      <ul id = "Ans" class = "one"></ul>
   </nav>
</body>
</html>