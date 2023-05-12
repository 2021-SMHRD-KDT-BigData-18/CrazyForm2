<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">

<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">

<link rel="stylesheet" href="style.css">

</head>

<body>
	<div class="logo image">
		<img
			src="https://i.pinimg.com/236x/d6/94/a9/d694a9545a6b832b292d69f30a54321b.jpg">
	</div>
	<br>
	<br>
	<form>
		<div class="form-group">
			<input type="email" class="form-control" id="exampleInputEmail1"
				aria-describedby="emailHelp" placeholder="아이디">
		</div>

		<div class="form-group">
			<input type="password" class="form-control"
				id="exampleInputPassword1" placeholder="비밀번호">
		</div>

		<div class="login-button">
			<div button type="login" class="btn btn-primary">
				로그인
				</button>
			</div>
		</div>
		<div class="form-check">
			<div>
				<input type="checkbox" class="form-check-input" id="exampleCheck1">
				<label class="form-check-label" for="exampleCheck1">로그인 상태
					유지</label>
			</div>
		</div>




		<br> <br>
		<footer class="footer">
			<div class="footer-info">아이디 찾기 | 비밀번호 찾기 | 회원가입</div>
		</footer>
</body>
</html>

