<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
    <link rel="stylesheet" href="assets/css/join.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
	<!-- <form action="#" method="POST">
		<input id="check" name="id" type="text"
			placeholder="ID를 입력하세요">
			<p id="result"></p> 이메일 중복체크 결과를 출력하기
		<input name="pw" type="password" placeholder="PW를 입력하세요">
		<input name="name" type="text" placeholder="이름을 입력하세요">
		<input name="phone" type="text" placeholder="전화번호를 입력하세요">
		<input name="address" type="text" placeholder="집주소를 입력하세요">
		<input type="submit" value="회원가입" class="button fit">
	</form> -->
    <div class="member">

        <!-- 필드 -->
        <div class="field">
            <b>아이디</b>
            <span class="placehold-text"><input type="text"></span>
            <p id="result"></p> <!-- 아이디 중복체크 결과를 출력하기 -->
        </div>
        <div class="field">
            <b>비밀번호</b>
            <input class="userpw" type="password">
        </div>
        <div class="field">
            <b>비밀번호 재확인</b>
            <input class="userpw-confirm" type="password">
        </div>
        <div class="field">
            <b>이름</b>
            <input type="text">
        </div>


		<div class="form-group m-form__group row">
			<label class="col-md-2 offset-md-3 col-form-label">
				주&nbsp;&nbsp;소&nbsp;&nbsp;<span
				class="m--font-orange vertical-middle">*</span>
			</label>
			<div class="col-md-2">
				<input type="text" class="form-control m-input" name="postcode"
					id="postcode" placeholder="우편번호" readonly />
			</div>
			<div class="col-md-2 postcode-btn">
				<button type="button" class="btn btn-info m-btn--air"
					onclick="execDaumPostcode()">우편번호 찾기</button>
			</div>
			<div class="col-md-4 offset-md-5">
				<input type="text" class="form-control m-input m--margin-top-10"
					name="address" id="address" placeholder="도로명 주소" readonly />
			</div>
			<div class="col-md-4 offset-md-5">
				<input type="text" class="form-control m-input m--margin-top-10"
					name="detailAddress" placeholder="상세 주소" required />
			</div>
		</div>

		<div class="field tel-number">
            <b>휴대전화</b>
            <select>
                <option value="">대한민국 +82</option>
            </select>
            <div>
                <input type="tel" placeholder="전화번호 입력">
            </div>
        </div>

        <!-- 가입하기 버튼 -->
        <input id="join" type="submit" value="가입하기">

        <!-- 푸터 -->
        <div class="member-footer">
            <div>
                <span>이용약관</span>
                <span>개인정보처리방침</span>
            </div>
            <span><a href="#">ZIPSA Corp.</a></span>
        </div>
    </div>

	<!--autoload=false 파라미터를 이용하여 자동으로 로딩되는 것을 막습니다.-->
	<script
		src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>

	<script>
		/** 우편번호 찾기 */
		function execDaumPostcode() {
			daum.postcode.load(function() {
				new daum.Postcode({
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
						$("#postcode").val(data.zonecode);
						$("#address").val(data.roadAddress);
					}
				}).open();
			});
		}
		
		var join = $('#join');
		join.on('click', ()=>{
			// 만약에 회원가입에 성공했다면~~
			alert('회원가입에 성공하셨습니다! 메인화면에서 로그인을 해주세요.');
			// 성공하지 못 했다면~~
			// alert('회원가입에 실패하셨습니다. 다시 한 번 시도해주세요.')
		});
		
	</script>
	


</body>
</html>