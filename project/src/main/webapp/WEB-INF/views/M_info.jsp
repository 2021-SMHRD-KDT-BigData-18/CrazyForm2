<%@page import="zipsa.entity.T_MEMBER"%>
<%@ page import="zipsa.entity.T_RESERVATION"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset='utf-8' />
<!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- fullcalendar CDN -->
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<link rel="stylesheet" href="assets/css/my_info.css" />
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
<!-- 예약내역(예약현황+내정보)
*if user=null면 goLogin.do 으로 돌아가기
★버튼에서 내정보관리 버튼 누르면 정보관련내용 나오기 Tdto에 정보관련 내용 담겨있음 get으로 받아오면됨
->버튼에서 탈퇴하기 버튼 누르면 "/delete.do" 이동 -->


	<!--  예약내역
*예약현황 보기 버튼 누르면 예약현황 출력 Rlist에 담겨있음 하나씩 출력해서 보여주도록
 -->

	<%
	List<T_RESERVATION> list = (List<T_RESERVATION>) request.getAttribute("list");
	%>
	<%
	T_MEMBER user = (T_MEMBER) session.getAttribute("user");
	%>


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
						<li><a href="goRv.do">예약하기</a></li>
						<li><a href="https://onnuribed.co.kr/">침구청소</a></li>
						<li><a href="http://thecleaning.co.kr/default/">에어컨 청소</a></li>
						<li><a href="https://wayopet.com/home">펫시팅</a></li>
						<li><a href="goreviewMain.do">리뷰보기</a></li>
					</ul>
				</nav>
			</header>
		</div>
	</div>

	<hr>
	<div class="reservation">내정보</div>
	<div class="Reservation-container">
		<div id="nav1">
			<ul>
				<li class="info1">내정보관리</li>
				<li class="res1">예약현황보기</li>
						<c:choose>
						<c:when test="${list.isEmpty()}">
							<tr>
								<td colspan="6"><h2>예약내역이 없습니다.</h2></td>
							</tr>
						</c:when>
						<c:otherwise>
				<body style="padding:30px;">
          		<!-- calendar 태그 -->
				<div id='calendar-container'>
 				   <div id='calendar'></div>
					</div>
					</c:otherwise>
					</c:choose>
					
			</ul>
		</div>


		<div class="info">
			<form action="update.do" method="POST" id="infoForm"
				style="margin-top: 30px;">
				<table>
					<tr>
						<td>ID</td>
						<td><%=user.getM_ID()%></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><%=user.getM_NAME()%></td>
					</tr>
					<tr>
						<td>휴대폰 번호</td>
						<td><%=user.getM_PHONE()%></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><%=user.getM_PW()%></td>
					</tr>
					<tr>
						<td>변경할 비밀번호를 입력하세요</td>
						<td><input name="pw" type="password"
							style="width: 100px; margin: 0 auto;"></td>
					</tr>
				</table>

				<div id="pwchange">
					<input id="pwBtn" type="submit" value="비밀번호 변경하기" class="pwBtn"
						style="width: 200px; margin: 10px 0px 0px 500px">
				</div>

				<div id="infodelete">
					<button type="button" onclick="location.href='delete.do'">탈퇴하기</button>
				</div>

			</form>
		</div>

		<%-- <div class="res">
			<table id="resTable">
					   <tr>
					<td>예약일자</td>
					<td>청소내용</td>
					<td>예약주소</td>
					<td>펫유무</td>
					<td>담당매니저</td>
					<td>요청사항</td>
				</tr> 

				
					 <c:choose>
						<c:when test="${list.isEmpty()}">
							<tr>
								<td colspan="6"><h2>예약내역이 없습니다.</h2></td>
							</tr>
						</c:when>
						<c:otherwise> 

							<c:forEach items="${list}" var="list">
								<tr>
									<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"
											value="${list.REV_DT}" /></td>
									<td>${list.JOB_T}</td>
									<td>${list.m_ADDR}</td>
									<td>${list.PET_YN}</td>
									<td>${list.STAFF_NAME}</td>
									<td>${list.REV_NOTE}</td>
								</tr>
							</c:forEach>

						</c:otherwise>
					</c:choose> --%>
				
			</table>
		</div>
	</div>

	<div id="footer-wrapper">
		<footer id="footer" class="container">
			<div class="row">
				<div class="col-3 col-6-medium col-12-small"></div>
			</div>
		</footer>
	</div>


	

	<script type="text/javascript">
	$('.res1').on('click', function() {
		
		$('#infoForm').hide();
	    $('#calendar-container').toggle();
		
	var calendarEl = $('#calendar')[0];
    var calendar = new FullCalendar.Calendar(calendarEl, {
        height: '700px', // calendar 높이 설정
        expandRows: true, // 화면에 맞게 높이 재설정
        slotMinTime: '08:00', // Day 캘린더에서 시작 시간
        slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
        // 해더에 표시할 툴바
        headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
        },
        initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
 //       initialDate: '2023-05-11', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
        navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
        editable: true, // 수정 가능?
        selectable: true, // 달력 일자 드래그 설정가능
        nowIndicator: true, // 현재 시간 마크
        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
        locale: 'ko', // 한국어 설정
        eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
            console.log(obj);
        },
        eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
            console.log(obj);
        },
        eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
            console.log(obj);
        },
        datesSet: function (info) {
            calendar.removeAllEvents();

            var currentDate = this.getDate(); // 현재 달력의 날짜 가져오기
            var currentYear = currentDate.getFullYear(); // 현재 연도
            var currentMonth = (currentDate.getMonth() + 1) + ""; // 현재 월 (0부터 시작하므로 1을 더해줌)
            currentMonth = currentMonth.length == 1 ? "0" + currentMonth : currentMonth;

            selectRvList(currentYear + '-' + currentMonth)
        },
        select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
            var title = prompt('Event Title:');
            if (title) {
                calendar.addEvent({
                    title: title,
                    start: arg.start,
                    end: arg.end,
                    allDay: arg.allDay
                })
            }
            calendar.unselect()
        },
        eventClick: function(info) {
            var event = info.event; // 클릭된 이벤트 객체
            console.log(event)
            var customProperty = event.extendedProps;
            // 클릭된 이벤트 정보를 활용하여 원하는 작업을 수행
            // 예: 이벤트 상세 정보 표시, 특정 동작 수행 등
            alert(event.title + "/" + event.id + "/" + customProperty.rdt )
            // 기타 정보는
            /*
            customProperty.addr
            customProperty.note
            customProperty.petYn
            customProperty.seq
            customProperty.staffSeq
             */

            console.log('이벤트가 클릭되었습니다.');
            console.log(customProperty)

            // 추가 작업 수행 가능
        },
        // 이벤트
        events: []
    });

    function selectRvList(YM) {
        $.ajax({
            url : 'rvInfo.do',     // rvinfo는 모든회원, minfo 내 예약정보를 가져오는 데이터베이스 URL로 수정?
            type : 'post',
            data : {
                "YM" : YM    // ym 대신 rv. ~~ 로 하기를 권장 
            },
            success : function (res) {
                var result = JSON.parse(res);
                console.log(result);
                console.log(calendar)

                for (var i = 0; i < result.length; i++) {
                    console.log(result[i])
                    var rv = result[i];
                    
                    // 132, 137 (캘린더 시간대 나오게 하는 코드)
                    // 2시간 간격 (아래 두줄 추가)
                    var date = new Date(rv.REV_DT)
                    date.setHours(date.getHours() + 2)

                    var newEvent = {
                    	// end 추가함, start: dateFormat에서 dateTimeFormat함수로 교체 
                        title: rv.JOB_T,
                        start: dateTimeFormat(rv.REV_DT),
                        end: dateTimeFormat(date),
                        rdt: dateTimeFormat(rv.REV_DT),
                        note: rv.REV_NOTE,
                        addr: rv.M_ADDR,
                        id: rv.M_ID,
                        petYn: rv.PET_YN,
                        seq: rv.REV_SEQ,
                        staffSeq: rv.STAFF_SEQ 
                    }
                    calendar.addEvent(newEvent);
                }
            },
            error : function (e) {
                alert("요청 실패");
            },
        });
    }

    function getDate() {
        var today = new Date();
        var year = today.getFullYear(); // 년도
        var month = String(today.getMonth() + 1).padStart(2, '0'); // 월 (0부터 시작하므로 1을 더해줌)
        return year + '-' + month;
    }

    function dateTimeFormat(date) {
        return getDateFormat(date, true);
    }

    function dateFormat(date) {
        return getDateFormat(date, false);
    }

    function getDateFormat(date, timeFlag) {
        var dateObj = new Date(date);

        var year = dateObj.getFullYear(); // 연도
        var month = String(dateObj.getMonth() + 1).padStart(2, '0'); // 월 (0부터 시작하므로 1을 더해줌)
        var day = String(dateObj.getDate()).padStart(2, '0'); // 일
        var hours = String(dateObj.getHours()).padStart(2, '0'); // 시간
        var minutes = String(dateObj.getMinutes()).padStart(2, '0'); // 분
        var seconds = String(dateObj.getSeconds()).padStart(2, '0'); // 초

        var formattedDate = year + '-' + month + '-' + day;
        return timeFlag ? formattedDate + ' ' + hours + ':' + minutes + ':' + seconds : formattedDate
    }

    calendar.render();
	});
	
		$('.info1').on('click', function() {
			$('#infoForm').toggle();
            $('#calendar-container').hide();
		});
		

		$('#pwBtn').on('click', function() {
			alert('비밀번호 변경이 완료되었습니다.');
		});
	</script>

</body>
</html>