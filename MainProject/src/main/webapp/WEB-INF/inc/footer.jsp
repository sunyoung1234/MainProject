<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <style type="text/css">
        /* Footer 고정 스타일 */
        .footer {
            background-color: #343a40; /* bg-dark 색상 */
            color: #fff; /* text-white */
            padding: 20px 0;
            position: relative;
            bottom: 0;
            width: 100%;
            text-align: center;
        }
        body {
            margin: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        main {
            flex: 1; /* Footer를 하단으로 밀기 위한 공간 */
        }
    </style>
</head>
<body>
    <!-- 페이지의 주요 내용 -->
    <main>
        <!-- 메인 컨텐츠가 렌더링됩니다 -->
    </main>
    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <p class="m-0 text-center">Copyright &copy; GreenSolution 2024</p>
        </div>
    </footer>
    <!-- Bootstrap core JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS -->
    <script src="js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</body>
</html>