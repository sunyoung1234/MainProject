<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content />
<meta name="author" content />
<title>로그인</title>
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

<style type="text/css">
    /* 공통 폰트 및 배경색 */
    body {
        font-family: 'Plus Jakarta Sans', sans-serif;
        background-color: #f8f9fa;
        margin-top: 70px;
    }

    .login-card {
        background-color: #ffffff;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        padding: 50px 20px;
        max-width: 500px;
        margin: auto;
        margin-top: 100px;
        margin-bottom: 200px;
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
    .err-msg {
        color: red;
        font-size: 14px;
        text-align: center;
        margin-bottom: 10px;
    }
    .btn-custom.btn-info {
    background-color: #0dcaf0; /* 부트스트랩 기본 btn-info 색상 */
    color: #ffffff; /* 흰색 텍스트 */
    border: none;
    transition: background-color 0.3s ease;
}
.btn-custom.btn-info:hover {
    background-color: #0aa2c2; /* hover 시 더 진한 색상 */
}

.btn-custom.btn-success {
    background-color: #198754; /* 부트스트랩 기본 btn-success 색상 */
    color: #ffffff; /* 흰색 텍스트 */
    border: none;
    transition: background-color 0.3s ease;
}
.btn-custom.btn-success:hover {
    background-color: #146c43; /* hover 시 더 진한 색상 */
}
</style>
</head>

<body class="d-flex flex-column login-bg">
    <main class="flex-shrink-0">
        <!-- Navigation START -->
        <%@ include file="/WEB-INF/inc/top.jsp" %>
        <!-- Navigation END -->

        <!-- Page content -->
        <section class="py-5">
            <div class="container px-5">
                <div class="login-card">
                    <h2 class="form-title">로그인</h2>
                    <span class="err-msg">${msg}</span>
                    <form id="contactForm" action="${pageContext.request.contextPath}/loginDo" method="POST">
                        <!-- 아이디 input -->
                        <div class="form-floating">
                            <input name="memId" class="form-control" id="inputId" type="text" placeholder="아이디" value="${cookie.rememberId.value}" required />
                            <label for="inputId">아이디</label>
                        </div>
                        <!-- 비밀번호 input -->
                        <div class="form-floating">
                            <input name="memPw" class="form-control" id="inputPw" type="password" placeholder="비밀번호" required />
                            <label for="inputPw">비밀번호</label>
                        </div>
                        <!-- 아이디 기억하기 -->
                        <div class="form-check mb-3 mt-1">
                            <input class="form-check-input" type="checkbox" id="inputRememberId" name="rememberId" ${cookie.rememberId.value == null ? "" : "checked"}>
                            <label class="form-check-label" for="inputRememberId">아이디 기억하기</label>
                        </div>
                        <!-- 로그인 버튼 -->
                        <div class="d-grid mb-3">
                            <button class="btn btn-custom btn-info" id="submitBtn" type="submit">로그인</button>
                        </div>
                        <!-- 회원가입 버튼 -->
                        <div class="d-grid">
                            <button class="btn btn-custom btn-success" id="registBtn">회원가입</button>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </main>
    
    <!-- Footer -->
    <%@ include file="/WEB-INF/inc/footer.jsp"%>

    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>

    <script type="text/javascript">
        const regist_btn = document.querySelector("#registBtn");
        regist_btn.addEventListener('click', (event) => {
            event.preventDefault();
            location.href = "${pageContext.request.contextPath}/agreementView"; 
        });
    </script>
</body>
</html>
