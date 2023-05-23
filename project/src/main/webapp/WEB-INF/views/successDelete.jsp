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
//	$().ready(function () {
//	        Swal.fire({
//	            icon: 'success',                         // Alert 타입
//	            title: '회원탈퇴',         // Alert 제목
//	        }).then(function () {
//	        	location.href="Main.do";
//			})
//	});
	
	$().ready(function () {
	Swal.fire({
		   icon: 'warning',
		   title: '정말로 탈퇴하시겠습니까?',
		   text: '확인을 누르면 탈퇴가 완료됩니다.',
		   
		   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
		   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
		   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
		   confirmButtonText: '확인', // confirm 버튼 텍스트 지정
		   cancelButtonText: '취소', // cancel 버튼 텍스트 지정
		   
		   reverseButtons: true, // 버튼 순서 거꾸로
		   
		}).then(result => {
		   // 만약 Promise리턴을 받으면,
		   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
			   Swal.fire({
				   icon:'success',
				   title:'탈퇴 완료'
			   }).then(function () {
		   			location.href="Main.do";
			});
		   };
		});
	});

	</script>


</body>
</html>