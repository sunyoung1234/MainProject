<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>건의사항 작성</title>
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <link href="css/styles.css" rel="stylesheet" />
</head>
<body class="d-flex flex-column">

    <%@ include file="/WEB-INF/inc/top.jsp" %>

    <main class="flex-shrink-0">
        <div class="container py-5">
            <div class="rounded-4 py-5 px-4 px-md-5">
                <h2 class="text-center mb-5">건의사항 작성</h2>
                <form action="${pageContext.request.contextPath}/proposal/writeDo" method="post">
                    <label for="propTitle">건의사항 제목</label>
                    <input type="text" id="propTitle" name="propTitle" class="form-control mb-3" placeholder="제목을 입력하세요" required>

                    <label for="propContent">건의사항 내용</label>
                    <textarea id="propContent" name="propContent" class="form-control mb-3" rows="7" placeholder="내용을 입력하세요" required></textarea>

                    <button type="submit" class="btn btn-success mt-4 w-100">건의사항 제출</button>
                </form>
            </div>
        </div>
    </main>

    <%@ include file="/WEB-INF/inc/footer.jsp" %>

</body>
</html>
