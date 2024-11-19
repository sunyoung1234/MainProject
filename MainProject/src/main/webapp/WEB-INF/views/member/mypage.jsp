<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지 대시보드</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" />
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #f5f7fa;
            font-family: 'Roboto', sans-serif;
        }

        .dashboard-container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 20px;
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .dashboard-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .dashboard-header h1 {
            font-size: 2rem;
            color: #333;
        }

        .dashboard-header p {
            color: #666;
            font-size: 1rem;
        }

        .dashboard-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 20px;
        }

        .card {
            background: #ffffff;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .card h2 {
            font-size: 1.2rem;
            margin-bottom: 10px;
            color: #333;
        }

        .card p {
            font-size: 0.9rem;
            color: #666;
        }

        .btn-primary {
            background-color: #007bff;
            color: #fff;
            border-radius: 20px;
            padding: 10px 15px;
            font-size: 0.9rem;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .extra-section {
            margin-top: 40px;
        }

        .extra-section h3 {
            font-size: 1.5rem;
            margin-bottom: 20px;
            color: #333;
        }

        .placeholder {
            height: 250px;
            background: #e9ecef;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #6c757d;
            font-size: 1rem;
        }
    </style>
            <!-- Navigation START -->
        <%@ include file="/WEB-INF/inc/top.jsp" %>
        <!-- Navigation END -->
</head>
<body>
    <div class="dashboard-container">
        <!-- 대시보드 헤더 -->
        <div class="dashboard-header">
            <h1>안녕하세요, ${sessionScope.login.memName} 님</h1>
            <p>여기에서 회원 정보와 활동 데이터를 확인할 수 있습니다.</p>
        </div>

        <!-- 주요 카드 섹션 -->
        <div class="dashboard-cards">
            <!-- 기본 정보 카드 -->
            <div class="card">
                <h2>회원 정보</h2>
                <p>이름: ${sessionScope.login.memName}</p>
                <p>이메일: ${sessionScope.login.memEmail}</p>
                <p>전화번호: ${sessionScope.login.memPhone}</p>
                <button class="btn-primary">정보 수정</button>
            </div>

            <!-- 활동 데이터 카드 -->
            <div class="card">
                <h2>활동 데이터</h2>
                <p>최근 로그인: 준비 중</p>
                <p>최근 사용량: 준비 중</p>
                <p>포인트: 준비 중</p>
            </div>

            <!-- 알림 카드 -->
            <div class="card">
                <h2>알림</h2>
                <p>현재 미확인 알림: 준비 중</p>
            </div>
        </div>

        <!-- 추가 섹션: 그래프 및 게시판 요약 -->
        <div class="extra-section">
            <h3>에너지 사용량 및 데이터</h3>
            <div class="placeholder">여기에 전기사용량, 가스 배출량 그래프 추가 예정</div>
        </div>

        <div class="extra-section">
            <h3>게시판 요약</h3>
            <div class="placeholder">최근 게시판 활동 요약 추가 예정</div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>