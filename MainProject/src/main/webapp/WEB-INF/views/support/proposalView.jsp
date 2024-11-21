<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>건의사항 게시판</title>
<!-- Favicon -->
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap) -->
<link href="${pageContext.request.contextPath}/resources/css/styles.css"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
</head>

<body class="d-flex flex-column">
	<%@ include file="/WEB-INF/inc/top.jsp"%>
	<!-- ChatBot START -->
	<%@ include file="/WEB-INF/inc/chatbot.jsp"%>
	<!-- ChatBot END -->
	<main class="flex-shrink-0">
		<section class="py-5">
			<div class="container px-5">
				<div class="rounded-4 py-5 px-4 px-md-5">
					<div class="text-center mb-5">
						<h1 class="fw-bolder">건의사항 게시판</h1>
					</div>
					<div class="text-right mb-3">
						<a class="btn btn-success"
							href="${pageContext.request.contextPath}/proposal/write">건의사항
							작성</a>
					</div>
					<div class="accordion" id="proposalAccordion">
						<c:forEach var="proposal" items="${proposalList}">
							<div class="accordion-item">
								<h2 class="accordion-header" id="heading${proposal.propNo}">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse"
										data-bs-target="#collapse${proposal.propNo}"
										aria-expanded="false"
										aria-controls="collapse${proposal.propNo}">번호:
										${proposal.propNo} | 제목: ${proposal.propTitle} | 상태:
										${proposal.propStatus}</button>
								</h2>
								<div id="collapse${proposal.propNo}"
									class="accordion-collapse collapse"
									aria-labelledby="heading${proposal.propNo}"
									data-bs-parent="#proposalAccordion">
									<div class="accordion-body">
										<p>
											<strong>작성자:</strong> ${proposal.memName}
										</p>
										<p>
											<strong>작성일:</strong> ${proposal.propDate}
										</p>
										<p>
											<strong>내용:</strong> ${proposal.propContent}
										</p>
										<div class="text-end mt-3">
											<c:if test="${sessionScope.login.memId == 'admin'}">
												<button class="btn btn-primary answer-button"
													data-prop-no="${proposal.propNo}">답변 추가</button>
											</c:if>
										</div>
										<!-- 답변 내용 표시 -->
										<c:if test="${not empty proposal.answerContent}">
											<hr />
											<div class="answer-section">
												<p>
													<strong>관리자 답변:</strong>
												</p>
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
	<%@ include file="/WEB-INF/inc/footer.jsp"%>

	<!-- 답변 추가 모달 -->
	<div class="modal fade" id="answerModal" tabindex="-1"
		aria-labelledby="answerModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="${pageContext.request.contextPath}/proposal/addAnswer"
					method="POST">
					<div class="modal-header">
						<h5 class="modal-title" id="answerModalLabel">답변 추가</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<textarea name="answerContent" class="form-control" rows="5"
							placeholder="답변 내용을 입력하세요" required></textarea>
						<input type="hidden" name="propNo" id="propNo" value="">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
						<button type="submit" class="btn btn-primary">답변 저장</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 비밀번호 입력 모달 -->
	<div class="modal fade" id="passwordModal" tabindex="-1"
		aria-labelledby="passwordModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="passwordForm">
					<div class="modal-header">
						<h5 class="modal-title" id="passwordModalLabel">비밀번호 입력</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<label for="passwordInput" class="form-label">비밀번호</label> <input
							type="password" id="passwordInput" class="form-control" required>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
						<button type="submit" class="btn btn-primary">확인</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
        // 아코디언 버튼 클릭 이벤트
        document.querySelectorAll('.accordion-button').forEach(button => {
    button.addEventListener('click', (event) => {
        const memId = event.target.dataset.memId;
        const propNo = event.target.dataset.propNo;

        // 관리자가 아닌 경우만 비밀번호 확인 요청
        if (sessionStorage.getItem('verified') !== 'true' && sessionScope.login.memId !== 'admin') {
            event.preventDefault(); // 아코디언 확장 방지
            const passwordModal = new bootstrap.Modal(document.getElementById('passwordModal'));
            passwordModal.show();

            // 비밀번호 확인 폼 처리
            document.getElementById('passwordForm').addEventListener('submit', (e) => {
                e.preventDefault();

                const password = document.getElementById('passwordInput').value;

                // 비밀번호 확인 요청
                fetch(`${pageContext.request.contextPath}/proposal/verifyPassword`, {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({ memId, password }),
                })
                    .then(response => response.json())
                    .then(isValid => {
                        if (isValid) {
                            sessionStorage.setItem('verified', 'true'); // 세션에 검증 정보 저장
                            passwordModal.hide();
                            document.getElementById(`collapse${propNo}`).classList.add('show');
                        } else {
                            alert('비밀번호가 올바르지 않습니다.');
                        }
                    });
            });
        }
    });
});


// 답변 추가 버튼 클릭 이벤트
    document.querySelectorAll(".answer-button").forEach(button => {
        button.addEventListener("click", () => {
            const propNo = button.dataset.propNo; // 답변 번호
            document.getElementById("propNo").value = propNo; // Hidden input에 설정
            const answerModal = new bootstrap.Modal(document.getElementById("answerModal"));
            answerModal.show(); // 모달 표시
        });
    });


    </script>
</body>
</html>
