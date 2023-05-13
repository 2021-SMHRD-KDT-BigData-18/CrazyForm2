<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<head>
<title>로그인화면</title>
<link rel="stylesheet" href="assets/css/Login.css">
</head>

<body>

	<h1 id="title" style="text-align: center;">
		Zipsa
		</p>

		<div id="text">
			<input type="text" id="ID" maxlength="11" placeholder="아이디">
			<img id="img" src="images/KakaoTalk_20230512_110240769.jpg"
				alt="person">
		</div>

		<div id="text">
			<input type="password" id="PW" maxlength="11" placeholder="비밀번호">
			<img id="img" src="images/zibsalogo.png" alt="lock">
			<!-- <a id="link" href="">Forgot Password?</a> -->
		</div>

		<div>
			<button onclick="check()">로그인</button>
		</div>
		
</body>

</html>

