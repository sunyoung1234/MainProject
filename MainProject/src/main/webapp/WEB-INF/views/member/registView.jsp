<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<!-- 주소 -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Google font-->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap"
	rel="stylesheet" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS-->
<link href="css/styles.css" rel="stylesheet" />

<style>
/* 공통 폰트 및 배경색 */
body {
	font-family: 'Plus Jakarta Sans', sans-serif;
	background-color: #f8f9fa;
	margin-top: 40px;
}

.register-card {
	background-color: #ffffff;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	padding: 40px;
	max-width: 500px;
	margin: -50px auto; /* 기존 70px에서 20px 줄임 */
}

.form-floating {
	margin-bottom: 20px;
}

.form-control {
	border-radius: 10px;
	padding: 15px;
	font-size: 16px;
}

.btn-custom {
	background-color: #343a40;
	color: #ffffff;
	border-radius: 10px;
	padding: 15px;
	font-size: 18px;
	font-weight: 600;
	width: 100%;
}

.btn-custom.reg-btn {
	background-color: #53C0D5;
	color: #ffffff; /* 흰색 텍스트 */
	border: none;
	transition: background-color 0.3s ease;
}

.btn-custom.reg-btn:hover {
	background-color: #46A1B3; /* hover 시 더 진한 색상 */
}

.btn-custom.back-btn {
	background-color: #BECCCF;
	color: #ffffff; /* 흰색 텍스트 */
	border: none;
	transition: background-color 0.3s ease;
}

.btn-custom.back-btn:hover {
	background-color: #A4B0B3; /* hover 시 더 진한 색상 */
}

.btn-custom.post-btn {
	background-color: #4B535C;
	color: #ffffff; /* 흰색 텍스트 */
	border: none;
	transition: background-color 0.3s ease;
}

.btn-custom.post-btn:hover {
	background-color: #A4B0B3; /* hover 시 더 진한 색상 */
}

.form-title {
	font-size: 28px;
	font-weight: 700;
	color: #343a40;
	text-align: center;
	margin-bottom: 30px;
}

.invalid-feedback {
	color: red;
	font-size: 14px;
	margin-top: 5px;
}

