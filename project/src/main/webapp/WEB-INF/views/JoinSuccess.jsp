<%@page import="zipsa.entity.T_MEMBER"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/JoinSuccess.css" />
</head>

<body>
	
	<% T_MEMBER user = (T_MEMBER)session.getAttribute("user"); %>
	<!-- 회원가입 성공화면 -->

	<div id="title">
		<h1>
			<a href="Main.do"> ZIPSA </a>
		</h1>
	</div>
		<div>
			<h1>환영합니다!</h1>
			<p>회원가입을 축하합니다.</p>
			<p>메인화면에서 로그인을 해주세요.</p>
		</div>
		<div class="start">
		<a href="Main.do"> 
			<button>시작하기</button>
		</a>
		</div>
	</div>


</body>
</html>