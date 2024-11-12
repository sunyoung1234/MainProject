<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
/* 챗봇 아이콘 스타일 */
.chatbot-icon {
	position: fixed;
	bottom: 20px;
	right: 20px;
	width: 60px;
	height: 60px;
	background-image:
		url('${pageContext.request.contextPath}/resources/image/챗봇아이콘.png');
	background-size: cover;
	background-position: center;
	cursor: pointer;
	z-index: 1000;
}

/* 챗봇 인터페이스 스타일 */
.chatbot-interface {
	position: fixed;
	bottom: 90px;
	right: 20px;
	width: 300px;
	height: 400px;
	background-color: white;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	display: flex;
	flex-direction: column;
	z-index: 1000;
}

/* 챗봇 헤더 */
.chatbot-header {
	background-color: #007bff;
	color: white;
	padding: 10px;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.chatbot-header .close-btn {
	cursor: pointer;
	font-size: 20px;
}

/* 챗봇 콘텐츠 영역 */
.chatbot-content {
	flex-grow: 1;
	padding: 10px;
	overflow-y: auto; /* 스크롤바 추가 */
	font-size: 14px;
}

/* 챗봇 입력 영역 */
.chatbot-footer {
	padding: 10px;
	border-top: 1px solid #ddd;
}

.chatbot-footer input[type="text"] {
	width: 100%;
	padding: 5px;
	border: 1px solid #ddd;
	border-radius: 5px;
}


<style>
/* 사용자와 봇의 메시지 스타일 */
.user-message, .bot-message {
    padding: 8px 12px;
    margin: 5px;
    border-radius: 10px;
    max-width: 80%;
    word-wrap: break-word;
}

.user-message {
    background-color: #dcf8c6;
    text-align: right;
    align-self: flex-end;
}

.bot-message {
    background-color: #f1f0f0;
    text-align: left;
    align-self: flex-start;
}


</style>

</head>
<body>
	<!-- 챗봇 아이콘 -->
	<div class="chatbot-icon"></div>
</body>

<!-- 챗봇 인터페이스 -->
<div class="chatbot-interface">
	<div class="chatbot-header">
		<span>Chatbot</span> <span class="close-btn">&times;</span>
	</div>
	<div class="chatbot-content">
		<!-- 기본 안내 메시지 -->
		<div class="bot-message">안녕하세요! 무엇을 도와드릴까요?</div>
	</div>
	<!-- 챗봇 입력 영역 -->
	<div class="chatbot-footer">
		<input type="text" id="chatbotInput" placeholder="메시지를 입력하세요...">
	</div>
</div>

<script>
$(document).ready(function() {
    const isChatbotOpen = localStorage.getItem("isChatbotOpen") === "true";
    if (isChatbotOpen) {
        $('.chatbot-interface').show();
    } else {
        $('.chatbot-interface').hide();
    }

    $('.chatbot-icon').on('click', function() {
        $('.chatbot-interface').toggle();
        localStorage.setItem("isChatbotOpen", $('.chatbot-interface').is(':visible'));
    });

    $('.close-btn').on('click', function() {
        $('.chatbot-interface').hide();
        localStorage.setItem("isChatbotOpen", "false");
    });

    // 초기 메시지 설정
    displayMessage("안녕하세요! 무엇을 도와드릴까요?", "bot");

    // 채팅 메시지 화면에 표시하는 함수
    function displayMessage(message, sender) {
        const messageClass = sender === "user" ? "user-message" : "bot-message";
        const messageElement = `<div class="${messageClass}">${message}</div>`;
        $(".chatbot-content").append(messageElement);
        $(".chatbot-content").scrollTop($(".chatbot-content")[0].scrollHeight);
        console.log(`displayMessage 호출됨. sender: ${sender}, message: ${message}`);
    }

    // 사용자가 메시지 입력 후 Enter 키를 누르면 메시지 전송
    $("#chatbotInput").on("keyup", function(e) {
        if (e.key === "Enter") {
            const userMessage = $(this).val(); // 텍스트 필드의 값을 가져오기
            console.log(`사용자가 입력한 메시지 (원본): ${userMessage}`);
            const trimmedMessage = userMessage.trim();
            console.log(`사용자가 입력한 메시지 (공백 제거): ${trimmedMessage}`);
            
            if (trimmedMessage) {
                displayMessage(trimmedMessage, "user"); // 사용자의 메시지를 화면에 표시
                $(this).val(""); // 입력 필드 초기화
            } else {
                console.warn("입력된 메시지가 없습니다.");
            }
        }
    });
});
</script>

</html>