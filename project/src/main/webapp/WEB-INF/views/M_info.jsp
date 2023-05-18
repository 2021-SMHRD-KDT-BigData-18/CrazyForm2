<%@page import="zipsa.entity.T_MEMBER"%>
<%@ page import="zipsa.entity.T_RESERVATION" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
 
<%    List<T_RESERVATION> list = (List<T_RESERVATION>) request.getAttribute("list"); %>
<% T_MEMBER user = (T_MEMBER)session.getAttribute("user"); %>


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

        <hr>
        <div class="reservation">내정보</div>
        <div class="Reservation-container">
            <div>
                <div id="nav1">
                    <ul>
                        <li class="info">내정보관리</li>
                        <li class="res">예약현황보기</li>
                    </ul>
                </div>

            </div>
            
            <div class="info">
            <form action="" method="POST" id="infoForm">
                <table>
                    <tr>
                        <td>ID</td>
                        <td><%=user.getM_ID() %></td>
                    </tr>
                    <tr>
                        <td>이름</td>
                        <td><%=user.getM_NAME() %></td>
                    </tr>
                    <tr>
                        <td>휴대폰 번호</td>
                        <td><%=user.getM_PHONE() %></td>
                    </tr>
                    <tr>
                        <td>비밀번호</td>
                        <td><%=user.getM_PW() %></td>
                    </tr>
                </table>

                <div id="infoDisplay">
                    <button id="changePasswordBtn" class="btn">비밀번호 변경하기</button>
                    <button id="deleteAccountBtn" class="btn">회원 탈퇴</button>
                </div>
            </form>
            </div>

            <div class="res">
                <table id="resTable">
                	<tr>
                    <td>예약일자</td>
                    <td>청소내용</td>
                    <td>예약주소</td>
                    <td>펫유무</td>
                    <td>담당매니저</td>
                    <td>요청사항</td>
                    </tr>
                    <c:forEach items="${list}" var="dto">
                        <tr>
                            <td>${dto.getREV_DT()}</td>
                            <td>${dto.getJOB_T()}</td>
                            <td>${dto.getM_ADDR()}</td>
                            <td>${dto.getPET_YN()}</td>
                            <td>${dto.getSTAFF_NAME()}</td>
                            <td>${dto.getREV_NOTE()}</td>
                         </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
        
        <div id="footer-wrapper">
            <footer id="footer" class="container">
                <div class="row">
                    <div class="col-3 col-6-medium col-12-small">
                    </div>
                </div>
            </footer>
        </div>


        <script type="text/javascript">
            $('.info').on('click', function () {
                $('#infoForm').toggle();
                $('#resTable').hide();
                
            });
            $('.res').on('click', function () {
                $('#resTable').toggle();
                $('#infoForm').hide();
            });

        </script>



</body>
</html>

