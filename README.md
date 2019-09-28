# 대학 교과별 질의 응답 서비스

학생들을 위한, 교과목 별 질의 응답 서비스를 제공하는 프로젝트입니다.

## Client
회원들은 각 회원이 수강하고 있는 과목에 대해 질의, 응답을 할 수 있습니다. 질문에 답변을 할 때 마다 포인트가 주어지며 MAIN page에서 모든 회원들의
Point순위를 확인할 수 있습니다. 로그인, 회원가입, My Page(회원 정보 수정), 탈퇴 등이 가능합니다.

## DB
Google Firebase를 사용했고 5개의 테이블을 사용했습니다. Login_Data, Course_Data, User_Course, User_Profile, Del_user
(데이터 베이스를 수강하지 않은 상태에서 설계한 테이블이라 정규화도 안되어있고,,,조금 미흡합니다 ㅠ)
각 테이블의 자세한 역할 및 attribute들은 '최종 보고서'에서 확인하실 수 있습니다.

## 관리자
관리자를 위한 페이지가 제공됩니다. 관리자 페이지로 가는 비밀 번호는 접속 날짜의 년도 + 달 + 일을 더한 값입니다. 
관리자 페이지에서는 회원 정보를 출력하고 회원 아이디를 기반으로 회원을 탈퇴 시킬 수 있습니다.

## Page 별 기능

WebContent 폴더 안에 포함된 코드들입니다.

+ Login.jsp
사이트를 처음 접속했을 때 사용자가 접하는 페이지입니다. 사용자의 ID와 PW를 입력 받아 로그인을 시도할 수 있습니다. 또한 회원 정보가 없는 회원은 SIGNUP 버튼을 통해 회원가입을 할 수 있습니다. 관리자는 관리자 페이지로 이동 할 수 있습니다.

+ SignUp.jsp
현재 사이트의 회원이 아닌 사람이 사이트의 회원이 될 수 있도록 합니다. 입력 받은 정보를 database에 저장해 회원으로써 관리될 수 있도록 합니다.

+ Admin.jsp
사이트를 관리하는 관리자를 위한 페이지입니다. 현재 사이트를 이용중인 회원의 목록을 볼 수 있습니다. 또한 사이트를 탈퇴한 회원의 목록, 탈퇴한 시간(년월일)과 탈퇴 사유를 볼 수 있습니다. 회원 탈퇴 기능을 제공해 관리자가 특정 회원을 탈퇴 시킬 수 있도록 합니다.

+ Main.jsp
이 페이지의 상단부에는 현재 로그인 한 사용자의 정보를 볼 수 있는 My page, 회원에서 탈퇴하는 페이지로 연결하는 버튼과 로그아웃 하는 버튼이 있습니다. 
페이지의 좌측에는 로그인한 사용자가 수강하고 있는 과목을 list로 보여줍니다. 각 과목명은 하이퍼링크로서 작동하며 해당 과목의 QnA 페이지로 넘어갈 수 있습니다.페이지의 우측 중앙부에는 사용자들의 포인트로 순위를 표현한 Rank.jsp 파일을 보여줍니다.

+ LoginServlet.java
Main.jsp에서 My Page 버튼을 누르면 Servlet 파일을 통해 MyPage.jsp로 파라미터를 전송합니다.

+ MyPage.jsp
데이터 베이스의 user_profile 테이블에서 사용자의 정보를 읽어와 화면에 출력합니다.
‘수정’ 버튼을 클릭하면 현재 <input type=”text”> 태그에 써 넣은 정보로 user_profile 데이터를 업데이트 합니다.

+ Rank.jsp
사이트를 이용중인 모든 회원의 포인트 순위를 출력한다.

+ DelUser.jsp
회원이 사이트를 탈퇴하려고 할 때 방문하게 되는 페이지입니다. 사용자에게 비밀번호를 입력 받아 일치 여부를 판단해 잘못된 페이지 탈퇴를 막고, 탈퇴사유와 탈퇴 시간을 입력 받아 관리자에게 유용한 정보를 제공합니다.

+ QnA.jsp
Main.jsp에서 수강과목 details에서 각 목록의 과목 이름 하이퍼 링크를 클릭할 때 과목의 키값(course_id)과 사용자의 id (user_id)를 url의 파라미터로 넘겨 받아서 넘겨 받은 과목의 키 값에 따라 과목의 정보를 출력하고 그 과목에 관련된 질문과 답변을 화면에 출력합니다. 
 
 
## CSS
디자인 감각없는 컴퓨터공학과 학생 두명에서 만들어서 디자인이 정말정말 X100000 엄망입니다. 참조한 오픈 css소스들은 다음과 같습니다.
-	https://nanati.me/css-button-design/ (Singup.jsp, Login.jsp, DelUser.jsp)
-	http://www.cssbuttongenerator.com/ (대부분의 button에서 사용)
-	https://cssnewbie.com/8-awesome-css-textarea-snippets/#.XBeOmVwzaUk (DelUser.jsp 에서 회원 탈퇴 사유를 입력 받는 textArea에 사용)
-	https://1stwebdesigner.com/css3-text-effects-typography/ (Rank.jsp 위의 문구 출력 <p>태그에 사용)
  
  아름다운 오픈 css를 사용했는데도 디자인이 저모양인것은....(말잇못)

