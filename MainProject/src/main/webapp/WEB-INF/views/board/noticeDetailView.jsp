<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>공지사항 상세보기</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
<style>
.container {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
}

.detail-title {
	text-align: center;
	margin-bottom: 30px;
}

.notice-content {
	padding: 20px;
	background-color: #f9f9f9;
	border-radius: 10px;
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
}
</style>
</head>

<body class="d-flex flex-column">
	<%@ include file="/WEB-INF/inc/top.jsp"%>
	<%@ include file="/WEB-INF/inc/subnavbarBoard.jsp"%>

	<main class="flex-shrink-0">
		<section class="py-5">
			<div class="container">
				<h1 class="detail-title">공지사항 상세보기</h1>
				<div class="notice-content">
					<h2>${notice.noticeTitle}</h2>
					<p class="text-muted">
						작성자: ${notice.noticeWriter} | 작성일: ${notice.noticeDate} | 조회수:
						${notice.viewCount}
					</p>
					<hr>
					<p>${notice.noticeContent}</p>
				</div>
				<div class="text-end mt-3">
					<a href="${pageContext.request.contextPath}/noticeBoardView"
						class="btn btn-secondary">목록</a>
					<c:if
						test="${sessionScope.login != null && sessionScope.login.memId eq 'admin'}">
						<a
							href="${pageContext.request.contextPath}/noticeEditView?noticeNo=${notice.noticeNo}"
							class="btn btn-primary">수정</a>
						<a
							href="${pageContext.request.contextPath}/noticeDelete?noticeNo=${notice.noticeNo}"
							class="btn btn-danger" onclick="return confirm('삭제하시겠습니까?');">삭제</a>
					</c:if>
				</div>
			</div>
		</section>
	</main>

	<%@ include file="/WEB-INF/inc/footer.jsp"%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
