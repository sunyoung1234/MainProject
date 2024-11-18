<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <title>채팅방</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <style>
        .chatcontent {
            height: 500px;
            overflow-y: auto;
            padding: 15px;
            background-color: #f9f9f9;
            border-radius: 10px;
            border: 1px solid #ddd;
            margin-bottom: 20px;
            display: flex;
            flex-direction: column;
        }
        .chat-box {
            padding: 10px;
            border-radius: 10px;
            max-width: 60%;
            margin-bottom: 10px;
            word-wrap: break-word;
        }
        .myChat {
            background-color: #007bff;
            color: white;
            align-self: flex-end;
            text-align: right;
        }
        .otherChat {
            background-color: #e9ecef;
            color: black;
            align-self: flex-start;
        }
        .system-message {
            text-align: center;
            font-size: 0.9rem;
            color: #888;
        }
        .main-title {
            margin-bottom: 30px;
            text-align: center;
            font-size: 1.8rem;
            color: #333;
        }
    </style>
</head>
<body id="page-top">
    <%@ include file="/WEB-INF/inc/top.jsp"%>
    <section class="page-section" id="contact">
        <div class="container pt-5">
            <div class="main-title">${room.roomName} 채팅방</div>
            <div class="chatcontent">
                <ul id="chatList" class="list-unstyled">
                    <li class="system-message">${sessionScope.login.memName}님이 입장하셨습니다.</li>
                    <c:forEach items="${chatList}" var="chat">
                        <c:choose>
                            <c:when test="${sessionScope.login.memId eq chat.memId}">
                                <li class="myChat chat-box">
                                    <div class="username">${chat.memName}</div>
                                    <div>${chat.chatMsg}</div>
                                    <small class="text-muted">${chat.sendDate}</small>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="otherChat chat-box">
                                    <div class="username">${chat.memName}</div>
                                    <div>${chat.chatMsg}</div>
                                    <small class="text-muted">${chat.sendDate}</small>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </ul>
            </div>
            <div class="input-group">
                <input type="text" id="msgi" class="form-control" placeholder="메시지 입력..." />
                <button id="btnSend" class="btn btn-primary ms-2">보내기</button>
                <a href="/main/chatListView" id="btnBack" class="btn btn-secondary ms-2">뒤로 가기</a>
            </div>
        </div>
    </section>
    <%@ include file="/WEB-INF/inc/footer.jsp"%>
<script>
    $(document).ready(function () {
        const roomNo = "${room.roomNo}";
        const memId = "${sessionScope.login.memId}";
        const memName = "${sessionScope.login.memName}";
        const sock = new SockJS("${pageContext.request.contextPath}/endpoint");
        const client = Stomp.over(sock);

        client.connect({}, function () {
            console.log("WebSocket connected");

            client.subscribe(`/subscribe/chat/${roomNo}`, function (message) {
                const chat = JSON.parse(message.body);
                console.log("서버로부터 받은 메시지:", chat);
                appendMessage(chat);
            });
        }, function (error) {
            console.error("WebSocket connection failed:", error);
        });

        function appendMessage(chat) {
            if (!chat || !chat.chatMsg) {
                console.error("유효하지 않은 메시지 객체입니다:", chat);
                return;
            }
            const messageType = chat.memId === memId ? "myChat" : "otherChat";
            const messageHtml = `
                <li class="${messageType} chat-box">
                    <div class="username">${chat.memName}</div>
                    <div>${chat.chatMsg}</div>
                    <small class="text-muted">${chat.sendDate || "방금"}</small>
                </li>`;
            $('#chatList').append(messageHtml);
            $('.chatcontent').scrollTop($('.chatcontent')[0].scrollHeight);
            console.log("메시지가 화면에 추가되었습니다:", chat);
        }

        function sendMessage() {
            const message = $('#msgi').val().trim();
            if (!message) {
                alert("메시지를 입력하세요.");
                return;
            }
            const chatMessage = {
                chatMsg: message,
                memId: memId,
                memName: memName,
                roomNo: roomNo
            };
            client.send(`/app/hello/${roomNo}`, {}, JSON.stringify(chatMessage));
            console.log("보낸 메시지:", chatMessage);
            $('#msgi').val('').focus();
        }

        $('#btnSend').click(sendMessage);

        $('#msgi').keydown(function (e) {
            if (e.key === "Enter") {
                e.preventDefault();
                sendMessage();
            }
        });

        window.onbeforeunload = function () {
            const exitMessage = {
                chatMsg: `${memName}님이 퇴장하셨습니다.`,
                memId: memId,
                memName: memName,
                roomNo: roomNo,
                systemMessage: true
            };
            client.send(`/app/hello/${roomNo}`, {}, JSON.stringify(exitMessage));
            client.disconnect();
        };
    });
</script>
</body>
</html>
