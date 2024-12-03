<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js" integrity="sha512-1QvjE7BtotQjkq8PxLeF6P46gEpBRXuskzIVgjFpekzFVF4yjRgrQvTG1MTOJ3yQgvTteKAcO7DSZI92+u/yZw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js" integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat View</title>
    <style>
/* Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Body 스타일 */
body {
    font-family: 'Arial', sans-serif;
    background-color: #f4f6f8; /* 밝고 중립적인 배경색 */
    height: 1200px;
    padding: 20px;
}

/* 채팅 전체 컨테이너 */
.chat-container {
    width: 80%;
    height: 90%;
    display: flex;
    background-color: #ffffff;
    border-radius: 12px;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1); /* 부드러운 그림자 효과 */
    overflow: hidden;
    margin: auto;
    margin-top:70px;
    margin-bottom: 100px; 
}

/* 채팅 목록 섹션 */
.chat-list {
    width: 30%;
    background-color: #f9fafc;
    border-right: 1px solid #e0e0e0;
    overflow-y: auto;
}

/* 채팅 목록 헤더 */
.chat-list-header {
    padding: 15px;
    background-color: #007bff;
    color: #ffffff;
    font-size: 1.5rem;
    font-weight: bold;
    text-align: center;
    border-bottom: 2px solid #0056b3;
}

/* 채팅방 항목 스타일 */
.chat-item {
    display: flex;
    align-items: center;
    padding: 15px;
    cursor: pointer;
    transition: background-color 0.3s, transform 0.2s;
    border-bottom: 1px solid #e0e0e0;
}

.chat-item:hover {
    background-color: #eaf4fc; /* 밝은 파란색 */
    transform: translateX(5px); /* 살짝 오른쪽 이동 */
}

.chat-item.active {
    background-color: #ffe599; /* 부드러운 노란색 */
    font-weight: bold;
    border-left: 5px solid #f7c600; /* 강조 효과 */
}

/* 채팅방 프로필 이미지 */
.chat-item img {
    width: 45px;
    height: 45px;
    border-radius: 50%;
    margin-right: 10px;
    border: 2px solid #ddd;
}

/* 채팅방 정보 */
.chat-item .chat-info {
    flex: 1;
}

.chat-item .chat-info .chat-title {
    font-size: 1rem;
    font-weight: bold;
    color: #333;
}

.chat-item .chat-info .chat-preview {
    font-size: 0.9rem;
    color: #777;
    margin-top: 5px;
}

/* 시간 표시 */
.chat-item .chat-time {
    font-size: 0.8rem;
    color: #999;
}

/* 읽지 않은 메시지 카운트 */
.chat-item .unread-count {
    background-color: #ff4d4d;
    color: white;
    font-size: 0.8rem;
    padding: 5px 10px;
    border-radius: 50%;
    font-weight: bold;
    display: none; /* 기본 숨김 */
}

/* 애니메이션 */
.unread-count.animate {
    transform: scale(1.3);
    background-color: #ff6666;
    transition: transform 0.3s ease, background-color 0.3s ease;
}

/* 채팅창 섹션 */
.chat-window {
    flex: 1;
    display: flex;
    flex-direction: column;
    background-color: #ffffff;
}

/* 채팅창 헤더 */
.chat-header {
    padding: 15px;
    background-color: #007bff;
    color: #ffffff;
    font-size: 1.5rem;
    text-align: center;
    font-weight: bold;
    border-bottom: 2px solid #0056b3;
}

/* 채팅 메시지 영역 */
.chat-messages {
    flex: 1;
    padding: 15px;
    overflow-y: auto;
    background-color: #f9fafc;
    display: flex;
    flex-direction: column;
    gap: 10px;
}

/* 메시지 버블 */
.message {
    margin-bottom: 10px;
}

.message.sender {
    text-align: right;
}

.message.receiver {
    text-align: left;
}

.message div {
    display: inline-block;
    padding: 12px;
    border-radius: 12px;
    max-width: 70%;
    word-wrap: break-word;
}

.message.sender div {
    background-color: #007bff;
    color: #ffffff;
}

.message.receiver div {
    background-color: #f1f3f5;
    color: #333333;
}

