<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<!--
	Verti by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title></title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/loginbox.css" />
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

</head>
<body class="is-preload homepage" onload="window.open('popup.do', 'popup', 'width=500, height=700')">

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
						<li><c:choose>
								<c:when test="${user eq null}">
									<a href="gologin.do">예약하기</a>
								</c:when>
								<c:otherwise>
									<c:if test="${user.m_ID ne 'admin'}">
										<a href="goRv.do">예약하기</a>
									</c:if>
								</c:otherwise>
							</c:choose></li>
						<li><a href="https://onnuribed.co.kr/">침구청소</a></li>
						<li><a href="http://thecleaning.co.kr/default/">에어컨 청소</a></li>
						<li><a href="https://wayopet.com/home">펫시팅</a></li>

						<c:if test="${user.m_ID eq 'admin'}">
							<li><a href="goRvInfo.do">관리자 예약확인</a></li>
						</c:if>

						<c:if test="${user eq null}">
							<li><a href="gologin.do">내 정보</a></li>
						</c:if>

						<c:if test="${user ne null and user.m_ID ne 'admin'}">
							<li><a href="goMinfo.do">내 정보</a></li>
						</c:if>

						<li><a href="goreviewMain.do">리뷰보기</a></li>
					</ul>
				</nav>


			</header>
		</div>

		<!-- Banner -->
		<div id="banner-wrapper">
			<div id="banner" class="box container">
				<div class="row">
					<img height="500" width="1300"
						src="images/clean.jpg">

				</div>
				<div class="colBox">
					<div class="col-7 col-12-medium">
						<h3>
							당신의 일상이 행복하도록 집사가 함께 할게요
						</h3>
					</div>
					<div class="col-5 col-12-medium">
						<ul>
							<li><a href="goRv.do"
								class="button large icon solid fa-arrow-circle-right">집사
									예약하기</a></li>
						</ul>
					</div>
				</div>
					<div class="loginBox">
						<span class="msg">집사를 더 안전하고 편리하게 이용하세요.</span>
						<c:if test="${user eq null}">
							<a class="loginBtn" href="gologin.do">로그인</a>
							<div>
								<a class="joinBtn" href="gojoin.do">회원가입</a>
							</div>
						</c:if>
						<div>
							<c:if test="${user ne null}">
								<a href="logout.do" class="logoutButton">로그아웃</a>
							</c:if>
						</div>

					</div>


			</div>
		</div>
	</div>

	<!-- Features -->
	<div id="features-wrapper">
		<div class="container">
			<div class="row">
				<div class="col-4 col-12-medium">

					<!-- Box -->
					<section class="box feature">
						<a href="https://wayopet.com/home" class="image featured"><img
							width="528" height="300"
							src="https://i.pinimg.com/564x/74/ac/21/74ac2195da23a88006b0968dcff25ac0.jpg"
							alt="" /></a>
						<div class="inner">
							<header>
								<h2>펫시팅</h2>
								<br>
								<p>반려생활 파트너 와요</p>
								<p>펫시터가 집으로 와요!</p>
							</header>
						</div>
					</section>

				</div>
				<div class="col-4 col-12-medium">

					<!-- Box -->
					<section class="box feature">
						<a href="http://thecleaning.co.kr/default/" class="image featured"><img
							src="images/KakaoTalk_20230515_092559032.png" width="528"
							height="300" alt="" /></a>
						<div class="inner">
							<header>
								<h2>에어컨청소</h2>
								<br>
								<p>에어컨 전문업체로</p>
								<p>연결됩니다.</p>
							</header>
						</div>
					</section>

				</div>
				<div class="col-4 col-12-medium">

					<!-- Box -->
					<section class="box feature">
						<a href="https://onnuribed.co.kr/" class="image featured"><img
							src="images/bedcleaning.PNG" width="528" height="300" alt="" /></a>
						<div class="inner">
							<header>
								<h2>침구청소</h2>
								<br>
								<p>침구청소 전문업체로</p>
								<p>연결됩니다.</p>
							</header>
						</div>
					</section>

				</div>
			</div>
		</div>
	</div>

	<!-- Main -->
	<div id="main-wrapper">
		<div class="container">
			<div class="row gtr-200">
				<div class="col-4 col-12-medium">

					<!-- Sidebar -->
					<div id="sidebar">
						<section class="widget thumbnails">
							<h3>청소 꿀팁</h3>
							<div class="grid">
								<div class="row gtr-50">
									<div class="col-6">
										<img width="400" height="315" src="images/bathroom.jpg" alt="" />
									</div>

								</div>
							</div>
						</section>
					</div>

				</div>
				<div class="col-8 col-12-medium imp-medium">

					<!-- Content -->
					<div id="content">
						<section class="last">
							<iframe width="560" height="315"
								src="https://www.youtube.com/embed/jgxKU50YFrQ"
								title="YouTube video player" frameborder="0"
								allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
								allowfullscreen></iframe>
						</section>
					</div>

				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<div id="footer-wrapper">
		<footer id="footer" class="container">
			<div class="row">
				<div class="col-3 col-6-medium col-12-small">

					<!-- Links -->
					<section class="widget links">
						<h3>Channel Plus</h3>
						<ul class="style2">
							<!-- 카카오톡 채널 추가 버튼이 표시될 위치 -->
							<div id="kakao-talk-channel-add-button"
								data-channel-public-id="_gJmYxj" data-size="large"
								data-support-multiple-densities="true"></div>
						</ul>
					</section>

				</div>
				<div class="col-3 col-6-medium col-12-small">

					<!-- Contact -->
					<section class="widget contact last">
						<h3>Contact Us</h3>
						<ul>
							<li><a href="https://www.instagram.com/zipsa_manager/"
								class="icon brands fa-instagram"><span class="label"
									height="45" width="45">Instagram</span></a></li>
						</ul>

						<p>
							<br /> 광주광역시 남구 송암로 60<br /> (062) 000-0000
						</p>
					</section>

				</div>
			</div>
		</footer>
	</div>

	</div>

	<!-- Scripts -->

	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

	<script>
		(function() {
			var w = window;
			if (w.ChannelIO) {
				return w.console.error("ChannelIO script included twice.");
			}
			var ch = function() {
				ch.c(arguments);
			};
			ch.q = [];
			ch.c = function(args) {
				ch.q.push(args);
			};
			w.ChannelIO = ch;
			function l() {
				if (w.ChannelIOInitialized) {
					return;
				}
				w.ChannelIOInitialized = true;
				var s = document.createElement("script");
				s.type = "text/javascript";
				s.async = true;
				s.src = "https://cdn.channel.io/plugin/ch-plugin-web.js";
				var x = document.getElementsByTagName("script")[0];
				if (x.parentNode) {
					x.parentNode.insertBefore(s, x);
				}
			}
			if (document.readyState === "complete") {
				l();
			} else {
				w.addEventListener("DOMContentLoaded", l);
				w.addEventListener("load", l);
			}
		})();

		ChannelIO('boot', {
			"pluginKey" : "f0b79691-ec2e-4b93-9a1f-90c530f9d33e"
		});
	</script>

	<script>
		window.kakaoAsyncInit = function() {
			Kakao.Channel.createAddChannelButton({
				container : '#kakao-talk-channel-add-button',
			});
		};
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = 'https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.channel.min.js';
			js.integrity = 'sha384-MEvxc+j9wOPB2TZ85/N6G3bt3K1/CgHSGNSM+88GoytFuzP4C9szmANjTCNfgKep';
			js.crossOrigin = 'anonymous';
			fjs.parentNode.insertBefore(js, fjs);
		})(document, 'script', 'kakao-js-sdk');
	</script>


</body>
</html>