.idBtn {
	background-color: #343a40;
	color: #ffffff;
	border-radius: 5px;
	padding: 12px;
	font-size: 14px;
	font-weight: 600;
	margin-left: 10px;
	border: none;
}
</style>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body id="page-top">
	<!-- Navigation -->
	<%@ include file="/WEB-INF/inc/top.jsp"%>


	<!-- Main content section -->
	<section class="container">
		<div class="register-card">
			<h2 class="form-title">회원가입</h2>
			<form id="registForm"
				action="${pageContext.request.contextPath}/registDo" method="POST">
				<!-- 아이디 input -->
				<div class="form-floating mb-3">
					<div class="d-flex">
						<input name="memId" class="form-control" id="registId" type="text"
							placeholder="아이디" required />
						<button id="idCheck" class="idBtn" type="button">ID 중복체크</button>
					</div>
					<div class="invalid-feedback" id="checkIdLength">아이디는 4자리 이상
						입력해야 합니다.</div>
					<div class="invalid-feedback" id="idOkay" style="color: green;">사용
						가능한 ID입니다.</div>
				</div>

				<!-- 비밀번호 input -->
				<div class="form-floating mb-3">
					<input name="memPw" class="form-control" id="registPw"
						type="password" placeholder="비밀번호" required /> <label
						for="registPw">비밀번호 (4자리 이상)</label>
				</div>

				<!-- 비밀번호 확인 input -->
				<div class="form-floating mb-3">
					<input class="form-control" id="confirmPw" type="password"
						placeholder="비밀번호 확인" required /> <label for="confirmPw">비밀번호
						확인</label>
					<div class="invalid-feedback" id="checkPwFalse">비밀번호가 일치하지
						않습니다.</div>
					<div class="invalid-feedback" id="checkPwTrue"
						style="color: green;">비밀번호가 일치합니다.</div>
				</div>

				<!-- 이메일 input -->
				<div class="form-floating mb-3">
					<input name="memEmail" class="form-control" id="registEmail"
						type="email" placeholder="name@example.com" required /> <label
						for="registEmail">이메일</label>
				</div>

				<!-- 전화번호 input -->
				<div class="form-floating mb-3">
					<input name="memPhone" class="form-control" id="registPhone"
						type="tel" placeholder="(123) 456-7890" required /> <label
						for="registPhone">휴대폰 번호</label>
				</div>

				<!-- 닉네임 input -->
				<div class="form-floating mb-3">
					<input name="memName" class="form-control" id="registName"
						type="text" placeholder="닉네임" required /> <label for="registName">닉네임</label>
				</div>

				<!-- 주소 input -->
				<div class="form-floating mb-3">

					<div class="d-flex">
						<input type="text" id="sample4_postcode" name="postcode"
							class="form-control" placeholder="우편번호" readonly /> <input
							type="button" class="btn btn-custom post-btn ms-2"
							onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
					</div>
				</div>

				<div class="form-floating mb-3">
					<input type="text" id="sample4_roadAddress" name="memAddress"
						class="form-control" placeholder="도로명 주소" readonly /> <label
						for="sample4_roadAddress" class="label-small">도로명 주소</label>
				</div>

				<div class="form-floating mb-3">
					<input type="text" id="sample4_jibunAddress" name="jibunAddress"
						class="form-control" placeholder="상세 주소" /> <label
						for="sample4_jibunAddress" class="label-small">지번 주소</label>
				</div>

				<div class="form-floating mb-3">
					<input type="text" id="sample4_extraAddress" name="extraAddress"
						class="form-control" placeholder="참고 항목" /> <label
						for="sample4_extraAddress" class="label-small">상세 주소</label>
				</div>

				<!-- 회원가입 버튼 -->
				<div class="d-grid">
					<button class="btn btn-custom reg-btn btn-lg mb-2"
						id="submitButton" type="submit">회원가입</button>
				</div>
			</form>
			<div class="d-grid">
				<button class="btn btn-custom back-btn btn-lg" id="backBtn">뒤로가기</button>
			</div>
		</div>
	</section>
	<c:if test="${sessionScope.login.memId != 'admin' }">
		<%@ include file="/WEB-INF/inc/chatbotbot.jsp"%>
	</c:if>
	<%@ include file="/WEB-INF/inc/footer.jsp"%>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Kakao Maps Library -->
	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e0184ed647e553cf5795a108feda8a4a&libraries=clusterer,services"></script>



	<script type="text/javascript">
	
	// 뒤로가기 버튼
	$("#backBtn").click(function(){
        window.history.back();
    });
    
	
