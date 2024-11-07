<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<title>회원정보 수정</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />

<!-- Google Font 및 스타일 -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet" />

<style>
    body {
        font-family: 'Plus Jakarta Sans', sans-serif;
        background-color: #f8f9fa;
        margin-top: 70px;
    }
    .edit-card {
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
</style>
</head>
<body class="d-flex flex-column">
<main class="flex-shrink-0">

    <%@ include file="/WEB-INF/inc/top.jsp"%>

    <section class="container">
        <div class="edit-card">
            <h2 class="form-title">회원정보 수정</h2>
            <form id="editForm" action="${pageContext.request.contextPath}/memberUpdate" method="POST" enctype="multipart/form-data">

<%--                 <!-- 프로필 이미지 선택 -->
                <div class="form-floating mb-3 text-center">
                    <img class="rounded-circle mb-3" id="imgBox"
                         src="${pageContext.request.contextPath}/displayImage?imgName=${member.memProfile}"
                         alt="Profile Image" onerror="this.src='${pageContext.request.contextPath}/assets/default-prof.jpg';"
                         style="width: 150px; height: 150px; cursor: pointer;" />
                    <input name="img" class="form-control d-none" id="registProfile" type="file" accept="image/*" />
                </div> --%>

                <!-- 아이디 input (Read-only) -->
                <div class="form-floating mb-3">
                    <input name="memId" class="form-control" id="inputId" type="text" value="${member.memId}" readonly />
                    <label for="inputId">아이디 (변경 불가)</label>
                </div>

                <!-- 비밀번호 input -->
                <div class="form-floating mb-3">
                    <input name="memPw" class="form-control" id="inputPw" type="password" placeholder="비밀번호" value="${member.memPw}" />
                    <label for="inputPw">비밀번호</label>
                </div>

                <!-- 이메일 input -->
                <div class="form-floating mb-3">
                    <input name="memEmail" class="form-control" id="inputEmail" type="email" placeholder="이메일" value="${member.memEmail}" />
                    <label for="inputEmail">이메일</label>
                </div>

                <!-- 전화번호 input -->
                <div class="form-floating mb-3">
                    <input name="memPhone" class="form-control" id="inputPhone" type="tel" placeholder="휴대폰 번호" value="${member.memPhone}" />
                    <label for="inputPhone">휴대폰 번호</label>
                </div>

                <!-- 닉네임 input (Read-only) -->
                <div class="form-floating mb-3">
                    <input name="memName" class="form-control" id="inputName" type="text" value="${member.memName}" readonly />
                    <label for="inputName">닉네임 (변경 불가)</label>
                </div>

                <!-- Submit Button -->
                <div class="d-grid">
                    <button class="btn btn-custom btn-lg mb-2" id="submitButton" type="submit">수정하기</button>
                </div>
            </form>

            <!-- 뒤로가기 버튼 -->
            <div class="d-grid">
                <button class="btn btn-custom btn-lg mb-2" id="backBtn">뒤로가기</button>
            </div>

            <!-- 회원탈퇴 버튼 -->
            <form action="${pageContext.request.contextPath}/deleteMember" method="POST">
                <div class="d-grid">
                    <button class="btn btn-danger btn-lg" style="color: white;">회원탈퇴</button>
                </div>
            </form>
        </div>
    </section>
</main>

<%@ include file="/WEB-INF/inc/footer.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">
/*     // 프로필 이미지 선택 기능
    document.querySelector('#imgBox').addEventListener('click', () => {
        document.querySelector('#registProfile').click();
    });

    document.querySelector('#registProfile').addEventListener('change', (e) => {
        const reader = new FileReader();
        reader.onload = (event) => {
            document.getElementById('imgBox').src = event.target.result;
        };
        reader.readAsDataURL(e.target.files[0]);
    }); */

    // 뒤로가기 버튼 기능
    document.querySelector('#backBtn').addEventListener('click', () => {
        window.history.back();
    });
</script>

</body>
</html>
