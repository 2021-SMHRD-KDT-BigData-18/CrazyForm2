<%@page import="zipsa.entity.T_MEMBER"%>
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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<!-- iamport.payment.js -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<link rel="stylesheet" href="assets/css/popup.css" />
<script type="text/javascript">
	function setCookie(name, value, expiredays) {
		var todayDate = new Date();
		todayDate.setDate(todayDate.getDate() + expiredays);
		document.cookie = name + "=" + escape(value) + "; path=/; expires="
				+ todayDate.toGMTString() + ";"
	}
	function closePop() {
		if (document.pop_form.chkbox.checked) {
			setCookie("maindiv", "done", 1);
		}
		document.all['layer_popup'].style.visibility = "hidden";
		//self.close();

	}
</script>
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
						<li><a href="https://form.office.naver.com/form/responseView.cmd?formkey=MmYxMTE2MzUtYWQwNi00ZGZjLTgxMzYtZmQ1NDVlYjQ5ZmRk&sourceId=urlshare">에어컨 청소</a></li>
						<li><a href="https://wayopet.com/home">펫시팅</a></li>
						<li><a href="goMinfo.do">내 정보</a></li>
						<li><a href="goreviewMain.do">리뷰보기</a></li>
					</ul>
				</nav>
			</header>
		</div>
	</div>
	<hr>
	
			<!-- 팝업 부분 -->
		<div class="layerPopup" id="layer_popup" style="visibility: visible;">
			<div class="layerBox">
				<h4 class="title">예약 주의사항</h4>
				<div class="cont">
					<p>
						<img id="popImg" src="images/clean3.jpg" width=350 height=300 usemap="#popup"
							alt="event page">
							<br>결제하기 버튼 클릭! <br>예약금 결제 후 <br> 예약하기를 눌러주세요!
					</p>
				</div>
				<form id="popBtn" name="pop_form">
					<div id="check">
						<p id="todayBtn" for="chkbox">&nbsp&nbsp오늘 하루동안 보지 않기</label>
						<input type="checkbox" name="chkbox" value="checkbox" id='chkbox'>
					</div>
					<div id="close">
						<a id="closeBtn" onclick="closePop();">닫기</a>
					</div>
				</form>
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
				<td rowspan="2">
				<!-- <select name="JOB_T" class="select1">
						<option value="가사도우미">가사도우미</option>
						<option value="이사청소">이사청소</option>
						<option value="사무실청소">사무실청소</option>
					</select> -->	
					
					 <div class="select">
     					<input value="가사도우미" type="radio" id="select1" name="JOB_T"><label for="select1">가사도우미</label>
     					<input value="이사청소" type="radio" id="select2" name="JOB_T"><label for="select2">이사청소</label>
     					<input value="사무실청소" type="radio" id="select3" name="JOB_T"><label for="select3">사무실청소</label>
					</div>
					
					
				</td>
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
				<td rowspan="2">
					<!--  Y<input class="meetY" type="radio" name="meet">
				    N<input class="meetN" type="radio" name="meet">-->
				    <div class="select">
     					<input class="meetY" type="radio" id="meetY" name="meet"><label for="meetY">이전직원 만나기</label>
     					<input class="meetN" type="radio" id="meetN" name="meet"><label for="meetN">만나지 않기</label>
					</div>
				</td>
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
							<c:forEach items="${list}" var="dto">
								<tr>
									<td><input class="rvBtn" type="radio" name="STAFF_SEQ"
										value="${dto.STAFF_SEQ}"></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd kk:mm:ss"
											value="${dto.REV_DT}" /></td>
									<td>${dto.JOB_T}</td>
									<td>${dto.m_ADDR}</td>
									<td>${dto.STAFF_NAME}</td>
								</tr>
							</c:forEach>

						</table>
					</div>
				</td>
			</tr>




			<tr class="selectBox2">
				<td class="meet">청소 날짜</td>
				<td><input type='text' class='datetimepicker'
					placeholder="여기를 클릭하세요" style='width: 250px;'>
					<button class="dayBtn" type="button">선택</button> <input
					name="REV_DT" type="hidden" class='dayvalue'></td>
			</tr>
			
			<tr class="selectBox2">
				<td rowspan="2">
					<!--  <select name="PET_YN" class="select1">
						<option value="Y">네, 있어요</option>
						<option value="N">아니요</option>
					</select>-->
					
					 <div class="select">
     					<input value="Y" type="radio" id="Y" name="PET_YN"><label for="Y">반려동물 있음</label>
     					<input value="N" type="radio" id="N" name="PET_YN"><label for="N">반려동물 없음</label>
					</div>
					
				</td>
			</tr>

			<tr class="selectBox2">
				<td class="meet">요청사항</td>
				<td><textarea class="form-control" cols="50" rows="4"
						placeholder="요청사항을 작성해주세요" name="REV_NOTE"></textarea></td>
			</tr>

			
		
		
				<td class="submitBtn" colspan="2" align="center">
				<input type="submit" value="예약하기" id="submitBtn2"></td>
			
	</table>
	</form>
	<div id="payBtnBox">
		<button id="payBtn" onclick="requestPay()">결제하기</button>
	</div>
	</div>
	

	<div id="footer-wrapper">
		<footer id="footer" class="container">
			<div class="row"></div>
		</footer>
	</div>




	<!--autoload=false 파라미터를 이용하여 자동으로 로딩되는 것을 막습니다.-->
	<script
		src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>

	<script type="text/javascript">
	

	
	
	// 직원 골랐을 경우 날짜 불러오기 (예약 내역 없을 시 띄워주기)
    
    $(document).ready(function() {
    	$('#staffBox').hide();
       
       $('.meetY').on('click', () => {
       		if(${list.isEmpty()}) {
       			Swal.fire({
    	            icon: 'warning',                 // Alert 타입
    	            title: '예약내역이 없습니다.',         // Alert 제목
    	        });
       		} else {
       			$('#staffBox').show();
       			
       		}
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
          minDate : '+1970/01/02'
       });
    });   

    
    // 날짜 값 가져오기
    $('.dayBtn').on('click', function dayvalue() {
        var day = $('input').datetimepicker('getValue');
        var dayvalue = $('.dayvalue').val(day);
		//console.log($('.dayvalue').val(day));
		alert('날짜 선택이 완료되었습니다.');
    });
    
    // 직원 선택버튼 클릭시 값 가져오기
    
    $('.rvBtn').click(function(){
        
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
          formatDate:'d.m.Y',
          minDate : '+1970/01/02'
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
	<script type="text/javascript">
	var IMP = window.IMP;
    IMP.init("imp80838354"); // 예: imp00000000

    function requestPay() {
        // IMP.request_pay(param, callback) 결제창 호출
        IMP.request_pay({ // param
            pg: "html5_inicis",
            pay_method: "card",
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: "예약금",
            amount: 10000,
        }, function (rsp) { // callback
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                msg += '\n고유ID : ' + rsp.imp_uid;
                msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                msg += '\n결제 금액 : ' + rsp.paid_amount;
                msg += '\n카드 승인번호 : ' + rsp.apply_num;
                
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
        });
    };
	</script>
	<script>
		window.kakaoAsyncInit = function() {
			Kakao.Channel.createAddChannelButton({
				container : '#kakao-talk-channel-add-button',
			});
		};
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = 'https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.channel.min.js';
			js.integrity = 'sha384-MEvxc+j9wOPB2TZ85/N6G3bt3K1/CgHSGNSM+88GoytFuzP4C9szmANjTCNfgKep';
			js.crossOrigin = 'anonymous';
			fjs.parentNode.insertBefore(js, fjs);
		})(document, 'script', 'kakao-js-sdk');

		cookiedata = document.cookie;
		if (cookiedata.indexOf("maindiv=done") < 0) {
			//document.all['layer_popup'].style.visibility = "visible";
			document.getElementById('layer_popup').style.display = "block";
		} else {
			//document.all['layer_popup'].style.visibility = "hidden";
			document.getElementById('layer_popup').style.display = "none";
		}
	</script>

</body>
</html>