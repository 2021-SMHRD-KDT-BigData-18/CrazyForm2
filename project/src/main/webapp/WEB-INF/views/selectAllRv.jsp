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
    <style>
        /* body 스타일 */
        html, body {
            overflow: hidden;
            font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
            font-size: 14px;
        }
        /* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
        .fc-header-toolbar {
            padding-top: 1em;
            padding-left: 1em;
            padding-right: 1em;
        }
    </style>
</head>
<body style="padding:30px;">
<!-- calendar 태그 -->
<div id='calendar-container'>
    <div id='calendar'></div>
</div>
<script>
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
            url : 'rvInfo.do',
            type : 'post',
            data : {
                "YM" : YM
            },
            success : function (res) {
                var result = JSON.parse(res);
                console.log(result);
                console.log(calendar)

                for (var i = 0; i < result.length; i++) {
                    console.log(result[i])
                    var rv = result[i];
                    var newEvent = {
                        title: rv.JOB_T,
                        start: dateFormat(rv.REV_DT),
                  //      end: dataFormat(rv.REV_DT),   이거 왜됨...??? 짜증 ㅡㅡ
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
    // selectRvList(getDate());
</script>
</body>
</html>