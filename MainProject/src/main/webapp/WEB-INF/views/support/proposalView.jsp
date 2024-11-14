<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>건의사항 게시판</title>
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/favicon.ico" />
<link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>

<body class="d-flex flex-column">
	<%@ include file="/WEB-INF/inc/top.jsp"%>
	<!-- ChatBot START -->
	<%@ include file="/WEB-INF/inc/chatbot.jsp" %>
	<!-- ChatBot END -->
	<main class="flex-shrink-0">
		<section class="py-5">
			<div class="container px-5">
				<div class="rounded-4 py-5 px-4 px-md-5">
					<div class="text-center mb-5">
						<h1 class="fw-bolder">건의사항 게시판</h1>
					</div>
					<div class="text-right mb-3">
						<a class="btn btn-success" href="${pageContext.request.contextPath}/proposal/write">건의사항 작성</a>
					</div>
					<div class="accordion" id="proposalAccordion">
						<c:forEach var="proposal" items="${proposalList}">
							<div class="accordion-item">
								<h2 class="accordion-header" id="heading${proposal.propNo}">
									<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${proposal.propNo}" aria-expanded="false" aria-controls="collapse${proposal.propNo}">
										번호: ${proposal.propNo} | 제목: ${proposal.propTitle} | 상태: ${proposal.propStatus}
									</button>
								</h2>
								<div id="collapse${proposal.propNo}" class="accordion-collapse collapse" aria-labelledby="heading${proposal.propNo}" data-bs-parent="#proposalAccordion">
									<div class="accordion-body">
										<p><strong>작성자:</strong> ${proposal.memName}</p>
										<p><strong>작성일:</strong> ${proposal.propDate}</p>
										<p><strong>내용:</strong> ${proposal.propContent}</p>
										<div class="text-end mt-3">
											<c:if test="${sessionScope.login.memId == 'admin'}">
												<a href="${pageContext.request.contextPath}/answerWriteView?propNo=${proposal.propNo}" class="btn btn-primary">답변 추가</a>
											</c:if>
										</div>

										<!-- 답변 내용 표시 -->
										<c:if test="${not empty proposal.answerContent}">
											<hr />
											<div class="answer-section">
												<p><strong>관리자 답변:</strong></p>
												<p>${proposal.answerContent}</p>
											</div>
										</c:if>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</section>
	</main>
	<%@ include file="/WEB-INF/inc/footer.jsp" %>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		document.querySelectorAll('.accordion-button').forEach(button => {
			button.addEventListener('click', () => {
				const target = button.getAttribute('data-bs-target');
				const element = document.querySelector(target);
				const bsCollapse = bootstrap.Collapse.getInstance(element);
				bsCollapse.toggle();
			});
		});
	</script>
</body>
</html>