/* 시간 표시 */
.message span {
    display: block;
    font-size: 0.8rem;
    color: #999999;
    margin-top: 5px;
}

/* 채팅 입력 영역 */
.chat-input {
    display: flex;
    padding: 15px;
    border-top: 1px solid #e0e0e0;
    background-color: #f9fafc;
    gap: 10px;
}

.chat-input input[type="text"] {
    flex: 1;
    padding: 12px;
    border-radius: 8px;
    border: 1px solid #ccc;
    font-size: 1rem;
}

.chat-input button {
    padding: 12px 20px;
    font-size: 1rem;
    background-color: #007bff;
    color: #ffffff;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.chat-input button:hover {
    background-color: #0056b3;
}

				
    </style>
</head>
<body>
	
	<%@ include file="/WEB-INF/inc/top.jsp" %>
	<%@ include file="/WEB-INF/inc/subnavbaradmin.jsp"%>

    <div class="chat-container">
        <!-- 채팅방 목록 -->
        <div class="chat-list">
            <div id="chat-list-header" class="chat-list-header">채팅 목록</div>
            <c:forEach items="${roomList}" var="room">
                <div class="chat-item">
                    <div style="display:none;" id="room-no" class="room-no">${room.roomNo}</div>
                    <div class="chat-info">
                        <div class="chat-title">${room.memName}</div>
                        <div class="chat-preview">${room.lastMessage }</div>
                    </div>
                    <div class="chat-time">${room.lastMessageTime }</div>
                    <div class="unread-count" style="${room.unreadCount > 0 ? 'display: inline-block;' : 'display: none;'}">${room.unreadCount }</div>
                </div>
            </c:forEach>
        </div>

        <!-- 채팅창 -->
        <div class="chat-window">
            <div class="chat-header" id="chat-header"></div>
            <div class="chat-messages" id="chat-messages"></div>
            <div class="chat-input">
                <input type="text" id="chat-input" placeholder="메시지를 입력하세요.">
                <button id="sendMsg" type="button">보내기</button>
            </div>
        </div>
    </div>
	
	<%@ include file="/WEB-INF/inc/footer.jsp" %>
	
    <script>
        let currentRoomNo = null;
        let currentSubscription = null;

        document.addEventListener('DOMContentLoaded', function () {
            const chatMessages = document.querySelector('#chat-messages');
            const chatInput = document.querySelector('#chat-input');
            const sendMsgButton = document.querySelector('#sendMsg');
            const rooms = document.querySelectorAll('.chat-item');

            const sock = new SockJS("${pageContext.request.contextPath}/endpoint");
            const client = Stomp.over(sock);

            client.connect({}, function () {
                console.log("WebSocket 연결 성공");
                
                

                client.subscribe('/subscribe/room', function (room) {
                	
                	
                    const roomData = JSON.parse(room.body);
                    
                    
                	if(currentRoomNo === roomData.roomNo){
	                	roomNo = currentRoomNo
	                	client.send('/app/updateUnreadZero/' + roomNo, {}, JSON.stringify({ roomNo })); 
	                	roomData.unreadCount = 0;
                	}
                    
                    addOrUpdateChatRoom(roomData);
                    
                });
                
                client.subscribe('/subscribe/delete', function (message) {
                    const roomData = JSON.parse(message.body);
                    deleteChatRoom(roomData.roomNo);
                    chatMessages.innerHTML = "";
                });
                

                rooms.forEach(room => {
                    room.addEventListener('click', function () {
                        const roomNo = Number(room.querySelector('#room-no').textContent);
                        const memName = room.querySelector('.chat-title').textContent;
                        selectChatRoom(roomNo, memName, room);
                    });
                });
                
                chatInput.addEventListener('keydown', function (event) {
                    if (event.key === 'Enter') {
                        event.preventDefault(); // 기본 Enter 동작 방지
                        sendMsgButton.click(); // 전송 버튼 클릭 이벤트 트리거
                    }
                });

                sendMsgButton.addEventListener('click', function () {
                    const messageContent = chatInput.value.trim();
                    if (!currentRoomNo || !messageContent) {
                        alert("메시지를 입력하거나 방을 선택하세요."); 
                        return;
                    }

                    client.send('/app/hello/' + currentRoomNo, {}, JSON.stringify({
                        chatMsg: messageContent,
                        memId: "${sessionScope.login.memId}",
                        memName: "${sessionScope.login.memName}",
                        roomNo: currentRoomNo
                    })); 
                    
                    $.ajax({
                        url: '${pageContext.request.contextPath}/userUnreadCount',
                        method: 'POST',
                        contentType: 'application/json',
                        data: JSON.stringify({ roomNo : currentRoomNo }),
                        success: function (messages) {
                            console.log(messages);
                        }
                    });
                    
                    $('#chat-input').val('');
                });
            });

            function selectChatRoom(roomNo, memName, chatItem) {
                if (currentRoomNo === roomNo){
                	client.send('/app/updateUnreadZero/' + roomNo, {}, JSON.stringify({ roomNo })); 
                	return;
                }

                currentRoomNo = roomNo;

                // 기존 활성화된 채팅방의 active 클래스 제거
                document.querySelectorAll('.chat-item').forEach(r => r.classList.remove('active'));
                chatItem.classList.add('active');

                // 읽지 않은 메시지 카운트 초기화
                const unreadElement = chatItem.querySelector('.unread-count');
                if (unreadElement) {
                    unreadElement.textContent = "0";
                    unreadElement.style.display = "none";
                }

                client.send('/app/updateUnreadZero/' + roomNo, {}, JSON.stringify({ roomNo }));

                // 기존 구독 해제 후 새로 구독
                if (currentSubscription) currentSubscription.unsubscribe();

                currentSubscription = client.subscribe('/subscribe/chat/' + roomNo, function (chat) {
                    const message = JSON.parse(chat.body);
                    const newMessage = renderList(message);
                    $("#chat-messages").append(newMessage);

                    updateChatItem(message.roomNo, message.chatMsg, message.sendDate);

                    chatMessages.scrollTop = chatMessages.scrollHeight;
                     
                    console.log("abcdefg")
                });

                // 기존 채팅 내역 불러오기
                $.ajax({
                    url: '${pageContext.request.contextPath}/getChatHistory',
                    method: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify({ roomNo }),
                    success: function (messages) {
                        chatMessages.innerHTML = messages.map(renderList).join('');
                        chatMessages.scrollTop = chatMessages.scrollHeight;
                    }
                });
            }


            function addOrUpdateChatRoom(roomData) {
                const chatList = document.querySelector('.chat-list');
                const chatListHeader = document.querySelector('#chat-list-header');
                const chatItems = document.querySelectorAll('.chat-item');
                let roomExists = false;

                chatItems.forEach(chatItem => {
                    const roomNoElement = chatItem.querySelector('.room-no');
                    if (roomNoElement && roomNoElement.textContent.trim() === String(roomData.roomNo)) {
                        roomExists = true;

                        const previewElement = chatItem.querySelector('.chat-preview');
                        const timeElement = chatItem.querySelector('.chat-time');
                        const unreadElement = chatItem.querySelector('.unread-count');

                        // 메시지 미리보기 및 시간 업데이트
                        if (previewElement) previewElement.textContent = roomData.lastMessage;
                        if (timeElement) timeElement.textContent = roomData.lastMessageTime;

                        // 안 읽은 메시지 업데이트 및 애니메이션 추가
                        const currentCount = parseInt(unreadElement.textContent) || 0;
                        if (roomData.unreadCount > currentCount) {
                            unreadElement.textContent = roomData.unreadCount;
                            unreadElement.style.display = 'inline-block';

                            unreadElement.classList.add('animate');
                            setTimeout(() => unreadElement.classList.remove('animate'), 300);
                        }

                        // 방을 헤더 아래로 이동
                        chatList.removeChild(chatItem);
                        chatList.insertBefore(chatItem, chatListHeader.nextSibling);
                    }
                });

                // 방이 존재하지 않는 경우 새로 추가
                if (!roomExists) {
                    const newChatItem = document.createElement('div');
                    newChatItem.className = 'chat-item';
                    newChatItem.setAttribute('data-room-no', roomData.roomNo);
                    newChatItem.innerHTML =
                        '<div style="display:none;" class="room-no">' + roomData.roomNo + '</div>' +
                        '<div class="chat-info">' +
                            '<div class="chat-title">' + roomData.memName + '</div>' +
                            '<div class="chat-preview">' + (roomData.lastMessage == null ? '새로운 상담요청' : roomData.lastMessage) + '</div>' + 
                        '</div>' +
                        '<div class="chat-time">' + (roomData.lastMessageTime == null ? '' : roomData.lastMessageTime) + '</div>' +
                        '<div class="unread-count" style="' + (roomData.unreadCount > 0 ? 'display: inline-block;' : 'display: none;') + '">' +
                            roomData.unreadCount +
                        '</div>';

                    newChatItem.addEventListener('click', function () {
                        selectChatRoom(roomData.roomNo, roomData.memName, newChatItem);
                    });

                    // 새 방을 헤더 바로 아래에 추가
                    chatList.insertBefore(newChatItem, chatListHeader.nextSibling);
                }
            }






            function renderList(vo) {
                const date = vo.sendDate; // 예: "2024-11-29 15:45"
                const isUserMessage = vo.memId === "${sessionScope.login.memId}";
                const isRead = vo.readYn === 'Y' ? "읽음" : "안 읽음";

                const messageContainer = document.createElement('div');
                messageContainer.className = isUserMessage ? 'message sender' : 'message receiver';

                const messageBubble = document.createElement('div');
                messageBubble.style.display = "inline-block";
                messageBubble.style.padding = "10px";
                messageBubble.style.borderRadius = "10px";
                messageBubble.style.maxWidth = "70%";
                messageBubble.style.wordWrap = "break-word";
                messageBubble.style.marginBottom = "5px";

                messageBubble.style.backgroundColor = isUserMessage ? "#007bff" : "#f0f0f0";
                messageBubble.style.color = isUserMessage ? "#fff" : "#000";
                messageContainer.style.textAlign = isUserMessage ? "right" : "left";

                messageBubble.textContent = vo.chatMsg;
                messageContainer.appendChild(messageBubble);

                const messageTime = document.createElement('span');
                messageTime.style.fontSize = "0.8rem";
                messageTime.style.color = "#999";
                messageTime.textContent = date;
                messageContainer.appendChild(messageTime);

                return messageContainer.outerHTML;
            }

            function updateChatItem(roomNo, lastMessage, sendTime) {
                const chatItems = document.querySelectorAll('.chat-item');
                chatItems.forEach(chatItem => {
                    const roomNoElement = chatItem.querySelector('.room-no');
                    if (roomNoElement && roomNoElement.textContent.trim() === String(roomNo)) {
                        const previewElement = chatItem.querySelector('.chat-preview');
                        const timeElement = chatItem.querySelector('.chat-time');
                        const unreadElement = chatItem.querySelector('.unread-count');

                        // 메시지 미리보기와 시간 업데이트
                        if (previewElement) previewElement.textContent = lastMessage;
                        if (timeElement) timeElement.textContent = sendTime;

                        // 현재 선택된 채팅방이 아니면 unreadCount 증가
                        if (currentRoomNo !== roomNo) {
                            const currentUnreadCount = parseInt(unreadElement.textContent) || 0;
                            unreadElement.textContent = currentUnreadCount + 1;
                            unreadElement.style.display = "inline-block"; // 숨겨진 경우 보이게 함
                        }

                        // 메시지가 수신된 경우에만 목록 상단으로 이동
                        if (currentRoomNo !== roomNo) {
                            const chatList = document.querySelector('.chat-list');
                            chatList.insertBefore(chatItem, chatList.firstChild);
                        }
                    }
                });
            }
            
            function deleteChatRoom(roomNo) {
                // 방번호에 해당하는 chat-item 요소 찾기
                const chatItems = document.querySelectorAll('.chat-item');
                chatItems.forEach(chatItem => {
                    const roomNoElement = chatItem.querySelector('.room-no');
                    if (roomNoElement && roomNoElement.textContent.trim() === String(roomNo)) {
                        // chat-item의 부모 요소에서 해당 chat-item 제거
                        chatItem.parentElement.removeChild(chatItem);
                        console.log('Chat room with roomNo ${roomNo} deleted.');
                    }
                });
            }


        });

        

    </script>
</body>
</html>