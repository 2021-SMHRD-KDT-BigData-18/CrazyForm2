<%@page import="zipsa.entity.T_MEMBER"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>리뷰 작성</title>
<link rel="stylesheet" href="assets/css/writeReview.css">

</head>

<body class="is-preload homepage">
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
                        <li><a href="goReservation.do">예약하기</a></li>
                        <li><a href="https://onnuribed.co.kr/">침구청소</a></li>
                        <li><a href="http://thecleaning.co.kr/default/">에어컨 청소</a></li>
                        <li><a href="https://wayopet.com/home">펫시팅</a></li>
                        <li><a href="goMinfo.do">예약내역</a></li>
                        <li><a href="reviewMain.do">리뷰보기</a></li>
                    </ul>
                </nav>
            </header>
        </div>
    </div>

    
    <div class="container2">
        <div>
            <p>리뷰 작성하기</p>
        </div>
        <div class="info">
            <div class="star-rating space-x-4 mx-auto">
                 <input type="radio" id="5-stars" name="rating" value="5" v-model="ratings" name="REVIEW_RATING" /> 
                <label for="5-stars"   class="star pr-4">★</label>
                 <input type="radio" id="4-stars" name="rating" value="4" v-model="ratings" name="REVIEW_RATING"/> 
                <label for="4-stars" class="star">★</label>
                 <input type="radio" id="3-stars" name="rating" value="3" v-model="ratings" name="REVIEW_RATING"/>
                <label for="3-stars" class="star">★</label>
                 <input type="radio" id="2-stars" name="rating" value="2"   v-model="ratings" name="REVIEW_RATING"/>
                <label for="2-stars" class="star">★</label>
                <input type="radio" id="1-star"  name="rating" value="1" v-model="ratings" name="REVIEW_RATING"/>
                 <label for="1-star" class="star">★</label>
            </div>
            <textarea class="form-control" id="bookReview"  name="REVIEW_CONTENT"
            cols="60" rows="5" placeholder="이용 리뷰를 남겨주세요❤️"></textarea>
        </div>
        <div class="review">
            <button action="writeReivew.do" id="btn-event" onclick="makeReview()" type="button"   class="btn btn-primary">리뷰 등록하기</button>
        </div>
    </div>

    </div>
    </div>
</body>

</html>
<script>
    let eventBtn = document.getElementById('btn-event');
    eventBtn.addEventListener('click', () => {
        alert('리뷰 등록완료🙏');
    })
</script>

</body>

</html>

