<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>개인정보 수집 및 제공 동의서</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />

<style>
body {
	font-family: 'Plus Jakarta Sans', sans-serif;
	background-color: #f8f9fa;
	margin-top: 70px;
}

.agreement-card {
	background-color: #ffffff;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	padding: 40px;
	max-width: 700px;
	margin: auto;
}

.form-title {
	font-size: 28px;
	font-weight: 700;
	color: #343a40;
	text-align: center;
	margin-bottom: 30px;
}

.agreement-content {
	height: 250px; /* 고정 높이 */
	overflow-y: scroll; /* 스크롤 가능 */
	border: 1px solid #ddd;
	padding: 10px;
	margin-bottom: 20px;
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

#nextButton:disabled {
	background-color: #cccccc; /* 비활성화된 상태일 때 색상 */
	cursor: not-allowed;
}

#nextButton:enabled {
	background-color: #53C0D5; /* 활성화된 상태일 때 색상 */
	color:white;
	cursor: pointer;
}

</style>

<script src="https://code.jquery.com/jquery-3.7.1.js"></script>

</head>
<body>
	<!-- Navigation -->
	<%@ include file="/WEB-INF/inc/top.jsp"%>
	<section class="container">
		<div class="agreement-card">
			<h2 class="form-title">개인정보 수집 및 제공 동의서</h2>

			<!-- 동의서 내용 -->
			<div class="agreement-content">
				<p>본인은 아래와 같이 개인정보 수집 및 이용에 동의합니다.</p>
				<h5>1. 개인정보 수집 목적</h5>
				<p>회원 가입, 서비스 제공, 계약 이행 및 회원 관리.</p>

				<h5>2. 수집하는 개인정보 항목</h5>
				<ul>
					<li>필수항목: 아이디, 비밀번호, 이메일, 전화번호, 주소 등</li>
					<li>선택항목: 추가 입력이 가능한 정보</li>
				</ul>

				<h5>3. 개인정보의 보유 및 이용기간</h5>
				<p>회원 탈퇴 시까지 보유하며, 관련 법령에 의거하여 일정 기간 동안 보관합니다.</p>

				<h5>4. 동의 거부 권리 및 불이익</h5>
				<p>개인정보 제공에 동의하지 않을 수 있으나, 이 경우 회원가입이 제한될 수 있습니다.</p>
				<!-- 더 많은 내용을 추가할 수 있습니다 -->
			</div>

			<!-- 동의 체크박스 -->
			<div class="form-check mb-3">
				<input class="form-check-input" type="checkbox" id="agreeCheck">
				<label class="form-check-label" for="agreeCheck"> 개인정보 수집 및
					이용에 동의합니다. </label>
			</div>

			<!-- 다음 페이지 버튼 -->
			<div class="d-grid">
				<button class="btn btn-custom btn-lg" id="nextButton" disabled
					onclick="location.href='${pageContext.request.contextPath}/registView'">
					동의하고 다음 단계로</button>
			</div>
		</div>
	</section>
	<%@ include file="/WEB-INF/inc/footer.jsp"%>
	
	<script>
		// 체크박스가 체크되었을 때 버튼 활성화
		$('#agreeCheck').on('change', function() {
			$('#nextButton').prop('disabled', !this.checked);
		});

		// 체크박스가 변경될 때 버튼 활성화/비활성화 처리
		$('#agreeCheck').on('change', function() {
			const button = $('#nextButton');
			if (this.checked) {
				button.prop('disabled', false); // 버튼 활성화
			} else {
				button.prop('disabled', true); // 버튼 비활성화
			}
		});
	</script>

</body>
</html>
