<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

<style type="text/css">
#active {
	background-color: rgb(0, 128, 255);
}
</style>

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
						<li><a href="goMinfo.do">예약내역</a></li>
					</ul>
				</nav>
			</header>
		</div>
	</div>

	<div class="Box">예약하기</div>
	<form action="Rv.do" method="POST">
		<table>
			<thead>
				<tr>
					<th colspan="2"></th>
				</tr>
			</thead>
			<tr class="selectBox1">
				<td class="cate">카테고리 선택</td>
				<td><select name="JOB_T" class="select1">
						<option value="가사도우미">가사도우미</option>
						<option value="이사청소">이사청소</option>
						<option value="사무실청소">사무실청소</option>
				</select></td>
			</tr>

			<!-- 주소 -->
			<tr class="selectBox2">
				<td class="meet">서비스 받으실 주소를 선택해주세요<br>&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="m--font-orange vertical-middle"></span>
				</td>
				<td>
					<button type="button" class="btn btn-info m-btn--air"
						onclick="execDaumPostcode()">🏠 주소를 등록해주세요</button> <input
					type="text" class="form-control m-input" id="postcode"
					placeholder="우편번호" readonly /> <input type="text"
					class="form-control m-input m--margin-top-10" name="address"
					id="address" placeholder="도로명 주소" readonly> <input
					type="text" class="form-control m-input m--margin-top-10"
					name="detailAddress" placeholder="상세 주소" required> <input
					name="M_ADDR" type="hidden">
				</td>
			</tr>

			<tr class="selectBox2">
				<td class="meet">반려동물이 있으신가요?</td>
				<td><select name="PET_YN" class="select1">
						<option value="Y">네, 있어요</option>
						<option value="N">아니요</option>
				</select></td>
			</tr>



			<tr class="selectBox2">
				<td><span>이전 직원 만나기</span></td>
				<td>Y<input class="meetY" type="radio" name="meet"> N<input
					class="meetN" type="radio" name="meet"></td>
			</tr>

			<!--  이전 예약내역 불러오는 현황 -->
			<tr id="staffBox" colospan="2">
				<td>
					<div class="res">
						<table id="resTable">
							<tr>

								<td>선택</td>
								<td>예약일자</td>
								<td>청소내용</td>
								<td>예약주소</td>
								<td>담당매니저</td>
							</tr>
							<c:choose>
								<c:when test="${list.isEmpty()}">
									<tr>
										<td colspan="6"><h2>예약내역이 없습니다.</h2></td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${list}" var="dto">
										<tr>
											<td><input class="rvBtn" type="radio" name="STAFF_SEQ"
												value="${dto.STAFF_SEQ}"></td>
											<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"
													value="${dto.REV_DT}" /></td>
											<td>${dto.JOB_T}</td>
											<td>${dto.m_ADDR}</td>
											<td>${dto.STAFF_NAME}</td>
										</tr>
									</c:forEach>

								</c:otherwise>
							</c:choose>

						</table>
					</div>
				</td>
			</tr>




			<tr class="selectBox2">
				<td class="meet">청소 날짜</td>
				<td><input type='text' class='datetimepicker'
					placeholder="날짜를 선택하세요" style='width: 250px;'>
					<button class="dayBtn" type="button">선택하기</button> <input
					name="REV_DT" type="hidden" class='dayvalue'></td>
			</tr>

			<tr class="selectBox2">
				<td class="meet">요청사항</td>
				<td><textarea class="form-control" cols="50" rows="4"
						placeholder="요청사항을 작성해주세요" name="REV_NOTE"></textarea></td>
			</tr>

			<tr>
				<td class="submitBtn" colspan="2" align="center"><input
					type="submit" value="예약하기"></td>
			</tr>
		</table>
	</form>

	<div id="footer-wrapper">
		<footer id="footer" class="container">
			<div class="row"></div>
		</footer>
	</div>




	<!--autoload=false 파라미터를 이용하여 자동으로 로딩되는 것을 막습니다.-->
	<script
		src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>

	<script type="text/javascript">
	

	// 직원 골랐을 경우 날짜 불러오기
    $('#staffBox').hide();
    
    $(document).ready(function() {
       
       $('.meetY').on('click', () => {
       $('#staffBox').show();
       });
       
       $('.meetN').on('click', () => {
       $('#staffBox').hide();
       });
 
    });
    
    $.datetimepicker.setLocale('ko');
    $(function() {
       $(".datetimepicker").datetimepicker({
          format : "Y-m-d H:i",
          datepicker : true,
          allowTimes : [ '10:00', '12:00', '14:00', '16:00', '18:00' ],
          minDate : 0
       });
    });   
    
    $(function () {
        $(".datetimepicker").datetimepicker({
            minTime: 0
        });
    });
    
    // 날짜 값 가져오기
    $('.dayBtn').on('click', function dayvalue() {
        var day = $('input').datetimepicker('getValue');
        var dayvalue = $('.dayvalue').val(day);
		//console.log($('.dayvalue').val(day));
    });
    
    // 직원 선택버튼 클릭시 색상 변경
    
    $('.rvBtn').click(function(){
        $('.rvBtn').removeAttr('id','active');
        $(this).attr('id','active');
        
      const value = $(this).prop('value');
      console.log(value);
      if (value != null) {
         request(value);
      }
   });
    
    
    
    // 직원의 휴무일, 예약일 불러오기
      function request(value) {
           $.ajax({
              url : 'StaffDay.do', 
              type : 'post',
              data : {
                 "STAFF_SEQ" : value
              },
              success : function(Slist) {
           $(".datetimepicker").datetimepicker({
          disabledDates: Slist,
          formatDate:'d.m.Y'
       });

              },error : function() {
                 // 요청 실패 할 시 콜백함수
                 alert("요청 실패!");
              }
         });
     };
     
     /** 우편번호 찾기 */
     function execDaumPostcode() {
         daum.postcode.load(function () {
             new daum.Postcode({
                 oncomplete: function (data) {
                     // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                     $("#postcode").val(data.zonecode);
                     $("#address").val(data.roadAddress);
                 }
             }).open();
         });
     };
	

	</script>

</body>
</html>