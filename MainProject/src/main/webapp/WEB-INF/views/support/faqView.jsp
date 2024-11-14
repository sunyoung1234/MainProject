<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>자주 묻는 질문</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" />

<style>
/* 스타일 정의 */
.faq-header {
    font-size: 28px;
    font-weight: bold;
    color: #333;
    margin-bottom: 30px; /* 제목과 FAQ 문항 사이의 간격 */
}
.faq-item {
    border: 1px solid #ddd;
    border-radius: 8px;
    margin-bottom: 15px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
    transition: box-shadow 0.3s ease;
}
.faq-item:hover {
    box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.15);
}
.faq-question {
    padding: 15px;
    display: flex;
    align-items: center;
    font-weight: bold;
    cursor: pointer;
}
.faq-icon {
    font-size: 20px;
    margin-right: 10px;
    color: #007bff;
}
.faq-answer {
    margin-top: 10px;
    padding: 0 15px 15px 45px;
    display: none;
    font-size: 15px;
    color: #555;
}
.faq-answer.show {
    display: block;
    animation: smoothExpand 0.5s ease;
}
@keyframes smoothExpand {
    from { max-height: 0; opacity: 0; }
    to { max-height: 500px; opacity: 1; }
}
</style>
</head>

<body>

    <%@ include file="/WEB-INF/inc/top.jsp"%>
	<!-- ChatBot START -->
	<%@ include file="/WEB-INF/inc/chatbot.jsp" %>
	<!-- ChatBot END -->
    <main class="container my-5">
        <h1 class="text-center faq-header mb-5">자주 묻는 질문</h1>

        <div id="faqAccordion">
            <c:forEach var="faq" items="${faqList}">
                <div class="faq-item">
                    <div class="faq-question" data-target="#answer${faq.faqId}">
                        <span class="faq-icon">Q</span>
                        <span>${faq.question}</span>
                    </div>
                    <div id="answer${faq.faqId}" class="faq-answer">
                        ${faq.answer}
                    </div>
                </div>
            </c:forEach>
        </div>
    </main>

    <%@ include file="/WEB-INF/inc/footer.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        // 클릭 시 답변 표시
        $(document).ready(function() {
            $(".faq-question").on("click", function() {
                var target = $(this).data("target");
                $(target).toggleClass("show");
            });
        });
    </script>
</body>
</html>
