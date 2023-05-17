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
	<a href="Main.do">
		<h1 id="title" style="text-align: center; cursor: pointer;">
			ZIPSA</h1>
	</a>
	<form action="login.do" method="post">
		<div id="text">
			<!-- <form action="Main.do" method="POST"> -->
			<input type="text" id="ID" name="id" maxlength="11" placeholder="아이디"
				style="cursor: auto;"> <img id="img" src="images/1.1.jpg"
				alt="person">
		</div>

		<div id="text">
			<input type="password" id="PW" name="pw" maxlength="11"
				placeholder="비밀번호" style="cursor: auto;"> <img id="img"
				src="images/2.2.jpg" alt="lock">
			<!-- <a id="link" href="">Forgot Password?</a> -->
		</div>

		<div>
			<button id="btn" onclick="check()" style="cursor: hand;"
				type="submit">로그인</button>
		</div>
	</form>
</body>

</html>

