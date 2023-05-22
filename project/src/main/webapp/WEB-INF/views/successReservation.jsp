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
				icon: 'success',
				title: '예약성공',
				text: '예약이 되었습니다.'
			}).then(function () {
	        	location.href="Main.do";
			})
  	 	});
	</script>
</body>
</html>