<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />

<title></title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="assets/css/reservation.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.2/css/bootstrap-responsive.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>

</head>
<body>
	<div id="page-wrapper">
		<!-- Header -->
		<div id="header-wrapper">
			<header id="header" class="container">
				<!-- Logo -->
				<div id="logo">
					<h1>
						<a href="Main.do">ZIPSA</a>
					</h1>
				</div>

				<!-- Nav -->
				<nav id="nav">
					<ul>
						<li><a href="https://onnuribed.co.kr/">침구청소</a></li>
						<li><a href="http://thecleaning.co.kr/default/">에어컨 청소</a></li>
						<li><a href="https://wayopet.com/home">펫시팅</a></li>
						<li><a href="">예약내역</a></li>
					</ul>
				</nav>
			</header>
		</div>
	</div>

	<div>
		<p class="res">예약하기</p>
	</div>
	<form action="/Rv.do" method="post">
		<div id="Container">

			<div class="selectBox1">
				<div class="cate">카테고리 선택</div>
				<div class="cateBox">
					<select name="cate" class="select1">
						<option value="가사도우미">가사도우미</option>
						<option value="이사청소">이사청소</option>
						<option value="사무실청소">사무실청소</option>
					</select>
				</div>
			</div>

			<div class="selectBox2">
				<div>반려동물이 있으신가요?</div>
				<div class="meet">
					<select name="meet" class="select1">
						<option value="Y">네, 있어요</option>
						<option value="N">아니요</option>
					</select>
				</div>
			</div>

			<div class="selectBox2">
				<div>이전 직원 만나기</div>
				<div class="meet">
					<select name="meet" class="select1">
						<option value="Y">Y</option>
						<option value="N">N</option>
					</select>
				</div>
			</div>
			
			
			<div class="selectBox2">
				<div>청소 날짜</div>
				<div class="meet">
					<input type='text' class='datetimepicker' name='date' placeholder="날짜를 선택하세요">
					<button class="dateclick">날짜가져오기</button>
				</div>
			</div>


		</div>

		<div class="Btn">
			<input class="resbtn" type="submit" value="예약하기">
		</div>

	</form>

	<script>

		$.datetimepicker.setLocale('ko');

		$(function() {
			$(".datetimepicker").datetimepicker({
				format : "Y-m-d H:i",
				datepicker : true,
				allowTimes : [ '10:00', '12:00', '14:00', '16:00', '18:00' ]
			});
		});

		$(function() {
			$(".datetimepicker").datetimepicker({
				minDate : 0
			});
		});
		
		$('.dateclick').on('click', function() {
			var d = $('input').datetimepicker('getValue');
			console.log(d);

		});

	</script>

</body>
</html>