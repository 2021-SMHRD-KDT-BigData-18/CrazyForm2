<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <b>아이디</b>
            <span class="placehold-text"><input type="text"></span>
            <p id="result"></p> <!-- 아이디 중복체크 결과를 출력하기 -->
        </div>
        <div class="field">
            <b>비밀번호</b>
            <input class="userpw" type="password">
        </div>
        <div class="field">
            <b>비밀번호 재확인</b>
            <input class="userpw-confirm" type="password">
        </div>
        <div class="field">
            <b>이름</b>
            <input type="text">
        </div>

		<div class="field tel-number">
            <b>휴대전화</b>
            <select>
                <option value="">대한민국 +82</option>
            </select>
            <div>
                <input type="tel" placeholder="전화번호 입력">
            </div>
        </div>

        <!-- 가입하기 버튼 -->
        <a  href="join.do">
        <input id="join" type="submit" value="가입하기">         </a>

        <!-- 푸터 -->
        <div class="member-footer">
            <div>
                <span>이용약관</span>
                <span>개인정보처리방침</span>
            </div>
            <span><a href="#">ZIPSA Corp.</a></span>
        </div>
    </div>


	<script>

		
		var join = $('#join');
		join.on('click', ()=>{
			// 만약에 회원가입에 성공했다면~~
			
			alert('회원가입에 성공하셨습니다! 메인화면에서 로그인을 해주세요.');
			// 성공하지 못 했다면~~
			// alert('회원가입에 실패하셨습니다. 다시 한 번 시도해주세요.')
		});
		
	</script>
	


</body>
</html>