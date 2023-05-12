<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />

<title>달력</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- <script src="assets/js/calendar.js"></script>-->
<link rel="stylesheet" href="assets/css/reservation.css" />
<link rel="shortcut icon" href="#">

</head>
<body>
	<div id="form">
			<form action="/Rv.do" method="post">
			<div>
				<div class="clean">
					<p>청소카테고리 선택</p>

					<p>
						가사도우미 <input class="jobT" type="radio" name="jobT" value="가사도우미"
							autofocus>
					</p>

					<p>
						이사청소 <input class="jobT" type="radio" name="jobT" value="입주청소">
					</p>

					<p>
						사무실청소 <input class="jobT" type="radio" name="jobT" value="사무실청소">
					</p>
					<span>이전 직원 만나기</span> Y<input class="meet" type="radio" name="Y">
					N<input class="meet" type="radio" name="N">

				</div>
			</div></div>
			
						<table class="Calendar">
							<thead>
								<tr>
									<td onClick="prevCalendar();" style="cursor: pointer;">&#60;</td>
									<td colspan="5"><span id="calYear"></span>년 <span
										id="calMonth"></span>월</td>
									<td onClick="nextCalendar();" style="cursor: pointer;">&#62;</td>
								</tr>
								<tr>
									<td>일</td>
									<td>월</td>
									<td>화</td>
									<td>수</td>
									<td>목</td>
									<td>금</td>
									<td>토</td>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>

						<div id="div">
							<div class="one">
								<p>시간은 언제가 좋으신가요?</p>
							</div>

							<div class="two">
								<p>
									<input type="radio" name="time"> 오전 10시 ~ 오후 1시
								</p>
								<p>
									<input type="radio" name="time"> 오후 1시 ~ 오후 4시
								</p>
								<p>
									<input type="radio" name="time"> 오후 4시 ~ 오후 7시
								</p>
								<p>
									<input type="radio" name="time"> 오후 5시 ~ 오후 8시
								</p>
							</div>
							<br>
							<div class="one">
								<p>혹시 반려동물이 있으신가요?</p>
							</div>

							<div class="two">
								<p>
									<input type="radio" name="animal"> 네, 있어요
								</p>
								<p>
									<input type="radio" name="animal"> 아니오
								</p>
							</div>
						</div>
				</div>
			</form>
				<script>
					window.onload = function() {
						buildCalendar();
					} // 웹 페이지가 로드되면 buildCalendar 실행

					let nowMonth = new Date(); // 현재 달을 페이지를 로드한 날의 달로 초기화
					let today = new Date(); // 페이지를 로드한 날짜를 저장
					today.setHours(0, 0, 0, 0); // 비교 편의를 위해 today의 시간을 초기화

					// 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
					function buildCalendar() {

						let firstDate = new Date(nowMonth.getFullYear(),
								nowMonth.getMonth(), 1); // 이번달 1일
						let lastDate = new Date(nowMonth.getFullYear(),
								nowMonth.getMonth() + 1, 0); // 이번달 마지막날

						let tbody_Calendar = document
								.querySelector(".Calendar > tbody");
						document.getElementById("calYear").innerText = nowMonth
								.getFullYear(); // 연도 숫자 갱신
						document.getElementById("calMonth").innerText = leftPad(nowMonth
								.getMonth() + 1); // 월 숫자 갱신

						while (tbody_Calendar.rows.length > 0) { // 이전 출력결과가 남아있는 경우 초기화
							tbody_Calendar
									.deleteRow(tbody_Calendar.rows.length - 1);
						}

						let nowRow = tbody_Calendar.insertRow(); // 첫번째 행 추가           

						for (let j = 0; j < firstDate.getDay(); j++) { // 이번달 1일의 요일만큼
							let nowColumn = nowRow.insertCell(); // 열 추가
						}

						for (let nowDay = firstDate; nowDay <= lastDate; nowDay
								.setDate(nowDay.getDate() + 1)) { // day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복  

							let nowColumn = nowRow.insertCell(); // 새 열을 추가하고
							nowColumn.innerText = leftPad(nowDay.getDate()); // 추가한 열에 날짜 입력

							if (nowDay.getDay() == 0) { // 일요일인 경우 글자색 빨강으로
								//nowColumn.style.color = "#DC143C";
							}
							if (nowDay.getDay() == 6) { // 토요일인 경우 글자색 파랑으로 하고
								//nowColumn.style.color = "#0000CD";
								nowRow = tbody_Calendar.insertRow(); // 새로운 행 추가
							}

							if (nowDay < today) { // 지난날인 경우
								nowColumn.className = "pastDay";
							} else if (nowDay.getFullYear() == today
									.getFullYear()
									&& nowDay.getMonth() == today.getMonth()
									&& nowDay.getDate() == today.getDate()) { // 오늘인 경우           
								nowColumn.className = "today";
								nowColumn.onclick = function() {
									choiceDate(this);
								}
							} else { // 미래인 경우
								nowColumn.className = "futureDay";
								nowColumn.onclick = function() {
									choiceDate(this);
								}
							}
						}
					}

					// 날짜 선택
					function choiceDate(nowColumn) {
						if (document.getElementsByClassName("choiceDay")[0]) { // 기존에 선택한 날짜가 있으면
							document.getElementsByClassName("choiceDay")[0].classList
									.remove("choiceDay"); // 해당 날짜의 "choiceDay" class 제거
						}
						nowColumn.classList.add("choiceDay"); // 선택된 날짜에 "choiceDay" class 추가
					}

					// 이전달 버튼 클릭
					function prevCalendar() {
						nowMonth = new Date(nowMonth.getFullYear(), nowMonth
								.getMonth() - 1, nowMonth.getDate()); // 현재 달을 1 감소
						buildCalendar(); // 달력 다시 생성
					}
					// 다음달 버튼 클릭
					function nextCalendar() {
						nowMonth = new Date(nowMonth.getFullYear(), nowMonth
								.getMonth() + 1, nowMonth.getDate()); // 현재 달을 1 증가
						buildCalendar(); // 달력 다시 생성
					}

					// input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
					function leftPad(value) {
						if (value < 10) {
							value = "0" + value;
							return value;
						}
						return value;
					}
				</script>

				<script type="text/javascript">
					$(document).on('click', '.choiceDay', function() {
						$('#div').show();
					});
					
					$(document).on('click', '.meet', function(){
						$('table').show();
					});
				</script>
</body>
</html>