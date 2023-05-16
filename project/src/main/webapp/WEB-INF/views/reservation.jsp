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

	<form action="/Rv.do" method="post">
		<div>

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

			<div class="container-fluid px-0 px-sm-4 mx-auto">
				<div class="row justify-content-center mx-0">
					<div class="col-lg-10">
						<div class="card border-0">
							<div class="card-header bg-dark">
								<div
									class="mx-0 mb-0 row justify-content-sm-center justify-content-start px-1">
									<input type="text" id="dp1" class="datepicker"
										placeholder="날짜 선택" name="date" readonly><span
										class="fa fa-calendar"></span>
								</div>
							</div>
							<div class="card-body p-3 p-sm-5">
								<div class="row text-center mx-0">
									<div class="col-md-2 col-4 my-1 px-2">
										<div class="cell py-1">10:00AM</div>
									</div>
									<div class="col-md-2 col-4 my-1 px-2">
										<div class="cell py-1">12:00PM</div>
									</div>
									<div class="col-md-2 col-4 my-1 px-2">
										<div class="cell py-1">14:00PM</div>
									</div>
									<div class="col-md-2 col-4 my-1 px-2">
										<div class="cell py-1">16:00PM</div>
									</div>
									<div class="col-md-2 col-4 my-1 px-2">
										<div class="cell py-1">18:00PM</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

		<div class="Btn">
			<input class="resbtn" type="submit" value="예약하기">
		</div>

	</form>

	<script>
		$(document).ready(function() {

			$('.datepicker').datepicker({
				format : 'dd-mm-yyyy',
				autoclose : true,
				startDate : '0d'
			});

			$('.cell').click(function() {
				$('.cell').removeClass('select');
				$(this).addClass('select');
			});

		});
	</script>

</body>
</html>