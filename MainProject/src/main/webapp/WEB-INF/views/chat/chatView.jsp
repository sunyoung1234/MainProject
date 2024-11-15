<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <title>채팅방</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <style>
        /* 채팅창 스타일 */
        .chatcontent {
            height: 400px;
            overflow-y: auto;
            padding: 10px;
            background-color: #f5f5f5;
            border-radius: 10px;
            margin-bottom: 10px;
            display: flex;
            flex-direction: column;
            border: 1px solid #ddd;
        }
        .input-group {
            margin-top: 10px;
            display: flex;
            gap: 10px;
        }
        .chat-box {
            padding: 8px;
            border-radius: 8px;
            max-width: 60%;
            margin: 5px 0;
            word-break: break-word;
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
            color: #888;
            font-size: 0.9em;
            text-align: center;
            margin: 5px 0;
            width: 100%;
        }
        .chat-container ul {
            list-style: none;
            padding: 0;
            margin: 0;
            width: 100%;
        }
        .chat-container li {
            margin-bottom: 5px;
            width: 100%;
            display: flex;
            flex-direction: column;
        }
        .username {
            font-weight: bold;
        }
        .timestamp {
            font-size: 0.8em;
            color: #666;
            margin-top: 5px;
            text-align: right;
        }
        .main_tit h1 {
            margin-bottom: 20px;
            font-size: 1.5em;
            color: #333;
        }
    </style>
</head>
<body id="page-top">
    <%@ include file="/WEB-INF/inc/top.jsp"%>
    <section class="page-section" id="contact">
        <div class="container pt-5">
            <div class="main_tit"><h1>${room.roomName} 채팅방</h1></div>
            <div class="content chatcontent chat-container" data-room-no="${room.roomNo}">
                <ul id="chatList">
                    <!-- 입장 메시지 표시 -->
                    <li class="system-message">${sessionScope.login.memName}님이 입장하셨습니다.</li>
                    <c:forEach items="${chatList}" var="chat">
                        <c:choose>
                            <c:when test="${sessionScope.login.memId eq chat.memId}">
                                <li class="myChat chat-box">
                                    <div class="username">${chat.memName}</div>
                                    <div>${chat.chatMsg}</div>
                                    <div class="timestamp">${chat.sendDate}</div>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="otherChat chat-box">
                                    <div class="username">${chat.memName}</div>
                                    <div>${chat.chatMsg}</div>
                                    <div class="timestamp">${chat.sendDate}</div>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </ul>
            </div>
            <div class="input-group">
                <input type="text" id="msgi" class="form-control" placeholder="메시지 입력..." />
                <button id="btnSend" class="btn btn-secondary">보내기</button>
                <button id="btnBack" class="btn btn-primary">뒤로 가기</button>
            </div>
            <c:if test="${sessionScope.login.memId eq room.memId || sessionScope.login.memId eq 'admin'}">
                <button id="btnClearChat" class="btn btn-danger mt-2">대화 삭제</button>
            </c:if>
        </div>
    </section>
    <%@ include file="/WEB-INF/inc/footer.jsp"%>
    <script>
        $(document).ready(function() {
            // WebSocket 연결 설정
            var client;
            var sock = new SockJS("${pageContext.request.contextPath}/endpoint");
            client = Stomp.over(sock);
            var roomNo = "${room.roomNo}";

            client.connect({}, function() {
                client.subscribe('/subscribe/chat/' + roomNo, function(chat) {
                    let content = JSON.parse(chat.body);
                    let v_tag = renderList(content);
                    $("#chatList").append(v_tag);
                    $(".chatcontent").scrollTop($(".chatcontent")[0].scrollHeight); // 스크롤 자동 내리기
                });
            });

            function renderList(vo) {
                if (vo.systemMessage) {
                    return `<li class="system-message">${vo.memName}님이 ${vo.chatMsg}</li>`;
                } else {
                    let chatStyle = vo.memId === "${sessionScope.login.memId}" ? "myChat" : "otherChat";
                    return `
                        <li class="${chatStyle} chat-box">
                            <div class="username">${vo.memName}</div>
                            <div>${vo.chatMsg}</div>
                            <div class="timestamp">${vo.sendDate}</div>
                        </li>`;
                }
            }

            // 메시지 보내기 함수
            function sendMessage() {
                let message = $('#msgi').val();
                if (!message) return;

                client.send('/app/hello/' + roomNo, {}, JSON.stringify({
                    chatMsg: message,
                    memId: "${sessionScope.login.memId}",
                    memName: "${sessionScope.login.memName}",
                    roomNo: roomNo
                }));
                $('#msgi').val('');
            }

            // 버튼 클릭으로 메시지 보내기
            $('#btnSend').click(sendMessage);

            // 엔터 키로 메시지 보내기
            $('#msgi').keydown(function(event) {
                if (event.key === "Enter") {
                    event.preventDefault(); // 기본 Enter 키 동작 방지
                    sendMessage();
                }
            });

            // 뒤로가기 버튼 클릭 시 퇴장 메시지 추가 후 목록으로 이동
            $('#btnBack').click(function() {
                let leaveMessage = `<li class="system-message">${sessionScope.login.memName}님이 퇴장하셨습니다.</li>`;
                $("#chatList").append(leaveMessage);
                client.send('/app/hello/' + roomNo, {}, JSON.stringify({
                    chatMsg: leaveMessage,
                    memId: "${sessionScope.login.memId}",
                    memName: "${sessionScope.login.memName}",
                    roomNo: roomNo,
                    systemMessage: true
                }));
                window.location.href = "${pageContext.request.contextPath}/chatListView";
            });

            // 대화 삭제 버튼
            $('#btnClearChat').click(function() {
                $.post("${pageContext.request.contextPath}/clearChat", { roomNo: roomNo }, function() {
                    $("#chatList").empty();
                    $("#chatList").append(`<li class="system-message">대화가 모두 삭제되었습니다.</li>`);
                });
            });
        });
    </script>
</body>
</html>
