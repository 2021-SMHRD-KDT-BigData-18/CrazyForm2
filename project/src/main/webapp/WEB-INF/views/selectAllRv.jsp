<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="assets/css/selectAllRv.css" />
    <style>

        /* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
        .fc-header-toolbar {
            padding-top: 1em;
            padding-left: 1em;
            padding-right: 1em;
        }
    </style>
</head>
<body class="is-preload homepage">

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
                        <li><a href="goreviewMain.do">리뷰보기</a></li>
                    </ul>
                </nav>
            </header>
        </div>
    </div>

<div class="Box">관리자 예약확인</div>
<!-- calendar 태그 -->
<div id='calendar-container'>
    <div id='calendar'></div>
</div>

	<div id="footer-wrapper">
		<footer id="footer" class="container">
			<div class="row"></div>
		</footer>
	</div>
	
<script>
    var calendarEl = $('#calendar')[0];
    var calendar = new FullCalendar.Calendar(calendarEl, {
    	contentHeight: 600,
        //height: '700px', // calendar 높이 설정
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
        	 var customProperty = obj.event.extendedProps;
        	 $.ajax({
   	            url : 'updateRvInfo.do',
   	            type : 'post',
   	            data : {
   	                "seq" : customProperty.seq,
   	                "date" : getDateFormat(obj.event.start, true),
   	                "staffSeq" : customproperty.staffSeq   	                
   	            },
   	            // 521
   	            success : function (res) {
   	                console.log("saved");
   	            },
   	            error : function (e) {
   	                alert("요청 실패");
   	            },
   	        });   		 
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
            alert("ID :" + event.id + "\n청소카테고리 :  " + event.title  + "\n예약일자 : " + customProperty.rdt 
            		+ "\n요청사항 : "+ customProperty.note +"\n담당매니저이름 : " + customProperty.staffName )
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
            url : 'rvInfo.do',
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
                        seq: rv.REV_SEQ,
                        petYn: rv.PET_YN,
                        staffSeq: rv.STAFF_SEQ,
                        staffName: rv.STAFF_NAME
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
    // selectRvList(getDate());
</script>
</body>
</html>