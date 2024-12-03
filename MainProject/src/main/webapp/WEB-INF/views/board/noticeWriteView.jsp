<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>공지사항 작성</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<style>
.container {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
}

.form-title {
    text-align: center;
    margin-bottom: 30px;
}
</style>
</head>

<body class="d-flex flex-column">
    <%@ include file="/WEB-INF/inc/top.jsp"%>
    <%@ include file="/WEB-INF/inc/subnavbarBoard.jsp"%>

    <main class="flex-shrink-0">
        <section class="py-5">
            <div class="container">
                <h1 class="form-title">공지사항 작성</h1>
                <form action="${pageContext.request.contextPath}/noticeWrite" method="post">
                    <div class="mb-3">
                        <label for="noticeTitle" class="form-label">제목</label>
                        <input type="text" class="form-control" id="noticeTitle" name="noticeTitle" required>
                    </div>
                    <!-- noticeWriter를 sessionScope를 이용해 설정 -->
                    <input type="hidden" id="noticeWriter" name="noticeWriter" value="${sessionScope.loginId}">
                    <div class="mb-3">
                        <label for="noticeContent" class="form-label">내용</label>
                        <textarea class="form-control" id="noticeContent" name="noticeContent" rows="10" required></textarea>
                    </div>
                    <div class="text-end">
                        <button type="submit" class="btn btn-success">등록</button>
                        <a href="${pageContext.request.contextPath}/noticeBoardView" class="btn btn-secondary">취소</a>
                    </div>
                </form>
            </div>
        </section>
    </main>
	<c:if test="${sessionScope.login.memId != 'admin' }">
	    <%@ include file="/WEB-INF/inc/chatbotbot.jsp"%>
	</c:if>
    <%@ include file="/WEB-INF/inc/footer.jsp"%>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
