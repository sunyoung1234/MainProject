<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>공지사항 상세보기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <style>    
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f9f9f9;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);

        }
        .title-bar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 30px;
            border-bottom: 2px solid #0056b3;
            padding-bottom: 10px;
        }
        .title-bar .title {
            font-size: 24px;
            font-weight: bold;
            color: #0056b3;
        }
        .info-bar {
            display: flex;
            justify-content: space-between;
            font-size: 14px;
            color: #666;
            margin-bottom: 20px;
            border-bottom: 1px solid grey;
            padding-bottom: 10px;
        }
        .info-bar .info-item {
            display: flex;
            align-items: center;
            gap: 5px;
        }
        .content-section {
            font-size: 16px;
            color: #333;
            line-height: 1.6;
            white-space: pre-wrap;
            margin-bottom: 30px;
        }
        .button-bar {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
        }
        .button-bar a {
            text-decoration: none;
            color: white;
        }
    </style>
</head>

<body>
    <%@ include file="/WEB-INF/inc/top.jsp"%>
    <%@ include file="/WEB-INF/inc/subnavbarBoard.jsp"%>
    <main class="py-5">
        <div class="container">
            <div class="title-bar">
                <div class="title">${notice.noticeTitle}</div>
                <div class="badge bg-primary">공지</div>
            </div>
            <div class="info-bar">
                <div class="info-item">
                    <i class="bi bi-person"></i> 작성자: ${notice.noticeWriter}
                </div>
                <div class="info-item">
                    <i class="bi bi-calendar"></i> 작성일: ${notice.formattedNoticeDate}
                </div>
                <div class="info-item">
                    <i class="bi bi-eye"></i> 조회수: ${notice.viewCount}
                </div>
            </div>
            <div class="content-section">
                ${notice.noticeContent}
            </div>
            <div class="button-bar">
			    <a href="${pageContext.request.contextPath}/noticeBoardView" class="btn btn-secondary">목록</a>
			    <c:if test="${sessionScope.login != null && sessionScope.login.memId eq 'admin'}">
			        <!-- 수정 버튼 -->
			        <a href="${pageContext.request.contextPath}/noticeEditView?noticeNo=${notice.noticeNo}" class="btn btn-primary">수정</a>
			        <!-- 삭제 버튼 -->
			        <a href="${pageContext.request.contextPath}/noticeDelete?noticeNo=${notice.noticeNo}" class="btn btn-danger" onclick="return confirm('삭제하시겠습니까?');">삭제</a>
			    </c:if>
</div>
        </div>
    </main>
    <c:if test="${sessionScope.login.memId != 'admin' }">
	    <%@ include file="/WEB-INF/inc/chatbotbot.jsp"%>
	</c:if>
    <%@ include file="/WEB-INF/inc/footer.jsp"%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
