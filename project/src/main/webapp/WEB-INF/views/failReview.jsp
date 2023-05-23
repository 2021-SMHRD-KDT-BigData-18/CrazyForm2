<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
	<script type="text/javascript">
	$().ready(function () {
	        Swal.fire({
	            icon: 'error',                         // Alert 타입
	            title: '리뷰 등록실패',         // Alert 제목
	            text: '내용을 입력해주세요',
	        }).then(function () {
	        	location.href="gowriteReview.do";
			})
	});

	</script>


</body>
</html>