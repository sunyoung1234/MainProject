<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sub Navbar</title>
<style>
/* 공통 스타일 */
body {
    font-family: Arial, sans-serif;
}

.sub-nav-bar {
    background-color: #0056b3;
    margin-top: 20px;
    display: flex;
    padding: 10px 150px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.sub-nav-list {
    list-style: none;
    margin: 0;
    padding: 0;
    display: flex;
    align-items: center;
}

.sub-nav-item {
    position: relative;
    margin: 0 10px;
    margin-left: 50px;
    padding: 0px 60px;
}

.sub-nav-item > a {
    color: white;
    text-decoration: none;
    font-size: 18px;
    font-weight: bold;
    padding: 10px 15px;
    border-radius: 6px;
    transition: background-color 0.3s ease, color 0.3s ease;
}

.sub-nav-item > a:hover {
    background-color: rgba(255, 255, 255, 0.2);
    color: #fff;
}

.arrow-icon {
    margin-left: 5px;
    transition: transform 0.3s ease;
}

.sub-nav-item.show .arrow-icon {
    transform: rotate(180deg);
}

/* 드롭다운 메뉴 */
.sub-nav-dropdown-menu {
    position: absolute;
    top: 100%;
    left: 0;
    background-color: white;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
    border-radius: 8px;
    overflow: hidden;
    opacity: 0;
    visibility: hidden;
    transform: translateY(-20px);
    transition: all 0.3s ease;
    z-index: 1000;
}

.sub-nav-item.show .sub-nav-dropdown-menu {
    opacity: 1;
    visibility: visible;
    transform: translateY(0);
}

.sub-nav-dropdown-item {
    display: block;
    padding: 12px 20px;
    text-decoration: none;
    color: #333;
    font-size: 16px;
    transition: background-color 0.3s ease, color 0.3s ease;
}

.sub-nav-dropdown-item:hover {
    background-color: #f5f5f5;
    color: #0056b3;
}

.sub-nav-dropdown-item:not(:last-child) {
    border-bottom: 1px solid #eaeaea;
}
</style>
</head>
<body>
<div class="sub-nav-bar">
    <ul class="sub-nav-list">
        <li class="sub-nav-item"><a href="#">고객지원</a></li>
        <li class="sub-nav-item">
            <a href="#" class="active">메뉴 <span class="arrow-icon">&#9662;</span></a>
            <div class="sub-nav-dropdown-menu">
                <a href="${pageContext.request.contextPath}/chatListview" class="sub-nav-dropdown-item">챗봇 상담</a>
                <a href="${pageContext.request.contextPath}/faq/view" class="sub-nav-dropdown-item">자주 묻는 질문</a>
                <a href="${pageContext.request.contextPath}/guideView" class="sub-nav-dropdown-item">이용 가이드</a>
                <a href="${pageContext.request.contextPath}/proposalView" class="sub-nav-dropdown-item">건의 사항</a>
            </div>
        </li>
    </ul>
</div>

<script>
// 드롭다운 메뉴 토글
document.addEventListener("DOMContentLoaded", function () {
    const dropdownToggles = document.querySelectorAll(".sub-nav-item > a.active");

    dropdownToggles.forEach((toggle) => {
        toggle.addEventListener("click", function (e) {
            e.preventDefault();
            const parentItem = this.closest(".sub-nav-item");

            // 토글 상태 변경
            const isOpen = parentItem.classList.contains("show");
            document.querySelectorAll(".sub-nav-item").forEach((item) => {
                item.classList.remove("show");
            });

            if (!isOpen) {
                parentItem.classList.add("show");
            }
        });
    });

    // 페이지의 다른 곳을 클릭하면 드롭다운 닫기
    document.addEventListener("click", function (e) {
        if (!e.target.closest(".sub-nav-item")) {
            document.querySelectorAll(".sub-nav-item").forEach((item) => {
                item.classList.remove("show");
            });
        }
    });
});
</script>
</body>
</html>
