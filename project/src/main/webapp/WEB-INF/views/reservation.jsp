<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />

<title></title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="assets/css/reservation2222.css">
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
	
	<div class="Box">예약하기</div>
	 <form action="/Rv.do" method="POST">
        <table>
            <thead>
                <tr>
                    <th colspan="2"></th>
                </tr>
            </thead>
            <tr class="selectBox1">
                <td class="cate">카테고리 선택</td>
                <td>
                    <select name="cate" class="select1">
                        <option value="가사도우미">가사도우미</option>
                        <option value="이사청소">이사청소</option>
                        <option value="사무실청소">사무실청소</option>
                    </select>
                </td>
            </tr>
            <tr class="selectBox2">
                <td class="meet">반려동물이 있으신가요?</td>
                <td>
                    <select name="meet" class="select1">
                        <option value="Y">네, 있어요</option>
                        <option value="N">아니요</option>
                    </select>
                </td>
            </tr>
            <tr class="selectBox2">
                <td class="meet">이전 직원 만나기</td>
                <td>
                    <input type="radio" name="meet"> Y
                    <br>
                    <input type="radio" name="meet"> N
                </td>
            </tr>
            <tr class="selectBox2">
                <td class="meet">청소 날짜</td>
                <td>
                    <input type='text' class='datetimepicker' 
                    	placeholder="날짜를 선택하세요" name='start_dt' style='width:250px;'>
                </td>
            </tr>
            
            <tr class="selectBox2">
                <td class="meet">요청사항</td>
                <td>
                    <textarea class="form-control"
            			cols="50" rows="4" placeholder="요청사항을 작성해주세요"></textarea>
                </td>
            </tr>

            <tr>
                <td class="submitBtn" colspan="2" align="center">
                    <input action="#" type="submit" value="예약하기">
                </td>
            </tr>
        </table>
    </form>
    
    <div id="footer-wrapper">
		<footer id="footer" class="container">
			<div class="row">
			</div>
		</footer>
	</div>
    
    
    
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
		
		
		// $('.dateclick').on('click', function() {
		//	var d = $('input').datetimepicker('getValue');
		//	console.log(d);
		//	});

	</script>

</body>
</html>