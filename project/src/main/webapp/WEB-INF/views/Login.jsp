<%@page import="zipsa.entity.T_MEMBER"%>
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
		ZIPSA
		</p>
		<form action="login.do" method="POST">
			<div id="text">
				<input type="text" cursor="pointer" id="ID" maxlength="11"
					placeholder="아이디" name="id"> <img id="img"
					src="images/1.1.jpg" alt="person">
			</div>

			<div id="text">
				<input type="password" cursor="pointer" id="PW" maxlength="11"
					placeholder="비밀번호" name="pw"> <img id="img"
					src="images/2.2.jpg" alt="lock">
				<!-- <a id="link" href="">Forgot Password?</a> -->
			</div>

			<div>
				<button type="submit" id="btn" onclick="check()">로그인</button>
		</form>


		</div>
</body>

</html>

