<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>요청 게시판</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@100;200;300;400;500;600;700;800;900&amp;display=swap"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"
	rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />

<style type="text/css">
.bg-color {
	background-color: #10bd66;
}

.table-box {
	width: 100%;
	max-width: 1000px;
}

.cur-poi {
	cursor: pointer;
}

.write-box{
	height:750px;
}

.page-item.active .page-link {
	background-color: #198754; /* 강조할 색상 */
	color: white; /* 텍스트 색상 */
	border-color: #198754; /* 테두리 색상 */
}
</style>


</head>

<body class="d-flex flex-column">
	<%@ include file="/WEB-INF/inc/top.jsp"%>

	<main class="flex-shrink-0">
		<section class="py-5">
			<div class="container px-5">
				<div class="write-box rounded-4 py-5 px-4 px-md-5">
					<div class="text-center mb-5">
						<h1 class="fw-bolder">리뷰 게시판</h1>
					</div>
					<div class="row gx-5 justify-content-center">
						<div class="col-lg-12 col-xl-10">
							<table class="table table-bordered">
								<!-- 각 열의 너비 설정 및 가운데 정렬 적용 -->
								<colgroup>
									<col style="width: 7%;" />
									<!-- 번호  -->
									<col style="width: 50%;" />
									<!-- 제목  -->
									<col style="width: 15%;" />
									<!-- 날짜  -->
									<col style="width: 15%;" />
									<!-- 업체명  -->
									<col style="width: 13%;" />
									<!-- 피드백 여부  -->
								</colgroup>
								<thead class="thead-light">
									<tr>
										<th scope="col" class="text-center">번호</th>
										<th scope="col" class="text-center">사진</th>
										<th scope="col" class="text-center">제품명</th>
										<th scope="col" class="text-center">업체명</th>
										<th scope="col" class="text-center">피드백 여부</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${not empty boardListById}">
										<c:forEach var="board" items="${boardListById}">
											<tr> 
												<th scope="row" class="text-center">${board.orderNo}</th> <!-- 번호 -->
												<td class="text-center"><a href="${pageContext.request.contextPath}/boardDetailView?orderNo=${board.orderNo}">${board.orderTitle}</a></td> <!-- 제목 -->
												<td class="text-center">${board.requestDate}</td> <!-- 날짜 -->
												<td class="text-center">${board.entpName}</td> <!-- 업체명 -->
												<td class="text-center">${board.feedbackYn}</td> <!-- 피드백여부 -->
											</tr>
										</c:forEach>
									</c:if>
									<c:if test="${empty boardListById}">
										<tr>
											<td colspan="6" class="text-center">게시물이 없습니다.</td>
										</tr>
									</c:if>
								</tbody>
							</table>
							
									<!-- 요청서 작성 버튼 -->
							<div style="bottom: 20px; right: 20px;">
								<a class="btn btn-success"
									href="${pageContext.request.contextPath}/reviewWriteView">리뷰 작성</a>
							</div>
									<!-- Paging Bar -->
									<div class="d-flex justify-content-center mt-4">
										<nav aria-label="Page navigation example">
											<ul class="pagination">
												<!-- 이전 페이지 버튼 -->
												<li class="page-item">
													
													<c:if test="${pageSearch.pageNo == 0}">
														<a class="page-link disabled" href="#"
															aria-label="Previous"> <span aria-hidden="true">&lt;</span>
														</a>
													</c:if>
													
													<c:if test="${pageSearch.pageNo > 1}">
														<a class="page-link"
															href="<c:url value='/boardView?pageNo=${pageSearch.pageNo - 1}&searchOption=${pageSearch.searchOption}&searchWord=${pageSearch.searchWord }'/>"
															aria-label="Previous"> <span aria-hidden="true">&lt;</span>
														</a>
													</c:if> <c:if test="${pageSearch.pageNo == 1}">
														<a class="page-link disabled" href="#"
															aria-label="Previous"> <span aria-hidden="true">&lt;</span>
														</a>
													</c:if></li>

												<!-- 페이지 번호 링크 -->
												<c:if test="${pageSearch.pageNo == 0}">
													<li class="page-item"><a class="page-link"
															href="<c:url value='/boardView?pageNo=1&searchOption=${pageSearch.searchOption}&searchWord=${pageSearch.searchWord }'/>">
																1 </a></li>
												</c:if>
												
												<c:forEach begin="${pageSearch.firstPage}"
													end="${pageSearch.lastPage}" var="page">
													<c:if test="${page != pageSearch.pageNo}">
														<li class="page-item"><a class="page-link"
															href="<c:url value='/boardView?pageNo=${page }&searchOption=${pageSearch.searchOption}&searchWord=${pageSearch.searchWord }'/>">
																${page} </a></li>
													</c:if>
													<c:if test="${page == pageSearch.pageNo}">
														<li class="page-item active" aria-current="page"><span
															class="page-link">${page}</span></li>
													</c:if>
												</c:forEach>

												<!-- 다음 페이지 버튼 -->
												<li class="page-item"><c:if
														test="${pageSearch.pageNo < pageSearch.finalPage}">
														<a class="page-link"
															href="<c:url value='/boardView?pageNo=${pageSearch.pageNo + 1}&searchOption=${pageSearch.searchOption}&searchWord=${pageSearch.searchWord }'/>"
															aria-label="Next"> <span aria-hidden="true">&gt;</span>
														</a>
													</c:if> <c:if test="${pageSearch.pageNo >= pageSearch.finalPage}">
														<a class="page-link disabled" href="#" aria-label="Next">
															<span aria-hidden="true">&gt;</span>
														</a>
													</c:if></li>
											</ul>
										</nav>
									</div>
						</div>
					</div>
				
					

				</div>
			</div>
		</section>
	</main>
	<c:if test="${sessionScope.login.memId != 'admin' }">
	    <%@ include file="/WEB-INF/inc/chatbotbot.jsp"%>
	</c:if>
	<%@ include file="/WEB-INF/inc/footer.jsp" %>

	<!-- Bootstrap core JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>
