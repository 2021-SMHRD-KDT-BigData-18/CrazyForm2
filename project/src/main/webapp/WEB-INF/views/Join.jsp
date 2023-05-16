<%@page import="zipsa.dao.T_MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="assets/css/join.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="shortcut icon" href="#">
</head>
<body>
	<!-- <form action="#" method="POST">
		<input id="check" name="id" type="text"
			placeholder="ID를 입력하세요">
			<p id="result"></p> 이메일 중복체크 결과를 출력하기
		<input name="pw" type="password" placeholder="PW를 입력하세요">
		<input name="name" type="text" placeholder="이름을 입력하세요">
		<input name="phone" type="text" placeholder="전화번호를 입력하세요">
		<input name="address" type="text" placeholder="집주소를 입력하세요">
		<input type="submit" value="회원가입" class="button fit">
	</form> -->
	<div class="member">

		<!-- 필드 -->
			<div class="field">
				<b>아이디</b> <span class="placehold-text"><input type="text" name="id"></span>
				<p id="result"></p>
				<!-- 아이디 중복체크 결과를 출력하기 -->
				<button id="check">아이디중복확인</button>
		<form action="join.do" method="POST">

			</div>
			<div class="field">
				<b>비밀번호</b> <input class="userpw" type="password" name="pw">
			</div>
			<div class="field">
				<b>비밀번호 재확인</b> <input class="userpw-confirm" type="password">
			</div>
			<div class="field">
				<b>이름</b> <input type="text" name="name">
			</div>

			<div class="field tel-number">
				<b>휴대전화</b> <select>
					<option value="">대한민국 +82</option>
				</select>
				<div>
					<input type="tel" placeholder="전화번호 입력" name="phone">
				</div>
			</div>

			<!-- 가입하기 버튼 -->
			<a href="join.do"> <input id="join" type="submit" value="가입하기">
			</a>

		</form>
		<!-- footer -->
		<div class="member-footer">
			<div>
				<span>이용약관</span> <span>개인정보처리방침</span>
			</div>
			<span><a href="#">ZIPSA Corp.</a></span>
		</div>
	</div>



	<script>
	// id 중복확인 → 아이디 중복체크 후 alert창 띄우기
	$('#check').on('click', request);
	let id = $('input[name=id]');
	let result = "";
	function request() { //함수 호이스팅:선언문이 먼저 실행됨
		$.ajax({
			url : 'check.do', 			// 요청할 서버경로
			type : 'post', 				// get/post
			data : { 					// 서버에 보낼 데이터
				// data : "data1=value1&data2=value2..."
				// key : value (key값이 parameter의 name 들어감)
				"id" : id.val()
			},
			dataType : "json",			// 응답받는 데이터 형식 결정
			success : function(res) {
				alert("사용가능한 id입니다. 계속진행해주세요")
			},
			error : function(e) {
				// 요청 실패 할 시 콜백함수
				alert("이미 존재하는 id입니다. 다시 확인해주세요")
			}
		});
	}
	// 회원가입 후 alert창 띄우기
		var join = $('#join');
		join.on('click', ()=>{
			alert('회원가입에 성공하셨습니다! 메인화면에서 로그인을 해주세요.');
		});
		
	// 전화번호 자동하이픈 넣기
		var phoneNum = $('input[name=phone]');
		var str = "";
		var tmp = '';
		var autoHypenPhone = function(str){
     	 str = str.replace(/[^0-9]/g, '');
    	  var tmp = '';
      if( str.length < 4){
          return str;
      }else if(str.length < 7){
          tmp += str.substr(0, 3);
          tmp += '-';
          tmp += str.substr(3);
          return tmp;
      }else if(str.length < 11){
          tmp += str.substr(0, 3);
          tmp += '-';
          tmp += str.substr(3, 3);
          tmp += '-';
          tmp += str.substr(6);
          return tmp;
      }else{              
          tmp += str.substr(0, 3);
          tmp += '-';
          tmp += str.substr(3, 4);
          tmp += '-';
          tmp += str.substr(7);
          return tmp;
      }
}
		phoneNum.onkeyup = function(){
 		 console.log(this.val());
  		this.val() = autoHypenPhone( this.val() ) ;  
}

	</script>



</body>
</html>