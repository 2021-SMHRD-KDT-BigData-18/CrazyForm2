<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<meta charset="UTF-8">
<title>리뷰 보기</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f5f5f5;
    margin: 0;
    padding: 0;
  }
  
  .review-container {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
  }
  
  .review-box {
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 5px;
    padding: 20px;
    margin-bottom: 20px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  }
  
  .review-number {
    font-weight: bold;
    color: #333;
  }
  
  .review-content {
    margin-top: 10px;
  }
  
  .review-rating {
    margin-top: 10px;
    color: #777;
  }
  
  .review-date {
    margin-top: 10px;
    color: #777;
  }
  
  .review-writer {
    margin-top: 10px;
    color: #777;
  }
  
  h1 {
    text-align: center;
    margin-bottom: 20px;
  }
</style>
</head>
<body>
  <div class="review-container">
    <h1>리뷰 보기</h1>
    
   <c:forEach var="review" items="${reviewList}">
  <div class="review-box-wrapper">
    <div class="review-box"> 
      <div class="review-number">리뷰번호: ${review.REVIEW_NUMBER}</div>
      <div class="review-rating">별점: ${review.REVIEW_RATING}
        <div class="rating">
          <c:forEach begin="1" end="${review.REVIEW_RATING}" var="rating">
            <span class="star" data-rating="${rating}"><i class="fas fa-star"></i></span>
          </c:forEach>
        </div>
      </div>
      <div class="review-content">후기: ${review.REVIEW_CONTENT}</div>
      <div class="review-date">작성일: ${review.REVIEW_DT}</div>
      <div class="review-writer">작성자: ${review.M_ID}</div>
    </div>
  </div>
</c:forEach>
    </div>
</body>
</html>
