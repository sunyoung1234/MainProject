<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>공지사항 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <style>    
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f9f9f9;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            font-weight: bold;
        }
        textarea {
            resize: none;
        }
        .button-bar {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
        }
        .button-bar button {
            color: white;
        }
    </style>
</head>

<body>
    <%@ include file="/WEB-INF/inc/top.jsp"%>
    <main class="py-5">
        <div class="container">
            <h2 class="mb-4">공지사항 수정</h2>
            <!-- 수정 폼 -->
            <form action="${pageContext.request.contextPath}/noticeEdit" method="post">
                <!-- 숨겨진 필드로 noticeNo 전달 -->
                <input type="hidden" name="noticeNo" value="${notice.noticeNo}" />

                <!-- 제목 입력 -->
                <div class="form-group">
                    <label for="noticeTitle">제목</label>
                    <input type="text" id="noticeTitle" name="noticeTitle" class="form-control" value="${notice.noticeTitle}" required />
                </div>

                <!-- 작성자 (수정 불가) -->
                <div class="form-group">
                    <label for="noticeWriter">작성자</label>
                    <input type="text" id="noticeWriter" class="form-control" value="${notice.noticeWriter}" readonly />
                </div>

                <!-- 내용 입력 -->
                <div class="form-group">
                    <label for="noticeContent">내용</label>
                    <textarea id="noticeContent" name="noticeContent" class="form-control" rows="10" required>${notice.noticeContent}</textarea>
                </div>

                <!-- 버튼 -->
                <div class="button-bar">
                    <a href="${pageContext.request.contextPath}/noticeDetailView?noticeNo=${notice.noticeNo}" class="btn btn-secondary">취소</a>
                    <button type="submit" class="btn btn-primary">저장</button>
                </div>
            </form>
        </div>
    </main>
    <%@ include file="/WEB-INF/inc/footer.jsp"%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
