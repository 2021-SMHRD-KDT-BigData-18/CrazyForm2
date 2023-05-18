<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"  %> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="assets/css/reviewMain.css" />
<meta charset="UTF-8">
<title>리뷰 보기</title>
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
                        <li><a href="goReservation.do">예약하기</a></li>
                        <li><a href="https://onnuribed.co.kr/">침구청소</a></li>
                        <li><a href="http://thecleaning.co.kr/default/">에어컨 청소</a></li>
                        <li><a href="https://wayopet.com/home">펫시팅</a></li>
                        <li><a href="goreviewMain.do">리뷰보기</a></li>
                    </ul>
                </nav>
            </header>
        </div>
    </div>

  <div class="review-container">
    <div>
    <h1>리뷰 보기</h1>
    </div>
   <c:forEach  items="${reviewlist}" var="dto">
  <div class="review-box-wrapper">
    <div class="review-box"> 
      <div class="review-number">리뷰번호: ${dto.REVIEW_SEQ}</div>
      <br>
   <div class="review-rating space-x-4 mx-auto">별점
  <div class="rating">
    <c:forEach begin="1" end="${dto.REVIEW_RATING}" var="rating">
      <span class="star active">&#9733;</span>
    </c:forEach>
  </div>
</div>
      <div class="review-content">후기: ${dto.REVIEW_CONTENT}</div>
      <div class="review-date">작성일:<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${dto.REVIEW_DT}"/></div>
      <div class="review-writer">작성자: ${dto.m_ID}</div>
    </div>
  </div>
</c:forEach>
    </div>
    <script>
    // 별점을 보여주는 기능
    const stars = document.querySelectorAll('.star');
    stars.forEach((star) => {
      const rating = parseFloat(star.getAttribute('data-rating'));
      if (rating > 0) {
        star.classList.add('active');
      }
    });
    </script>
</body>
</html>