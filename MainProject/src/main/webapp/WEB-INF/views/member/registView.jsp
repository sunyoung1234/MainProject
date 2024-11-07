<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<!-- 주소 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Custom Google font-->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />

<style>
    /* 공통 폰트 및 배경색 */
    body {
        font-family: 'Plus Jakarta Sans', sans-serif;
        background-color: #f8f9fa;
        margin-top: 70px;
    }

    .register-card {
        background-color: #ffffff;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        padding: 40px;
        max-width: 500px;
        margin: auto;
    }
    .form-floating {
        margin-bottom: 20px;
    }
    .form-control {
        border-radius: 10px;
        padding: 15px;
        font-size: 16px;
    }
    .form-control:focus {
        border-color: #495057;
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
    }
    .btn-custom {
        background-color: #343a40;
        color: #ffffff;
        border-radius: 10px;
        padding: 15px;
        font-size: 18px;
        font-weight: 600;
        width: 100%;
        transition: background-color 0.3s ease;
    }
    .btn-custom:hover {
        background-color: #212529;
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
        transition: background-color 0.3s ease;
    }
    .idBtn:hover {
        background-color: #212529;
    }
</style>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

</head>
<body id="page-top">
    <!-- Navigation START -->
    <%@ include file="/WEB-INF/inc/top.jsp" %>
    <!-- Navigation END -->

    <!-- Main content section with centered form -->
    <section class="container">
        <div class="register-card">
            <h2 class="form-title">회원가입</h2>
            <form id="registForm" action="${pageContext.request.contextPath}/registDo" method="POST">
           <%--  <!-- profile input-->
                                <div class="form-floating mb-3">
                                    <div class="d-flex justify-content-center">
                                        <img class="prof-img" id="imgBox" src="${pageContext.request.contextPath }/assets/default-prof.jpg">
                                        <input name="img" class="form-control d-none" id="registProfile" type="file" accept="image/*" />
                                    </div>
                                </div> --%>
                <!-- 아이디 input -->
                <div class="form-floating mb-3">
                    <div class="d-flex">
                        <input name="id" class="form-control" id="registId" type="text" placeholder="아이디" data-sb-validations="required" />
                        <button id="idCheck" class="idBtn" type="button">ID 중복체크</button>
                    </div>
                    <div class="invalid-feedback" id="checkIdLength">아이디는 4자리 이상 입력해야 합니다.</div>
                    <div class="invalid-feedback" id="idOkay" style="color: green;">사용 가능한 ID입니다.</div>
                </div>

                <!-- 비밀번호 input -->
                <div class="form-floating mb-3">
                    <input name="pw" class="form-control" id="registPw" type="password" placeholder="비밀번호(4자리 이상)" data-sb-validations="required" />
                    <label for="registPw">비밀번호(4자리 이상)</label>
                    <div class="invalid-feedback" id="checkPwFalse">비밀번호가 일치하지 않습니다.</div>
                    <div class="invalid-feedback" id="checkPwTrue" style="color: yellowGreen;">비밀번호가 일치합니다.</div>
                </div>

                <!-- 비밀번호 확인 -->
                <div class="form-floating mb-3">
                    <input class="form-control" id="confirmPw" type="password" placeholder="비밀번호 확인" data-sb-validations="required" />
                    <label for="confirmPw">비밀번호 확인</label>
                </div>

                <!-- 이메일 input -->
                <div class="form-floating mb-3">
                    <input name="email" class="form-control" id="registEmail" type="email" placeholder="name@example.com" data-sb-validations="required,email" />
                    <label for="registEmail">이메일</label>
                </div>

                <!-- 전화번호 input -->
                <div class="form-floating mb-3">
                    <input name="phone" class="form-control" id="registPhone" type="tel" placeholder="(123) 456-7890" data-sb-validations="required" />
                    <label for="registPhone">휴대폰번호</label>
                </div>

                <!-- 닉네임 input -->
                <div class="form-floating mb-3">
                    <input name="name" class="form-control" id="registName" type="text" placeholder="닉네임" data-sb-validations="required" />
                    <label for="registName">닉네임</label>
                </div>
                
				<!-- 주소 input -->
				<div class="form-floating mb-3">
					<input type="button" class="btn btn-custom mt-2" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
				    <input type="text" id="sample4_postcode" name="postcode" class="form-control" placeholder="우편번호" />
				    <input type="text" id="sample4_roadAddress" name="roadAddress" class="form-control mt-2" placeholder="도로명주소" />
				    <input type="text" id="sample4_jibunAddress" name="jibunAddress" class="form-control mt-2" placeholder="지번주소" />
				    <input type="text" id="sample4_detailAddress" name="detailAddress" class="form-control mt-2" placeholder="상세주소" />
				    <input type="text" id="sample4_extraAddress" name="extraAddress" class="form-control mt-2" placeholder="참고항목" />
				</div>
				<!-- Hidden input to store full address -->
				<input type="hidden" id="address" name="address" />


                <!-- Submit Button -->
                <div class="d-grid">
                    <button class="btn btn-custom btn-lg mb-2" id="submitButton" type="submit">회원가입</button>
                </div>
            </form>
            <!-- 뒤로가기 버튼 -->
            <div class="d-grid">
                <button class="btn btn-custom btn-lg" id="backBtn">뒤로가기</button>
            </div>
        </div>
    </section>

    <%@ include file="/WEB-INF/inc/footer.jsp" %>

    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>

    <!-- Kakao Maps Library -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e0184ed647e553cf5795a108feda8a4a&libraries=clusterer,services"></script>

    <script type="text/javascript">
    
    
    
        // 프로필 이미지 선택 기능
        $("#imgBox").click(function(){
            $("#registProfile").click();
        });

        $("#registProfile").change(function(e){
            var reader = new FileReader();
            reader.onload = function(e){
                $("#imgBox").attr("src", e.target.result);
            };
            reader.readAsDataURL(e.target.files[0]);
        });

        // 뒤로가기 버튼 기능
        $("#backBtn").click(function(){
            window.history.back();
        });
        
        let idLength = false;
        let idValid = false;
        let checkPw = false;
        
        let v_registForm = document.querySelector('#registForm');
		let v_submitBtn = document.querySelector('#submitButton');
		let v_idCheck = document.querySelector('#idCheck');
		
		let v_id = document.querySelector('#registId');
		let v_pw = document.querySelector('#registPw');
		let v_email = document.querySelector('#registEmail');
		let v_phone = document.querySelector('#registPhone');
		let v_name = document.querySelector('#registName');
		
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
			
			alert('회원가입을 축하드립니다.')
		})
        
// Kakao 주소 API 호출 함수
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var roadAddr = data.roadAddress;
            var extraRoadAddr = '';

            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                extraRoadAddr += data.bname;
            }
            if (data.buildingName !== '' && data.apartment === 'Y') {
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            if (extraRoadAddr !== '') {
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 각 주소 필드에 값 할당
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            document.getElementById("sample4_extraAddress").value = extraRoadAddr;

            // 전체 주소 조합하여 address에 저장
            var fullAddress = roadAddr + ' ' + extraRoadAddr + ' ' + document.getElementById("sample4_detailAddress").value;
            document.getElementById("address").value = fullAddress;

            // 가이드 메시지 업데이트
            var guideTextBox = document.getElementById("guide");
            if (data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';
            } else if (data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}


        var geocoder = new kakao.maps.services.Geocoder();
        let v_latitude = 0;
        let v_longitude = 0;

        document.querySelector('#registJuso').addEventListener('click', () => {
            let juso = document.querySelector('#sample4_roadAddress').value;

            geocoder.addressSearch(juso, function(result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    v_latitude = result[0].y;
                    v_longitude = result[0].x;
                    console.log(v_latitude);
                    console.log(v_longitude);
                }
            });
        });
    </script>
</body>
</html>
