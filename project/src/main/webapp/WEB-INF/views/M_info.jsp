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
<link rel="stylesheet" href="assets/css/my_info.css" />
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body class="is-preload homepage">

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
						<li><a href="https://form.office.naver.com/form/responseView.cmd?formkey=MmYxMTE2MzUtYWQwNi00ZGZjLTgxMzYtZmQ1NDVlYjQ5ZmRk&sourceId=urlshare">에어컨 청소</a></li>
						<li><a href="https://wayopet.com/home">펫시팅</a></li>
						<li><a href="goreviewMain.do">리뷰보기</a></li>
					</ul>
				</nav>
			</header>
		</div>
	</div>
	
	<hr>

	<div class="reservation">내정보</div>
		<div class="rvContainer">
		<div class="Reservation-container">
			<div id="nav1">
			<ul>
				<li class="info1">내정보관리</li>
				<li class="res1">예약현황보기</li>
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
					<input id="pwBtn" type="submit" value="변경하기" class="pwBtn">
				</div>

				<div id="infodelete">
					<button class="deleteBtn" type="button" onclick="location.href='delete.do'">탈퇴하기</button>
				</div>

			</form>
		</div>
		
		 <div class="res">
			<table id="resTable">
				<tr class="trHead">
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
									<td><fmt:formatDate pattern="yyyy-MM-dd kk:mm:ss"
											value="${list.REV_DT}" /></td>
									<td>${list.JOB_T}</td>
									<td>${list.m_ADDR}</td>
									<td>${list.PET_YN}</td>
									<td>${list.STAFF_NAME}</td>
									<td>${list.REV_NOTE}</td>
								</tr>
							</c:forEach>

						</c:otherwise>
					</c:choose> 
				
			</table>
		</div>
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
	    $('#resTable').toggle();
	    $('.info1').toggle();
    });

	$('.info1').on('click', function() {
		$('#resTable').hide();
		$('#infoForm').toggle();
	});
	

	$('#pwBtn').on('click', function() {
		alert('비밀번호 변경이 완료되었습니다.');
	});
   
	</script>

</body>
</html>