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
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            height: 100vh;
            background-color: #f0f0f0;
        }

        /* 전체 화면 중앙 배치 및 너비 조정 */
        .chat-container {
            width: 80%;
            height: 90%;
            margin-top: 20px;
            display: flex;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        /* 왼쪽 채팅방 목록 스타일 */
        .chat-list {
            width: 30%;
            border-right: 1px solid #ccc;
            overflow-y: auto;
            background-color: #f9f9f9;
        }

        .chat-list-header {
            padding: 15px;
            background-color: #007bff;
            color: #fff;
            font-size: 1.2rem;
            font-weight: bold;
        }

       .chat-item {
		    display: flex;
		    align-items: center;
		    padding: 15px;
		    border-bottom: 1px solid #ddd;
		    cursor: pointer;
		    transition: background-color 0.3s, transform 0.2s;
		}
		
		.chat-item:hover {
		    background-color: #f0f8ff; /* 은은한 파란색 배경 */
		    transform: translateX(5px); /* 살짝 오른쪽으로 이동 */
		}
		
		.chat-item.active {
		    background-color: #007bff; /* 선택된 항목의 파란 배경 */
		    color: #fff;
		}
		
		.chat-item img {
		    width: 40px;
		    height: 40px;
		    border-radius: 50%; /* 동그란 프로필 이미지 */
		    margin-right: 10px; /* 이미지와 텍스트 간 간격 */
		    border: 2px solid #ccc;
		}
		
		.chat-item .chat-info {
		    flex: 1;
		}
		
		.chat-item .chat-info .chat-title {
		    font-weight: bold;
		    font-size: 1rem;
		}
		
		.chat-item .chat-info .chat-preview {
		    font-size: 0.9rem;
		    color: #555;
		    margin-top: 5px;
		}
		
		.chat-item .chat-time {
		    font-size: 0.8rem;
		    color: #999;
		}

        /* 오른쪽 채팅창 스타일 */
        .chat-window {
            flex: 1;
            display: flex;
            flex-direction: column;
            background-color: #fff;
        }

        .chat-header {
            padding: 15px;
            background-color: #007bff;
            color: #fff;
            font-size: 1.2rem;
        }

        .chat-messages {
            flex: 1;
            padding: 15px;
            overflow-y: auto;
            background-color: #f4f4f4;
        }

        .message {
            margin-bottom: 15px;
        }

        .message.sender {
            text-align: right;
        }

        .message.receiver {
            text-align: left;
        }


        .chat-input form {
            display: flex;
        }
        .chat-input {
		    padding: 15px; /* 위아래 여백을 늘려 입력 영역 크기 조정 */
		    border-top: 1px solid #ccc;
		    background-color: #f9f9f9;
		    display: flex;
		    align-items: center; /* 버튼과 입력 필드 수직 정렬 */
		    gap: 10px; /* 입력 필드와 버튼 사이 간격 */
		}
		
		/* 입력 필드 */
		.chat-input input[type="text"] {
		    flex: 1; /* 남는 공간을 입력 필드가 채움 */
		    padding: 12px; /* 입력 필드 높이 조정 */
		    border: 1px solid #ccc;
		    border-radius: 8px; /* 둥근 테두리 */
		    font-size: 1rem; /* 텍스트 크기 증가 */
		}
		
		/* 보내기 버튼 */
		.chat-input button {
		    padding: 12px 20px; /* 버튼 크기 조정 */
		    font-size: 1rem; /* 텍스트 크기 증가 */
		    border: none;
		    background-color: #007bff;
		    color: #fff;
		    border-radius: 8px; /* 둥근 테두리 */
		    cursor: pointer;
		    transition: background-color 0.3s;
		}
		
		.chat-input button:hover {
		    background-color: #0056b3; /* 버튼 hover 시 어두운 파란색 */
		}
    </style>
</head>
<body>

    <div class="chat-container">
        <!-- 왼쪽 채팅방 목록 -->
        <div class="chat-list">
            <div class="chat-list-header">채팅 목록</div>
            <c:forEach items="${roomList }" var="room">
            
            	<div class="chat-item" >
				    <div class="room-no">${room.roomNo }</div>   
				    <div class="chat-info">
				        <div class="chat-title">${room.memName }</div>
				        <div class="chat-preview">마지막 메시지가 여기에 표시됩니다.</div>
				    </div>
				    <div class="chat-time">오후 3:45</div>
				</div>
            
            </c:forEach>
        </div>

        <!-- 오른쪽 채팅창 -->
        <div class="chat-window">
            <!-- 채팅방 헤더 -->
            <div class="chat-header" id="chat-header">111</div> 

            <!-- 채팅 메시지 -->
            <div class="chat-messages" id="chat-messages">
            
            
            
            </div>

            <!-- 메시지 입력 -->
            <div class="chat-input">
                <form onsubmit="sendMessage(event)">
                    <input type="text" id="chat-input" placeholder="메시지를 입력하세요.">
                    <button id="sendMsg" type="submit">보내기</button>
                </form>
            </div>
        </div>
    </div>

    <script>
    	let rooms = document.querySelectorAll('.chat-item');
    	let chatWindow = document.querySelectorAll('.chat-window')[0];
    	let v_alpha = "";
    	
        var sock = new SockJS("${pageContext.request.contextPath}/endpoint");
        var client = Stomp.over(sock);

        client.connect({}, function () {
            console.log("WebSocket 연결 성공");
            
            rooms.forEach((room,idx) =>{
            	room.addEventListener('click',()=>{
            		let roomNo = ${roomList.get(idx).roomNo};
            		let memName = '${roomList.get(idx).memName}';
            		chatWindow.innerHTML = "";
            		$.ajax({
        		        url: '${pageContext.request.contextPath}/getChatHistory', // 컨트롤러의 매핑 주소
        		        method: 'POST', 
        		        contentType: 'application/json',
        		        data: JSON.stringify({
        		            roomNo: roomNo,
        		        }),
        		        success: function (response) {
        		            console.log(response);
        				    
        		            
        				    let v_beta = "";
        		            
        		            
        		            
        		            for(let i=0; i<response.length; i++){
        		            	
        		            	let history_content = renderList(response[i]);
        		            	v_beta += history_content;
        		            }
        		            
        		            v_alpha = '<div class="chat-header" id="chat-header">'+ memName +'님 상담창</div><div class="chat-messages" id="chat-messages">';
                			v_alpha += v_beta + '</div><div class="chat-input"><div><input type="text" id="chat-input" placeholder="메시지를 입력하세요.">';
                			v_alpha += '<button id="sendMsg" type="submit">보내기</button></div></div>';
        		            
                			
                			document.querySelector('#sendMsg').addEventListener('click',()=>{
          						
          						var messageContent = document.querySelector('#chat-input').value;
          						
          						client.send('/app/hello/' + roomNo, {}, 
          						JSON.stringify({
          							chatMsg : messageContent,
          							memId : "${sessionScope.login.memId }",
          							memName : "${sessionScope.login.memName }",
          							roomNo : roomNo  
          						}));
          						messageInput.val('');   
          					})   
        		        },
        		        error: function (xhr, status, error) {
        		            console.error('Error connecting to agent:', error);
        		        }
        		    });
                		chatWindow.innerHTML = v_alpha; 
                  		var messageInput = $('#chat-input');
                  		// 관리자 채팅방 구독
                        client.subscribe('/subscribe/chat/' + roomNo, function (chat) {
                            const content = JSON.parse(chat.body); 
                        	
                            let v_tag = renderList(content);
                            
                            console.log(v_tag); 
                            
                            $("#chat-messages").append(v_tag);
                        });
                  		
      					
            		
      		         
            	})
            })
            
            
          
        });
        

        function renderList(vo) {
            // 날짜 포맷 (옵션: 필요한 경우 날짜 포맷팅 추가)
            const date = vo.sendDate; // 예: "2024-11-29 15:45"
            const isUserMessage = vo.memId === "${sessionScope.login.memId }"; // 내가 보낸 메시지인지 확인

            // 메시지 컨테이너 생성
            const messageContainer = document.createElement('div');
            messageContainer.className = `message ${isUserMessage ? 'sender' : 'receiver'}`;
            
            // 메시지 내용 추가
            const messageBubble = document.createElement('div');
            messageBubble.style.display = "inline-block";
            messageBubble.style.padding = "10px";
            messageBubble.style.borderRadius = "10px";
            messageBubble.style.maxWidth = "70%";
            messageBubble.style.wordWrap = "break-word";
            messageBubble.style.marginBottom = "5px";

            if (isUserMessage) {
                messageBubble.style.backgroundColor = "#007bff";
                messageBubble.style.color = "#fff";
                messageContainer.style.textAlign = "right"; // 본인 메시지는 오른쪽 정렬
            } else {
                messageBubble.style.backgroundColor = "#f0f0f0";
                messageBubble.style.color = "#000";
                messageContainer.style.textAlign = "left"; // 상대방 메시지는 왼쪽 정렬
            }

            messageBubble.textContent = vo.chatMsg;
            messageContainer.appendChild(messageBubble);

            // 메시지 날짜 추가
            const messageTime = document.createElement('span');
            messageTime.style.fontSize = "0.8rem";
            messageTime.style.color = "#999";
            messageTime.textContent = date;
            messageContainer.appendChild(messageTime);

            // 렌더링된 HTML 반환
            return messageContainer.outerHTML;
        }


       
        
        
    </script>

</body>
</html>
