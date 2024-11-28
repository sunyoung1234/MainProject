<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js" integrity="sha512-1QvjE7BtotQjkq8PxLeF6P46gEpBRXuskzIVgjFpekzFVF4yjRgrQvTG1MTOJ3yQgvTteKAcO7DSZI92+u/yZw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js" integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<style>
/* 챗봇 아이콘 스타일 */
.chatbot-icon {
    position: fixed;
    bottom: 20px;
    right: 20px;
    width: 60px;
    height: 60px;
    background-image: url('${pageContext.request.contextPath}/resources/image/챗봇아이콘.png');
    background-size: cover;
    cursor: pointer;
    z-index: 1000;
    transition: transform 0.3s ease;
}
.chatbot-icon:hover {
    transform: scale(1.1);
}

/* 챗봇 인터페이스 스타일 */
.chatbot-interface {
    position: fixed;
    bottom: 90px;
    right: 20px;
    width: 320px;
    height: 500px;
    background-color: #f9f9f9;
    border-radius: 15px;
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
    visibility: hidden;
    opacity: 0;
    display: flex;
    flex-direction: column;
    z-index: 1000;
    transition: visibility 0s, opacity 0.3s ease;
}

.chatbot-interface.show {
    visibility: visible;
    opacity: 1;
}

/* 챗봇 헤더 */
.chatbot-header {
    background-color: #4A90E2;
    color: white;
    padding: 12px;
    border-top-left-radius: 15px;
    border-top-right-radius: 15px;
    display: flex;
    justify-content: space-between;
    font-weight: bold;
    font-size: 16px;
}

.chatbot-header .close-btn {
    cursor: pointer;
    font-size: 22px;
}

/* 챗봇 본문 스타일 */
.chatbot-content {
    flex-grow: 1;
    overflow-y: auto;
    padding: 12px;
    display: flex;
    flex-direction: column;
    gap: 10px;
}

.bot-message {
    margin-bottom: 10px;
    font-size: 14px;
    background: #e7f3ff;
    border-radius: 10px;
    padding: 10px;
}

/* 버튼 스타일 */
.menu-btn {
    display: block;
    width: 100%;
    background-color: #e7f3ff;
    color: #4A90E2;
    border: none;
    border-radius: 8px;
    padding: 10px;
    text-align: left;
    margin: 5px 0;
    font-size: 14px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.menu-btn:hover {
    background-color: #d0e8ff;
}

/* 채팅방 영역 스타일 */
.chat-room {
    flex-grow: 1;
    display: none;
    flex-direction: column;
    background-color: #ffffff;
    border-radius: 10px;
    padding: 10px;
}

/* 채팅 내용 영역 */
.chat-area {
    flex-grow: 1;
    overflow-y: auto;
    padding: 10px;
    background-color: #f1f1f1;
    border-radius: 10px;
    display: flex;
    flex-direction: column;
    gap: 10px;
}

/* 메시지 스타일 */
.message {
    max-width: 70%;
    padding: 10px;
    border-radius: 10px;
    font-size: 14px;
}

.user-message {
    align-self: flex-end;
    background-color: #d1eaff;
    color: #0056b3;
    border-radius: 10px 0 10px 10px;
}

.agent-message {
    align-self: flex-start;
    background-color: #e7f3ff;
    color: #333;
    border-radius: 0 10px 10px 10px;
}

/* 입력 영역 스타일 */
.chat-input {
    display: flex;
    gap: 10px;
    margin-top: 10px; /* 채팅 종료 버튼과의 간격 */
}

.chat-input input {
    flex-grow: 1;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 14px;
}

.chat-input button {
    padding: 10px;
    border: none;
    border-radius: 5px;
    background-color: #4A90E2;
    color: white;
    cursor: pointer;
    font-size: 14px;
    transition: background-color 0.3s ease;
}



.chat-input button:hover {
    background-color: #357ab7;
}

/* 채팅방 카드 스타일 */
.chat-room-card {
    background-color: #f5f5f5;
    border-radius: 8px;
    margin: 10px 0;
    padding: 15px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    transition: transform 0.2s ease;
    cursor: pointer;
}

.chat-room-card:hover {
    transform: translateY(-5px);
}

.chat-room-header {
    display: flex;
    justify-content: space-between;
    font-size: 16px;
    font-weight: bold;
    color: #333;
}

.room-name {
    color: #4A90E2;
    font-size: 14px;
}

.room-date {
    font-size: 12px;
    color: #aaa;
}

.chat-room-body {
    margin-top: 10px;
}

.room-info {
    font-size: 12px;
    color: #555;
}

.room-number,
.room-owner {
    display: block;
}

.view-room-btn {
    display: inline-block;
    margin-top: 10px;
    padding: 8px 12px;
    background-color: #4A90E2;
    color: white;
    border-radius: 5px;
    text-decoration: none;
    font-weight: bold;
    transition: background-color 0.3s ease;
}

.view-room-btn:hover {
    background-color: #357ab7;
}

/* 채팅 종료 버튼 */
#endChat {
    position: relative; /* 부모 요소의 흐름에 따라 배치 */
    margin: 10px auto; /* 위, 아래 여백 설정 및 가운데 정렬 */
    width: 150px; /* 버튼 너비 */
    background-color: #ff4d4d; /* 빨간색 배경 */
    color: white;
    border: none;
    border-radius: 5px;
    padding: 10px 20px;
    font-size: 14px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    text-align: center; /* 텍스트 가운데 정렬 */
}

