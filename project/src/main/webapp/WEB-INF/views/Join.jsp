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
		<form action="join.do" method="POST">
			<div class="field">
				<b>아이디</b> <span class="placehold-text"><input id="idcheck"
					type="text" name="id"></span>
				<p id="result"></p>
				<!-- 아이디 중복체크 결과를 출력하기 -->

			</div>
			<div class="field">
				<b>비밀번호</b> <input id="userpw" class="userpw" type="password" name="pw">
			</div>
			<div class="field">
				<b>비밀번호 재확인</b> <input id="userpw-confirm" class="userpw-confirm" type="password">
				<p id="pwresult"></p>
				<!-- 비밀번호 재확인 결과를 출력하기 -->
			</div>
			<div class="field">
				<b>이름</b> <input type="text" name="name">
			</div>

			<div class="field tel-number">
				<b>휴대전화</b> <select>
					<option value="">대한민국 +82</option>
				</select>
				<div>
					<input id="phoneNum" type="tel" placeholder="전화번호 입력" name="phone">
				</div>
			</div>

			<!-- 가입하기 버튼 -->
			<a href="goJoinSuccess.do"> <input id="join" type="submit" value="가입하기">
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
	$(document).ready(function () {
		var input = $('#idcheck');
		input.on('input', idCheck);
	});
	
	function idCheck () {
		var value = $(this).val();
		console.log(value);
		$.ajax({
			url : 'check.do',
			type : 'post',
			data : {
				"id" : value
			},
			// dataType : 'json',
			success : function (res) {
				console.log(res);
				
				// 만약 사용 가능하다면
				// p태그 안에 사용 가능한 이메일입니다
				var p = $('#result');
				if (res == "true"){
					p.html("사용 가능한 아이디입니다.").css("color", "green");
				} else {
					p.html("중복된 아이디입니다.").css("color", "red");
				}
				
			},
			error : function (e) {
				alert("요청 실패");
			},
			
		});
	}
		
	
	
	
	$(document).ready(function () {
		var pwinput = $('#userpw-confirm');
		pwinput.on('input', pwCheck);
	});
	
	function pwCheck () {

		var userpw = $('#userpw').val();
		var confirmpw = $('#userpw-confirm').val();
		var pwresult = $('#pwresult');

			if (userpw == confirmpw) {
				pwresult.html("비밀번호가 같습니다.").css("color", "green");
			} else {
				pwresult.html("비밀번호가 다릅니다.").css("color", "red");
			}

		};

		// 전화번호 자동하이픈 넣기
		var autoHypenPhone = function(str) {
			str = str.replace(/[^0-9]/g, '');
			var tmp = '';
			if (str.length < 4) {
				return str;
			} else if (str.length < 7) {
				tmp += str.substr(0, 3);
				tmp += '-';
				tmp += str.substr(3);
				return tmp;
			} else if (str.length < 11) {
				tmp += str.substr(0, 3);
				tmp += '-';
				tmp += str.substr(3, 3);
				tmp += '-';
				tmp += str.substr(6);
				return tmp;
			} else {
				tmp += str.substr(0, 3);
				tmp += '-';
				tmp += str.substr(3, 4);
				tmp += '-';
				tmp += str.substr(7);
				return tmp;
			}

			return str;
		}

		var phoneNum = document.getElementById('phoneNum');

		phoneNum.onkeyup = function() {
			console.log(this.value);
			this.value = autoHypenPhone(this.value);
		}
	</script>



</body>
</html>