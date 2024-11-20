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
    max-width: 60%; /* 너비를 적당히 조절 */
    margin-bottom: 10px;
    word-wrap: break-word;
}
.myChat {
    background-color: #007bff;
    color: white;
    align-self: flex-end; /* 오른쪽 정렬 */
    text-align: right;
    margin-left: auto; /* 왼쪽 여백 추가 */
}
.otherChat {
    background-color: #e9ecef;
    color: black;
    align-self: flex-start; /* 왼쪽 정렬 */
    text-align: left;
    margin-right: auto; /* 오른쪽 여백 추가 */
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
	
	<!-- 소켓통신 라이브러리 불러오기 cdnjs 사이트에서 sockjs 와 stomp 검색 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js" integrity="sha512-1QvjE7BtotQjkq8PxLeF6P46gEpBRXuskzIVgjFpekzFVF4yjRgrQvTG1MTOJ3yQgvTteKAcO7DSZI92+u/yZw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js" integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

	<script type="text/javascript">
		// 소켓 연결에 사용될 stomp 객체
		var client;
		
		// 페이지 로드 완료시 실행
		$(document).ready(function() {
			// 채팅창 스크롤 내리기
			$(".chatcontent").scrollTop($(".chatcontent")[0].scrollHeight);
			
			var isEnd = false;
			var isScrolled = false;
		
			// 채팅으로 전달받은 데이터를 화면에 그려주기 위한 html 태그 문자열 생성 후 리턴 
			function renderList(vo){
				// 날짜 포맷
				var date = vo.sendDate;
				var html = "";
				var content ="";
				
				//내가 보낸 채팅일 경우
				if(vo.memId=="${sessionScope.login.memId }"){
					content = "<p class='myChat chat-box text-left p-3'>" + vo.chatMsg + "</p>";
				
					html = 	"<li class='me pr-2'>"
						+ "<strong>" + vo.memName + "</strong>"
						+"<div class='me'>"
						+ "<strong style='display : inline;' class='align-self-end'>" + date + "</strong>"
						+ content
						+"</div>"
						+ "</li>";
				}else{
					// 다른 사람의 채팅
					content = "<p class='chat-box bg-light p-3'>"+vo.chatMsg+"</p>";
					
					html = "<li class='pl-2'>"
						+ "<strong>" + vo.memName + "</strong>"
						+"<div>"
						+ content
						+ "<strong style='display : inline;' class='align-self-center'>" + date + "</strong>"
						+"</div>"
						+ "</li>";
				}
				return html;
			}
			
		
			// socket 관련
			var chatBox = $('.box');
			var messageInput = $('#msgi');
			var roomNo = "${room.roomNo}";
			var member = $('.content').data('member');
			
			// 소켓 통신 객체 생성 (sockjs 객체에 WebSocketConfig에서 설정한 /endpoint 주소 입력)
			var sock = new SockJS("${pageContext.request.contextPath}/endpoint");
			// sockjs 객체로부터 stomp 객체 생성
			client = Stomp.over(sock);
	
			// 메시지 전송
			function sendmsg() {
				var message = messageInput.val();
	
				if (message == "") {
					return false;
				}
			
				// 실질적으로 메시지 전달하는 시점과 그 데이터
				// WebSocketConfig에 의해 /app 을 인식하여 ChatLogController의 /hello/{roomNo} 로 요청을 보낸다.
				// 이후 ChatLogController 에서 아래의 /subscribe/chat/{roomNo} 주소로 응답을 보낸다.
				client.send('/app/hello/' + roomNo, {}, 
						JSON.stringify({
							chatMsg : message,
							memId : "${sessionScope.login.memId }",
							memName : "${sessionScope.login.memName }",
							roomNo : "${room.roomNo}"
						}));
	
				messageInput.val('');
			}
			
			// 연결이 맺어지면 실행
			client.connect({},function() {
				// 상대방이 보낸 메세지 전달 받을 때마다 실행         
				client.subscribe('/subscribe/chat/'+ roomNo, function(chat) {
					// 받은 데이터
					let content = JSON.parse(chat.body);
					
					// 받은 데이터를 그려줄 html 코드
					let v_tag = renderList(content);
					$("#chatList").append(v_tag);
					
					// 채팅이 추가되면 스크롤을 맨 아래로 내림
					$(".chatcontent").scrollTop($(".chatcontent")[0].scrollHeight);
				});
	
			});
			
			// 메시지 전송 버튼 클릭시
			$('#btnSend').click(function() {
				sendmsg();
			}); 
			
			// 채팅 입력하다 엔터 쳤을 때
			$('#msgi').keydown(function(e) {
				// 엔터키 keyCode = 13
				if(e.keyCode == 13){
					sendmsg();
				}
			}); 
	
			// 채팅창 떠날시 소켓 통신 종료 함수
			function disconnect() {
				if (client != null) {
					// stomp 객체의 연결 종료
					client.disconnect();
					// sockjs 객체 닫기
					sock.close();
				}
			}
			
			// 현재 창을 벗어나기 직전에 실행됨
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

