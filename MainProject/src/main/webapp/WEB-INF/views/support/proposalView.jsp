<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>건의사항 게시판</title>
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/assets/favicon.ico" />
<link href="${pageContext.request.contextPath}/resources/css/styles.css"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
</head>
<body class="d-flex flex-column">
<!-- 상단 네비게이션 바 -->
<%@ include file="/WEB-INF/inc/top.jsp"%>

<!-- 상세 메뉴 바 -->
<%@ include file="/WEB-INF/inc/subnavbarSupport.jsp"%>

<!-- 챗봇 아이콘 및 인터페이스 -->

	<main class="flex-shrink-0">
		<section class="py-5">
			<div class="container px-5">
				<div class="rounded-4 py-5 px-4 px-md-5">
					<div class="text-center mb-5">
						<h1 class="fw-bolder">건의사항 게시판</h1>
					</div>

					<div class="text-right mb-3">
						<c:if test="${sessionScope.login != null}">
							<a class="btn btn-success"
								href="${pageContext.request.contextPath}/proposal/write">
								건의사항 작성 </a>
						</c:if>
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
											<strong>작성일:</strong> ${proposal.formattedPropDate}
										</p>
										<p>
											<strong>내용:</strong> ${proposal.propContent}
										</p>

										<!-- 관리자 답변 표시 -->
										<c:if test="${not empty proposal.answerContent}">
											<hr />
											<div class="answer-section">
												<p>
													<strong>관리자 답변:</strong> ${proposal.answerContent}
												</p>
											</div>
										</c:if>

										<!-- 관리자만 답변 추가 버튼 표시 -->
										<c:if
											test="${sessionScope.login != null && sessionScope.login.memId eq 'admin'}">
											<button class="btn btn-primary answer-button"
												data-prop-no="${proposal.propNo}">답변 추가</button>
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
	<c:if test="${sessionScope.login.memId != 'admin' }">
	    <%@ include file="/WEB-INF/inc/chatbotbot.jsp"%>
	</c:if>
	<%@ include file="/WEB-INF/inc/footer.jsp"%>

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
						<button type="submit" class="btn btn-primary">저장</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
	document.querySelectorAll('.accordion-button').forEach(button => {
	    button.addEventListener('click', event => {
	        const requiresAuth = button.hasAttribute('data-requires-auth'); // 인증 필요 여부
	        const collapseTarget = document.getElementById(button.getAttribute('aria-controls')); // 목표 아코디언
	        const propNo = button.getAttribute('data-prop-no'); // 건의사항 번호
	        const isExpanded = button.getAttribute('aria-expanded') === 'true'; // 현재 열림 상태

	        if (requiresAuth) {
	            // 인증 필요
	            if (!sessionStorage.getItem(`verified-${propNo}`)) {
	                event.preventDefault(); // 기본 열림/닫힘 동작 중단

	                const passwordModal = new bootstrap.Modal(document.getElementById('passwordModal'));
	                passwordModal.show();

	                const passwordForm = document.getElementById('passwordForm');
	                passwordForm.onsubmit = async (e) => {
	                    e.preventDefault();

	                    const password = document.getElementById('passwordInput').value;
	                    const memId = button.getAttribute('data-mem-id'); // 작성자 ID

	                    try {
	                        const response = await fetch(`${pageContext.request.contextPath}/proposal/verifyPassword`, {
	                            method: 'POST',
	                            headers: { 'Content-Type': 'application/json' },
	                            body: JSON.stringify({ memId, password }),
	                        });

	                        const isValid = await response.json();
	                        if (isValid) {
	                            sessionStorage.setItem(`verified-${propNo}`, 'true'); // 인증 성공
	                            passwordModal.hide();
	                            collapseTarget.classList.add('show');
	                            button.setAttribute('aria-expanded', 'true');
	                        } else {
	                            alert('비밀번호가 올바르지 않습니다.');
	                        }
	                    } catch (error) {
	                        console.error('Error during password verification:', error);
	                    }
	                };
	                return;
	            }
	        }

	        // 인증이 완료된 상태이거나 인증이 필요 없는 경우
	        if (isExpanded) {
	            // 이미 열려 있는 경우 -> 닫기
	            collapseTarget.classList.remove('show');
	            button.setAttribute('aria-expanded', 'false');
	        } else {
	            // 닫혀 있는 경우 -> 열기
	            collapseTarget.classList.add('show');
	            button.setAttribute('aria-expanded', 'true');
	        }
	    });
	});


    window.onload = () => {
        fetch(`${pageContext.request.contextPath}/proposal/getSessionInfo`)
            .then(response => response.json())
            .then(sessionInfo => {
                if (sessionInfo && sessionInfo.memId === 'admin') {
                    sessionStorage.setItem('isAdmin', 'true');
                }
            })
            .catch(error => console.error('Error fetching session info:', error));
    };

    document.getElementById('logoutButton')?.addEventListener('click', () => {
        sessionStorage.clear();
    });
    
 // 답변 추가 버튼 클릭 이벤트
    document.querySelectorAll('.answer-button').forEach(button => {
        button.addEventListener('click', event => {
            const propNo = event.target.getAttribute('data-prop-no');
            document.getElementById('propNo').value = propNo;
            const answerModal = new bootstrap.Modal(document.getElementById('answerModal'));
            answerModal.show();
        });
    });
</script>

</body>
</html>
