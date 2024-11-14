<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>마이 페이지</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" />
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />

    <style>
        /* 기본 스타일 */
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            background: #000;
            overflow: hidden;
            font-family: 'Arial', sans-serif;
        }

        /* 암전 및 깜박임 효과 */
        .blackout {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 1);
            z-index: 2;
            animation: blackout 1s forwards;
        }

        @keyframes blackout {
            0% { opacity: 1; }
            100% { opacity: 0; }
        }

        /* 미친듯한 배경 효과 (핵폭발, 번개, 빛 등) */
        .background-effect {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: radial-gradient(circle, rgba(255, 0, 0, 0.7) 0%, rgba(255, 215, 0, 0.4) 80%);
            animation: explosion 4s ease-out infinite, lightning 1.5s ease-in-out infinite;
            z-index: 1;
            filter: brightness(1.5) saturate(2);
        }

        @keyframes explosion {
            0% { transform: scale(0.1); opacity: 1; }
            50% { transform: scale(3); opacity: 0.8; }
            100% { transform: scale(10); opacity: 0; }
        }

        @keyframes lightning {
            0% { opacity: 0; }
            50% { opacity: 1; }
            100% { opacity: 0; }
        }

        /* 번개 효과 */
        .lightning {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 5px;
            height: 300px;
            background: linear-gradient(180deg, #ffffff 0%, #fffc00 50%, #ffffff 100%);
            animation: bolt 1s linear infinite;
            z-index: 3;
            transform: translate(-50%, -50%);
        }

        @keyframes bolt {
            0% { transform: translate(-50%, -50%) scale(1); opacity: 0.8; }
            50% { transform: translate(-50%, -50%) scale(1.1); opacity: 1; }
            100% { transform: translate(-50%, -50%) scale(1); opacity: 0.8; }
        }

        /* 프로필 카드 */
        .profile-card {
            background: rgba(0, 0, 0, 0.9);
            color: #fff;
            border-radius: 30px;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.8);
            padding: 50px;
            text-align: center;
            width: 500px;  /* 카드 크기 확장 */
            backdrop-filter: blur(15px);
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%) scale(0);
            animation: cardAppear 3s ease-out forwards;
            z-index: 4;  /* 카드가 배경 위에 */
        }

        @keyframes cardAppear {
            0% { opacity: 0; transform: translate(-50%, -50%) scale(0.3) rotate(180deg); }
            50% { transform: translate(-50%, -50%) scale(1.05) rotate(0deg); }
            100% { opacity: 1; transform: translate(-50%, -50%) scale(1) rotate(0deg); }
        }

        /* 텍스트 스타일 */
        .profile-card h1 {
            font-size: 36px;
            font-weight: 800;
            margin-bottom: 20px;
            text-shadow: 6px 6px 20px rgba(0, 0, 0, 0.8);
        }

        .profile-card p {
            font-size: 20px;
            margin-bottom: 25px;
            color: rgba(255, 255, 255, 0.9);
        }

        /* 버튼 스타일 */
        .btn-edit {
            background: linear-gradient(135deg, #FF4500, #FFD700);
            color: #fff;
            padding: 18px 40px;
            border-radius: 40px;
            font-size: 20px;
            font-weight: 700;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.8);
            transition: all 0.3s ease;
            border: none;
            transform: scale(1.1);
        }

        /* 버튼 호버 효과 */
        .btn-edit:hover {
            transform: scale(1.2);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.9);
        }

        /* 버튼 반짝임 효과 */
        .btn-edit::after {
            content: '';
            position: absolute;
            top: -8px; left: -8px;
            right: -8px; bottom: -8px;
            border-radius: 40px;
            background: radial-gradient(circle, rgba(255, 215, 0, 0.7) 0%, rgba(255, 0, 0, 0.4) 100%);
            animation: pulse 1s infinite alternate;
        }

        @keyframes pulse {
            0% { transform: scale(1); opacity: 0.6; }
            100% { transform: scale(1.15); opacity: 1; }
        }

    </style>
</head>
<body>

    <!-- 배경과 암전 처리 -->
    <div class="blackout"></div>
    <div class="background-effect"></div>
    <div class="lightning"></div> <!-- 번개 효과 -->

    <main class="main-height">
        <div class="profile-card">
            <h1>${sessionScope.login.getMemName()} 님</h1>
            <p>연락처: ${sessionScope.login.getMemPhone()}</p>
            <p>이메일: ${sessionScope.login.getMemEmail()}</p>
            <div class="divider"></div>
            <a href="${pageContext.request.contextPath}/memEditView" class="btn btn-edit">수정하기</a>
        </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // 페이지 로드 시 카드 등장 애니메이션
        window.onload = function() {
            setTimeout(function() {
                document.querySelector('.profile-card').style.transform = 'scale(1)';
                document.querySelector('.profile-card').style.transition = 'transform 2s ease-out';
            }, 500);
        };
    </script>
</body>
</html>