// 아이디 중복 체크 및 유효성 검사
        let v_registForm = document.querySelector('#registForm');
		let v_submitBtn = document.querySelector('#submitButton');
		let v_idCheck = document.querySelector('#idCheck');
		
		let v_id = document.querySelector('#registId');
		let v_pw = document.querySelector('#registPw');
		let v_email = document.querySelector('#registEmail');
		let v_phone = document.querySelector('#registPhone');
		let v_name = document.querySelector('#registName');
		
		
		let v_postcode = document.querySelector('#sample4_postcode');	// 우편번호
		let v_roadAddress = document.querySelector('#sample4_roadAddress'); // 도로명 주소
		let v_jibunAddress = document.querySelector('#sample4_jibunAddress'); // 상세 주소
		let v_extraAddress = document.querySelector('#sample4_extraAddress'); // 참고 항목
		
		
		
		
		let v_confirmPw = document.querySelector('#confirmPw');
		
		
		
		v_id.addEventListener('input',()=>{
			
			idValid = false;
			document.querySelector('#idOkay').style.display = "none";
			if(v_id.value.length < 4){
				document.querySelector('#checkIdLength').style.display = "block";
				idLength = false;
			}else{
				document.querySelector('#checkIdLength').style.display = "none";
				idLength = true;
			}
		})
		
		v_confirmPw.addEventListener('input',()=>{
			
			if(v_confirmPw.value != v_pw.value){
				document.querySelector('#checkPwTrue').style.display = "none";
				document.querySelector('#checkPwFalse').style.display = "block";
				checkPw = false;
			}else{
				document.querySelector('#checkPwTrue').style.display = "block";
				document.querySelector('#checkPwFalse').style.display = "none";
				checkPw = true;
			}
		})
		
		v_idCheck.addEventListener('click',()=>{
			if(!idLength){
				alert('ID 4자리 이상 입력해주세요');
			}else{
				$.ajax({
					url: '${pageContext.request.contextPath}/idCheck',
					type: 'POST',
					contentType: 'application/json',
					data: JSON.stringify({
						id : v_id.value.trim()
					}), 
					success: function(response){
						
						if(response == 1){
							alert('중복된 아이디가 존재합니다!');
							idValid = false;
							document.querySelector('#idOkay').style.display = "none";
						}else{
							alert('사용가능한 아이디 입니다.')
							idValid = true;
							document.querySelector('#idOkay').style.display = "block";
						}
					}
				})
			}
		})
		
		v_submitBtn.addEventListener('click',()=>{
			if(!idValid){
				alert('ID 중복체크를 해주세요');
				event.preventDefault();
				return;
			}
			
			if(!checkPw){
				alert('비밀번호 확인이 일치하지 않습니다');
				event.preventDefault();
				return;
			}
			
			if(!v_pw.value){
				alert('비밀번호를 입력해주세요');
				event.preventDefault();
				return;
			}
			
			if(!v_email.value){
				alert('이메일을 입력해주세요');
				event.preventDefault();
				return;
			}
			
			if(!v_phone.value){
				alert('전화번호를 입력해주세요');
				event.preventDefault();
				return;
			}
			
			if(!v_name.value){
				alert('닉네임을 입력해주세요');
				event.preventDefault();
				return;
			}
			
			if(!v_postcode.value){
				alert('주소를 입력해주세요')
				event.preventDefault();
				return;
			}
			if(!v_roadAddress.value){
				alert('주소를 입력해주세요')
				event.preventDefault();
				return;
			}
			if(!v_jibunAddress.value){
				alert('지번주소를 입력해주세요')
				event.preventDefault();
				return;
			}
			if(!v_extraAddress.value){
				alert('상세주소를 입력해주세요')
				event.preventDefault();
				return;
			}

				
			
			alert('회원가입을 축하드립니다.')
		})
    
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 각 주소 정보를 변수로 저장
            var roadAddr = data.roadAddress;  // 도로명 주소
            var jibunAddr = data.jibunAddress;  // 지번 주소
            var extraRoadAddr = '';  // 추가 도로명 주소
            var postcode = data.zonecode;  // 우편번호

            // 추가 도로명 주소 처리
            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                extraRoadAddr += data.bname;
            }
            if (data.buildingName !== '' && data.apartment === 'Y') {
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }

            // 각각의 필드에 해당하는 값 넣기
            $('#sample4_postcode').val(postcode);  // 우편번호
            $('#sample4_roadAddress').val(roadAddr);  // 도로명 주소
            $('#sample4_jibunAddress').val(jibunAddr);  // 지번 주소
            $('#sample4_extraAddress').val(extraRoadAddr);  // 추가 주소
            // 도로명 주소를 선택했을 때에도 지번 주소를 자동으로 채워줌
            if (!jibunAddr) {
                $('#sample4_jibunAddress').val(roadAddr);  // 도로명 주소와 지번 주소가 같으면 그대로 채워줌
            }
        }
    }).open();
}
</script>

</body>
</html>