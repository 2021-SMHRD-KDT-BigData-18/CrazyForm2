<%@page import="zipsa.entity.T_RESERVATION"%>
<%@page import="java.util.List"%>
<%@page import="zipsa.entity.T_MEMBER"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>리뷰 작성</title>
<link rel="stylesheet" href="assets/css/writeReview.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

</head>

<body class="is-preload homepage">
	<%
	List<T_RESERVATION> list = (List<T_RESERVATION>) request.getAttribute("list");
	%>

	<div>

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
							<li><a href="goMinfo.do">예약내역</a></li>
							<li><a href="goreviewMain.do">리뷰보기</a></li>
						</ul>
					</nav>
				</header>
			</div>
		</div>

		<div class="reviewArea">
			<p>리뷰 작성</p>
		</div>

		<div class="res">
			<table id="resTable">
				<tr>
					<td>선택</td>
					<td>예약일자</td>
					<td>청소내용</td>
					<td>예약주소</td>
					<td>펫유무</td>
					<td>담당매니저</td>
					<td>요청사항</td>
				</tr>
		<form action="writeReivew.do" method="POST">
				<c:forEach items="${list}" var="list">
					<tr>
						<td ><input type="radio"
							name="REV_SEQ" value="${list.REV_SEQ}" class="selectBtn"></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"
								value="${list.REV_DT}" /></td>
						<td>${list.JOB_T}</td>
						<td>${list.m_ADDR}</td>
						<td>${list.PET_YN}</td>
						<td>${list.STAFF_NAME}</td>
						<td>${list.REV_NOTE}</td>
					</tr>
				</c:forEach>
			</table>
		</div>

			<div class="container2">
				<div>
					<p>별점을 선택하세요</p>
				</div>
				<div class="info">
					<div class="star-rating space-x-4 mx-auto">
						<input type="radio" id="5-stars" value="5"
							v-model="ratings" name="REVIEW_RATING" /> <label for="5-stars"
							class="star pr-4">★</label> <input type="radio" id="4-stars"
							value="4" v-model="ratings" name="REVIEW_RATING" />
						<label for="4-stars" class="star">★</label> <input type="radio"
							id="3-stars"value="3" v-model="ratings"
							name="REVIEW_RATING" /> <label for="3-stars" class="star">★</label>
						<input type="radio" id="2-stars" value="2"
							v-model="ratings" name="REVIEW_RATING" /> <label for="2-stars"
							class="star">★</label> <input type="radio" id="1-star"
							value="1" v-model="ratings" name="REVIEW_RATING" />
						<label for="1-star" class="star">★</label>
					</div>
					<textarea class="form-control" id="bookReview"
						name="REVIEW_CONTENT" cols="60" rows="5"
						placeholder="이용 리뷰를 남겨주세요❤️"></textarea>
				</div>
				<div class="review">
					<button id="btn-event" class="btn btn-primary" type="submit">리뷰 등록하기</button>
				</div>
			</div>
		</form>
	</div>
	</div>
</body>

</html>
<script type="text/javascript">
    
    $('.selectBtn').on('click', function () {
    	$('.container2').toggle();
	});
    
    
</script>

</body>

</html>

