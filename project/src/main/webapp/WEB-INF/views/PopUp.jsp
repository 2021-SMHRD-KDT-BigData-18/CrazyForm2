<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="assets/css/popup.css" />
</head>
<body>


	<div class="layerPopup" id="layer_popup" style="visibility: visible;">
		<div class="layerBox">
			<h4 class="title">ZIPSA 공지사항</h4>
			<div class="cont">
				<p>
					<img src="images/clean3.jpg" width=350 height=500 usemap="#popup"
						alt="event page">
					집사를 찾아주셔서 감사합니다. <br> 당일 예약은 불가능합니다
				</p>
			</div>
			<form name="pop_form">
				<div id="check">
					<input type="checkbox" name="chkbox" value="checkbox" id='chkbox'>
					<label for="chkbox">&nbsp&nbsp오늘 하루동안 보지 않기</label>
				</div>
				<div id="close">
					<a href="javascript:closePop();">닫기</a>
				</div>
			</form>
		</div>
	</div>

	<script type="text/javascript">
	//head 태그 안에 스크립트 선언
	        function setCookie( name, value, expiredays ) {
	            var todayDate = new Date();
	            todayDate.setDate( todayDate.getDate() + expiredays ); 
	            document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
	        }
	        function closePop() {
	            if ( document.pop_form.chkbox.checked ){
	                setCookie( "maindiv", "done" , 1 );
	            }
	            document.all['layer_popup'].style.visibility = "hidden";
	        }
	    cookiedata = document.cookie;   
	    if ( cookiedata.indexOf("maindiv=done") < 0 ){     
	        document.all['layer_popup'].style.visibility = "visible";
	    }
	    else {
	        document.all['layer_popup'].style.visibility = "hidden";
	    }
	</script>
	


</body>
</html>