#endChat:hover {
    background-color: #d93636; /* 더 어두운 빨간색으로 변경 */
}


.modal {
    display: none; /* 기본적으로 숨김 */
    position: absolute; /* chatRoom 내부에 고정 */
    top: 50%; /* 세로 중앙 */
    left: 50%; /* 가로 중앙 */
    transform: translate(-50%, -50%);
    background-color: rgba(0, 0, 0, 0.5); /* 반투명 배경 */
    width: 100%; /* chatRoom 크기에 맞게 */
    height: 100%; /* chatRoom 크기에 맞게 */
    z-index: 1000;
    justify-content: center;
    align-items: center;
}

/* 모달 내용 */
.modal-content {
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    text-align: center;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
    width: 280px;
    animation: fadeIn 0.3s ease;
}

/* 버튼 스타일 */
.modal-actions {
    display: flex;
    justify-content: space-between;
    margin-top: 20px;
}

.confirm-btn {
    background-color: #ff4d4d;
    color: white;
    border: none;
    border-radius: 5px;
    padding: 10px 20px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.confirm-btn:hover {
    background-color: #d93636;
}

.cancel-btn {
    background-color: #ccc;
    color: black;
    border: none;
    border-radius: 5px;
    padding: 10px 20px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.cancel-btn:hover {
    background-color: #aaa;
}

/* 모달 애니메이션 */
@keyframes fadeIn {
    from {
        opacity: 0;
        transform: scale(0.9);
    }
    to {
        opacity: 1;
        transform: scale(1);
    }
}




</style>
</head>
<body>

	<!-- 챗봇 아이콘 -->
    <div class="chatbot-icon"></div>
    
    <!-- 챗봇 인터페이스 -->
    <div class="chatbot-interface">
	    <div class="chatbot-header">
	        <span>Chatbot</span>
	        <span class="close-btn">&times;</span>
	    </div>
			    <!-- 기본 챗봇 화면 -->
		<div class="chatbot-content" id="chatbotContent">
		    <div class="bot-message">안녕하세요! 무엇을 도와드릴까요?</div>
		    <div class="bot-message">
		        <button class="menu-btn" data-menu="quick-move">페이지 빠른 이동</button>
		        <button class="menu-btn" data-menu="faq">FAQ</button>
		        
		        
		        <!-- admin -->
		        <c:if test="${sessionScope.login != null && sessionScope.login.memId eq 'admin'}">
		            <button class="menu-btn" id="adminChat">사용자 상담 연결</button>
		            <button style="display:none;" class="menu-btn" id="connectAgent">상담사 연결</button>
		        </c:if>
		        
		        
		        
		        <!-- 사용자 -->
		        <c:if test="${sessionScope.login != null && sessionScope.login.memId ne 'admin'}">
		        	<button style="display:none;" class="menu-btn" id="adminChat">사용자 상담 연결</button>
		            <button class="menu-btn" id="connectAgent">상담사 연결</button>
		        </c:if>
		        
		        
		        
		    </div>
		</div>
		
		<!-- 채팅방 영역 -->
		<div class="chat-room" id="chatRoom">
		    <div class="chat-area" id="chatArea"></div>
		    <div class="chat-input">
		        <input type="text" id="userMessage" placeholder="메시지를 입력하세요..." />
		        <button id="sendMessage">전송</button>
		    </div>
		    
		</div>
		

		


	</div>

	
	<script type="text/javascript">
		
		var client;
	
		// 아이콘 클릭 시 챗봇 인터페이스 열기/닫기
		document.querySelector('.chatbot-icon').addEventListener('click', function () {
		    const chatbotInterface = document.querySelector('.chatbot-interface');
		    if (chatbotInterface.classList.contains('show')) {
		        chatbotInterface.classList.remove('show'); // 인터페이스 닫기
		    } else {
		        chatbotInterface.classList.add('show'); // 인터페이스 열기
		    }
		});
	 
		// 닫기 버튼 클릭 시 인터페이스 닫기
		document.querySelector('.close-btn').addEventListener('click', function () {
		    const chatbotInterface = document.querySelector('.chatbot-interface');
		    chatbotInterface.classList.remove('show');
		});
		
		document.querySelector('#adminChat').addEventListener('click',()=>{
			const chatRoom = document.getElementById('chatRoom');
		    const chatbotContent = document.querySelector('.chatbot-content');

		    // 기본 챗봇 화면 숨기기
		    chatbotContent.style.display = 'none';

		    // 채팅방 표시
		    chatRoom.style.display = 'flex';
		    
		    
		    // 여기서 채팅방 리시트 보여주고 채팅방 클릭시 번호를 따와서 연결시키면 끝
		    
		    var roomNo = 233;
		    var messageInput = $('#userMessage');
			// 소켓 통신 객체 생성 (sockjs 객체에 WebSocketConfig에서 설정한 /endpoint 주소 입력)
			var sock = new SockJS("${pageContext.request.contextPath}/endpoint");
			// sockjs 객체로부터 stomp 객체 생성
			client = Stomp.over(sock);
			
			document.querySelector('#sendMessage').addEventListener('click',()=>{
				
				var messageContent = document.querySelector('#userMessage').value;
				
				client.send('/app/hello/' + roomNo, {}, 
				JSON.stringify({
					chatMsg : messageContent,
					memId : "${sessionScope.login.memId }",
					memName : "${sessionScope.login.memName }",
					roomNo : 233
				}));
				messageInput.val('');
			})  
			
			
			// 연결이 맺어지면 실행
			client.connect({},function() {
				// 상대방이 보낸 메세지 전달 받을 때마다 실행         
				client.subscribe('/subscribe/chat/'+ 233, function(chat) {
					// 받은 데이터
					let content = JSON.parse(chat.body);
					
					// 받은 데이터를 그려줄 html 코드
					let v_tag = renderList(content);
					$("#chatArea").append(v_tag); 
					
				});
	
			});
		})
		
		// 상담사 연결 버튼 클릭 이벤트
		document.querySelector('#connectAgent').addEventListener('click', function () {
		    const chatRoom = document.getElementById('chatRoom');
		    const chatbotContent = document.querySelector('.chatbot-content');

		    // 기본 챗봇 화면 숨기기
		    chatbotContent.style.display = 'none';

		    // 채팅방 표시
		    chatRoom.style.display = 'flex';
			
		    // AJAX 요청으로 컨트롤러와 연결
		    $.ajax({
		        url: '${pageContext.request.contextPath}/connect-agent', // 컨트롤러의 매핑 주소
		        method: 'POST',
		        contentType: 'application/json',
		        data: JSON.stringify({
		            memId: "${sessionScope.login.memId}",
		            memName: "${sessionScope.login.memName}"
		        }),
		        success: function (response) {
		            console.log(response);
				    // 기본 상담사 메시지
				    const chatArea = document.getElementById('chatArea');
				    if (chatArea.innerHTML.trim() === '') {
				        // 상담사 초기 메시지를 추가
				        const agentMessage = document.createElement('div');
				        agentMessage.className = 'message agent-message';
				        agentMessage.textContent = '안녕하세요! 상담사입니다. 무엇을 도와드릴까요?';
				        chatArea.appendChild(agentMessage);
				    }
				    
				    var roomNo = response.roomNo;
				    var messageInput = $('#userMessage');
					// 소켓 통신 객체 생성 (sockjs 객체에 WebSocketConfig에서 설정한 /endpoint 주소 입력)
					var sock = new SockJS("${pageContext.request.contextPath}/endpoint");
					// sockjs 객체로부터 stomp 객체 생성
					client = Stomp.over(sock);
					
					
					document.querySelector('#sendMessage').addEventListener('click',()=>{
						
						var messageContent = document.querySelector('#userMessage').value;
						
						client.send('/app/hello/' + roomNo, {}, 
						JSON.stringify({
							chatMsg : messageContent,
							memId : "${sessionScope.login.memId }",
							memName : "${sessionScope.login.memName }",
							roomNo : response.roomNo  
						}));
						messageInput.val('');
					})  
					client.debug = function(message) {
					    console.log("STOMP debug:", message); // 디버그 메시지 출력
					};
					
					// 연결이 맺어지면 실행
					client.connect({},function() {
						
						console.log(response.roomNo); 
						// 상대방이 보낸 메세지 전달 받을 때마다 실행         
						client.subscribe('/subscribe/chat/'+ response.roomNo, function(chat) {
							// 받은 데이터
							console.log("subscribe success");
							
							let content = JSON.parse(chat.body);
							// 받은 데이터를 그려줄 html 코드
							let v_tag = renderList(content);
							$("#chatArea").append(v_tag); 
							
						},function(error) {
						    console.error("Subscription error:", error); // 구독 실패 시 오류 출력
						}); 
			
					});
				    
		        },
		        error: function (xhr, status, error) {
		            console.error('Error connecting to agent:', error);
		        }
		    });
		    
		    
		});
		
		function renderList(vo){
			// 날짜 포맷
			var date = vo.sendDate;
			var html = "";
			var content ="";
			 
			//내가 보낸 채팅일 경우
			if(vo.memId=="${sessionScope.login.memId }"){
				const userMessage = document.createElement('div');
		        userMessage.className = 'message user-message';
		        userMessage.textContent = vo.chatMsg;
		        chatArea.appendChild(userMessage);
		        
		        html = userMessage
			}else{
				// 다른 사람의 채팅
				const agentMessage = document.createElement('div');
		        agentMessage.className = 'message agent-message';
		        agentMessage.textContent = vo.chatMsg;
		        chatArea.appendChild(agentMessage);
		        
		        html = agentMessage
			}
			console.log(html);
			return html;
		}

		

		
		



		
	</script>
		
</body>
</html>