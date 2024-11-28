<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>공지사항</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
<style>
body {
	font-family: "Noto Sans KR", sans-serif;
	background-color: #f9f9f9;
}

.container {
	max-width: 1200px;
	margin: 0 auto;
	padding: 20px;
}

.board-title {
	text-align: center;
	margin-bottom: 30px;
}

.table {
	background-color: #fff;
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
}

.table th {
	background-color: #0056b3;
	color: black;
	text-align: center;
	font-weight: bold;
	padding: 15px;
}

.table td {
	text-align: center;
	padding: 15px;
	font-size: 16px;
	vertical-align: middle;
}

.table tr:nth-child(even) {
	background-color: #f4f4f4;
}

.table tr:hover {
	background-color: #e9f5ff;
}

.pagination {
	justify-content: center;
	margin-top: 20px;
}

.page-item.active .page-link {
	background-color: #0056b3;
	color: #fff;
	border-color: #0056b3;
}

.page-link {
	color: #0056b3;
}

.page-link:hover {
	color: #003d82;
}
</style>
</head>

<body class="d-flex flex-column">
	<%@ include file="/WEB-INF/inc/top.jsp"%>
	<%@ include file="/WEB-INF/inc/subnavbarBoard.jsp"%>

	<main class="flex-shrink-0">
		<section class="py-5">
			<div class="container px-5">
				<h1 class="board-title">공지사항</h1>

				<!-- 공지사항 테이블 -->
				<table class="table">
					<thead>
						<tr>
							<th style="width: 10%;">번호</th>
							<th style="width: 40%;">제목</th>
							<th style="width: 15%;">작성일</th>
							<th style="width: 15%;">작성자</th>
							<th style="width: 20%;">조회수</th>
							<!-- 조회수 열 추가 -->
						</tr>
					</thead>
					<tbody>
						<c:if test="${not empty noticeList}">
							<c:forEach var="notice" items="${noticeList}">
								<tr>
									<td>${notice.noticeNo}</td>
									<td><a
										href="${pageContext.request.contextPath}/noticeDetailView?noticeNo=${notice.noticeNo}">${notice.noticeTitle}</a></td>
									<td>${notice.formattedNoticeDate}</td>
									<td>${notice.noticeWriter}</td>
									<td>${notice.viewCount}</td>
									<!-- 조회수 출력 -->
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty noticeList}">
							<tr>
								<td colspan="5" class="text-center">게시물이 없습니다.</td>
							</tr>
						</c:if>
					</tbody>
				</table>

				<!-- 글 작성 버튼 -->
				<c:if
					test="${sessionScope.login != null && sessionScope.login.memId eq 'admin'}">
					<div class="text-end">
						<a class="btn btn-success"
							href="${pageContext.request.contextPath}/noticeWriteView"> 글
							작성 </a>
					</div>
				</c:if>

				<!-- 페이징 바 -->
				<nav>
					<ul class="pagination justify-content-center">
						<!-- 이전 페이지 -->
						<li class="page-item ${pageSearch.pageNo == 1 ? 'disabled' : ''}">
							<a class="page-link"
							href="${pageSearch.pageNo > 1 ? pageContext.request.contextPath + '/noticeBoardView?pageNo=' + (pageSearch.pageNo - 1) : '#'}">
								&laquo; </a>
						</li>

						<!-- 페이지 번호 -->
						<c:forEach begin="${pageSearch.firstPage}"
							end="${pageSearch.lastPage}" var="page">
							<li
								class="page-item ${page == pageSearch.pageNo ? 'active' : ''}">
								<a class="page-link"
								href="${pageContext.request.contextPath}/noticeBoardView?pageNo=${page}">
									${page} </a>
							</li>
						</c:forEach>

						<!-- 다음 페이지 -->
						<li
							class="page-item ${pageSearch.pageNo == pageSearch.finalPage ? 'disabled' : ''}">
							<a class="page-link"
							href="${pageSearch.pageNo < pageSearch.finalPage ? pageContext.request.contextPath + '/noticeBoardView?pageNo=' + (pageSearch.pageNo + 1) : '#'}">
								&raquo; </a>
						</li>
					</ul>
				</nav>


			</div>
		</section>
	</main>

	<%@ include file="/WEB-INF/inc/footer.jsp"%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>