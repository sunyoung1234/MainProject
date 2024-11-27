<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Chatbot Interface</title>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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

.table {
	width: 100%;
	font-size: 12px;
}

.table th, .table td {
	text-align: left;
	padding: 5px;
}

.chat-area {
	flex-grow: 1;
	overflow-y: auto;
	padding: 10px;
	background-color: #f1f1f1;
	border-radius: 10px;
}

.chat-input {
	display: flex;
	gap: 5px;
}

.chat-input input {
	flex-grow: 1;
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

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

.room-number, .room-owner {
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

.delete-room-btn {
	display: inline-block;
	margin-top: 10px;
	padding: 8px 12px;
	background-color: red;
	color: white;
	border-radius: 5px;
	text-decoration: none;
	font-weight: bold;
	transition: background-color 0.3s ease;
}

.delete-room-btn:hover {
	background-color: darkred;
}

.chatcontent {
	height: 400px;
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
	margin-left: auto;
}

.otherChat {
	background-color: #e9ecef;
	color: black;
	align-self: flex-start;
	text-align: left;
	margin-right: auto;
}
</style>
</head>
<body>
    <!-- 챗봇 아이콘 -->
    <div class="chatbot-icon"></div>

    <!-- 챗봇 인터페이스 -->
    <div class="chatbot-interface">
        <div class="chatbot-header">
            <span>Chatbot</span> <span class="close-btn">&times;</span>
        </div>
        <div class="chatbot-content" id="chatbotContent">
            <!-- 기본 화면 -->
            <div class="bot-message">안녕하세요! 무엇을 도와드릴까요?</div>
            <div class="bot-message">
                <button class="menu-btn" data-menu="quick-move">페이지 빠른 이동</button>
                <button class="menu-btn" data-menu="faq">FAQ</button>
                <c:if test="${sessionScope.login != null && sessionScope.login.memId eq 'admin'}">
                    <button class="menu-btn" data-menu="admin-chat">사용자 상담 연결</button>
                </c:if>
                <c:if test="${sessionScope.login != null && sessionScope.login.memId ne 'admin'}">
                    <button class="menu-btn connect-agent">상담사 연결</button>
                </c:if>
            </div>
        </div>
    </div>

<script type="text/javascript">
    // contextPath와 memId를 선언
    var contextPath = '${pageContext.request.contextPath}';  // 확인하기
    console.log('contextPath:', contextPath);  // 콘솔에 contextPath 확인
    var memId = "${sessionScope.login != null ? sessionScope.login.memId : ''}";  // 로그인된 사용자의 memId를 자바스크립트 변수에 할당
    var socket; // WebSocket 변수 선언

    $(document).ready(function () {
        // 챗봇 열기/닫기
        $(".chatbot-icon").on("click", function () {
            $(".chatbot-interface").toggleClass("show");
        });

        $(".close-btn").on("click", function () {
            $(".chatbot-interface").removeClass("show");
        });

        // 초기 메뉴 표시
        function displayMainMenu() {
            var menuHtml = '<div class="bot-message">안녕하세요! 무엇을 도와드릴까요?</div>';
            menuHtml += '<div class="bot-message">';
            menuHtml += '<button class="menu-btn" data-menu="quick-move">페이지 빠른 이동</button>';
            menuHtml += '<button class="menu-btn" onclick="location.href=\'' + contextPath + '/faq/view\'">FAQ</button>';
            menuHtml += '<c:if test="${sessionScope.login != null && sessionScope.login.memId eq \'admin\'}">';
            menuHtml += '<button class="menu-btn" data-menu="admin-chat">사용자 상담 연결</button>';
            menuHtml += '</c:if>';
            menuHtml += '<c:if test="${sessionScope.login != null && sessionScope.login.memId ne \'admin\'}">';
            menuHtml += '<button class="menu-btn connect-agent">상담사 연결</button>';
            menuHtml += '</c:if>';
            menuHtml += '</div>';
            $("#chatbotContent").html(menuHtml);
        }

        // 빠른 이동 메뉴
        function displayQuickMoveMenu() {
            var quickMoveMenuHtml = '<div class="bot-message">빠른 이동 메뉴입니다.</div>';
            quickMoveMenuHtml += '<div class="bot-message">';
            quickMoveMenuHtml += '<button class="menu-btn" data-menu="my">마이</button>';
            quickMoveMenuHtml += '<button class="menu-btn" data-menu="board">게시판</button>';
            quickMoveMenuHtml += '<button class="menu-btn" data-menu="map">지도</button>';
            quickMoveMenuHtml += '<button class="menu-btn" data-menu="support">고객지원</button>';
            quickMoveMenuHtml += '<button class="menu-btn back-btn">뒤로가기</button>';
            quickMoveMenuHtml += '</div>';
            $("#chatbotContent").html(quickMoveMenuHtml);
        }

        // 각 세부 메뉴
        function displayMyMenu() {
            var myMenuHtml = '<div class="bot-message">마이 메뉴입니다.</div>';
            myMenuHtml += '<button class="menu-btn" onclick="location.href=\'' + contextPath + '/mypage\'">마이페이지</button>';
            myMenuHtml += '<button class="menu-btn" onclick="location.href=\'' + contextPath + '/memEditView\'">회원정보수정</button>';
            myMenuHtml += '<button class="menu-btn" onclick="location.href=\'' + contextPath + '/electricityUseView\'">전기사용량</button>';
            myMenuHtml += '<button class="menu-btn" onclick="location.href=\'' + contextPath + '/ocrView\'">전기사용량 기입</button>';
            myMenuHtml += '<button class="menu-btn back-btn">뒤로가기</button>';
            $("#chatbotContent").html(myMenuHtml);
        }

        function displayBoardMenu() {
            var boardMenuHtml = '<div class="bot-message">게시판 메뉴입니다.</div>';
            boardMenuHtml += '<button class="menu-btn" onclick="location.href=\'' + contextPath + '/noticeBoardView\'">공지사항</button>';
            boardMenuHtml += '<button class="menu-btn" onclick="location.href=\'' + contextPath + '/reviewView\'">리뷰게시판</button>';
            boardMenuHtml += '<button class="menu-btn" onclick="location.href=\'' + contextPath + '/freeBoardView\'">자유게시판</button>';
            boardMenuHtml += '<button class="menu-btn" onclick="location.href=\'' + contextPath + '/productView\'">에너지 효율 제품 게시판</button>';
            boardMenuHtml += '<button class="menu-btn back-btn">뒤로가기</button>';
            $("#chatbotContent").html(boardMenuHtml);
        }

        function displayMapMenu() {
            var mapMenuHtml = '<div class="bot-message">지도 메뉴입니다.</div>';
            mapMenuHtml += '<button class="menu-btn" onclick="location.href=\'' + contextPath + '/inputView\'">제로 에너지 건축물 등급 측정</button>';
            mapMenuHtml += '<button class="menu-btn" onclick="location.href=\'' + contextPath + '/mapView\'">지도 상세보기</button>';
            mapMenuHtml += '<button class="menu-btn back-btn">뒤로가기</button>';
            $("#chatbotContent").html(mapMenuHtml);
        }

        function displaySupportMenu() {
            var supportMenuHtml = '<div class="bot-message">고객지원 메뉴입니다.</div>';
            supportMenuHtml += '<button class="menu-btn" onclick="location.href=\'' + contextPath + '/chatListView\'">챗봇상담</button>';
            supportMenuHtml += '<button class="menu-btn" onclick="location.href=\'' + contextPath + '/faq/view\'">자주 묻는 질문</button>';
            supportMenuHtml += '<button class="menu-btn">이용 가이드</button>';
            supportMenuHtml += '<button class="menu-btn" onclick="location.href=\'' + contextPath + '/proposal/view\'">건의사항</button>';
            supportMenuHtml += '<button class="menu-btn back-btn">뒤로가기</button>';
            $("#chatbotContent").html(supportMenuHtml);
        }

        // 메뉴 이벤트 처리
        $(document).on("click", ".menu-btn", function() {
            var menu = $(this).data("menu");
            switch (menu) {
                case "quick-move":
                    displayQuickMoveMenu();
                    break;
                case "my":
                    displayMyMenu();
                    break;
                case "board":
                    displayBoardMenu();
                    break;
                case "map":
                    displayMapMenu();
                    break;
                case "support":
                    displaySupportMenu();
                    break;
                case "admin-chat":
                    getRoomList();  // 관리자가 클릭한 경우 채팅방 목록 로드
                    break;
                default:
                    displayMainMenu();
            }
        });

        $(document).on("click", ".back-btn", function() {
            displayMainMenu();
        });

        // 초기 메뉴 표시
        displayMainMenu();

        // 채팅방 목록 가져오기
        function getRoomList() {
            $.ajax({
                url: contextPath + "/main/getRoomList",  // contextPath에 /main 추가
                method: "GET",
                success: function(response) {
                    if (response.length === 0) {
                        $("#chatbotContent").html('<div class="bot-message">현재 채팅방이 없습니다.</div>');
                    } else {
                        var html = '<div class="bot-message">채팅방 목록</div>';
                        $.each(response, function(index, room) {
                            var roomNo = room.roomNo || '정보 없음';
                            var roomName = room.roomName || '정보 없음';
                            var memName = room.memName || '정보 없음';
                            var regDate = room.regDate || '정보 없음';

                            html += '<div class="chat-room-card" id="room-' + roomNo + '">' +
                                        '<div class="chat-room-header">' +
                                            '<span class="room-name">' + roomName + '</span>' +
                                            '<span class="room-date">' + regDate + '</span>' +
                                        '</div>' +
                                        '<div class="chat-room-body">' +
                                            '<div class="room-info">' +
                                                '<span class="room-number">방번호: ' + roomNo + '</span>' +
                                                '<span class="room-owner">방장: ' + memName + '</span>' +
                                            '</div>' +
                                            '<a href="#" class="view-room-btn" data-room-no="' + room.roomNo + '">채팅방 보기</a>' +
                                            '<a href="#" class="delete-room-btn" data-room-no="' + room.roomNo + '">삭제</a>' +
                                        '</div>' +
                                    '</div>';
                        });
                        html += '<div class="bot-message"><button class="menu-btn back-btn">뒤로가기</button></div>';
                        $("#chatbotContent").html(html);
                    }
                },
                error: function() {
                    alert("채팅방 목록을 가져오는 데 실패했습니다.");
                }
            });
        }

        // 채팅방 보기 버튼 클릭 시
        $(document).on("click", ".view-room-btn", function(event) {
            event.preventDefault(); // 페이지 이동 방지
            var roomNo = $(this).data("room-no");
            console.log("채팅방 보기 요청, roomNo: " + roomNo); // roomNo 로그 확인
            getChatRoom(roomNo);  // getChatRoom 함수 호출
        });

        // 채팅방 데이터 가져오기
        function getChatRoom(roomNo) {
            $.ajax({
                url: contextPath + "/getChatRoomData",  // 채팅방 데이터 가져오기
                method: "GET",
                data: { roomNo: roomNo },
                success: function(response) {
                    if (response.error) {
                        alert(response.error);  // 오류 메시지 처리
                    } else {
                        loadChatRoom(response);  // 채팅방 데이터 로드
                    }
                },
                error: function(xhr, status, error) {
                    console.log("AJAX 요청 실패: ", status, error);
                    alert("채팅방 데이터를 가져오는 데 실패했습니다.");
                }
            });
        }

        // 채팅방 내용 로드
        function loadChatRoom(data) {
            var roomNo = data.roomNo;
            var roomName = data.roomName;
            var chatList = data.chatList;

            var html = '<div class="bot-message">' + roomName + ' 채팅방에 오신 것을 환영합니다.</div>';
            html += '<div class="chatcontent" id="chatList">';

            chatList.forEach(function(chat) {
                html += '<div class="chat-box ' + (chat.memId === "${sessionScope.login.memId}" ? 'myChat' : 'otherChat') + '">';
                html += chat.chatMsg + ' <small>' + chat.sendDate + '</small>';
                html += '</div>';
            });

            html += '</div>';
            html += '<div class="input-group">';
            html += '<input type="text" id="msgInput" class="form-control" placeholder="메시지를 입력하세요..." />';
            html += '<button id="btnSend" class="btn btn-primary">보내기</button>';
            html += '</div>';

            $("#chatbotContent").html(html);

            // 웹소켓 시작
            startWebSocket(roomNo);
        }

        // WebSocket 연결
        function startWebSocket(roomNo) {
            socket = new WebSocket('${pageContext.request.contextPath}/endpoint'); // 포트번호를 생략

            socket.onopen = function(event) {
                console.log("WebSocket 연결됨");
            };

            socket.onmessage = function(event) {
                var message = JSON.parse(event.data);
                loadChatRoom(message);
            };

            socket.onclose = function(event) {
                console.log("WebSocket 연결 종료");
            };

            socket.onerror = function(error) {
                console.log("WebSocket 오류: ", error);
            };
        }

        // 메시지 전송 버튼 클릭 시
        $(document).on("click", "#btnSend", function() {
            var msgInput = $("#msgInput").val(); // 입력된 메시지 값
            if (msgInput.trim() === "") {
                alert("메시지를 입력하세요.");
                return;
            }

            // 입력된 메시지를 웹소켓을 통해 전송
            var message = {
                memId: memId,
                chatMsg: msgInput
            };

            // WebSocket을 통해 메시지를 전송
            socket.send(JSON.stringify(message));

            // 메시지 전송 후, 입력창 초기화
            $("#msgInput").val('');
        });

        // 상담사 연결 기능
        $(document).on("click", ".connect-agent", function() {
            var memName = "${sessionScope.login.memName}";  // 로그인된 사용자의 이름
            var memId = "${sessionScope.login.memId}";  // 로그인된 사용자의 memId

            console.log("상담사 연결 요청, 사용자명: " + memName);

            // 채팅방이 이미 존재하는지 확인
            $.ajax({
                url: contextPath + "/main/getRoomByMemId",  // contextPath에 /main이 이미 포함되므로 /main은 제외
                method: "GET",
                data: { memId: memId },
                success: function(response) {
                    if (response && response.roomNo) {
                        // 채팅방이 존재하면 해당 채팅방으로 이동
                        console.log("존재하는 채팅방으로 이동, roomNo: " + response.roomNo);
                        getChatRoom(response.roomNo);  // 기존 채팅방으로 접속
                    } else {
                        // 채팅방이 없으면 새로운 채팅방 생성
                        console.log("새로운 채팅방 생성");
                        createNewRoom(memName, memId);  // 새로운 채팅방 생성
                    }
                },
                error: function(xhr, status, error) {
                    console.log("AJAX 요청 실패: ", status, error);
                    alert("채팅방 확인에 실패했습니다.");
                }
            });
        });

        // 새로운 채팅방 생성
        function createNewRoom(memName, memId) {
            // 채팅방 생성 API 호출
            $.ajax({
                url: contextPath + "/main/createRoom",  // 채팅방 생성 요청
                method: "POST",
                data: {
                    roomName: memName + "의 상담방",  // 채팅방 이름을 사용자 이름으로 설정
                    memName: memName,                // 상담사 이름
                    memId: memId                     // 사용자의 memId
                },
                success: function(response) {
                    if (response && response.roomNo) {
                        console.log("새로운 채팅방 생성, roomNo: " + response.roomNo);
                        // 채팅방 생성 후 해당 채팅방으로 이동
                        getChatRoom(response.roomNo);
                    } else {
                        alert("채팅방 생성에 실패했습니다.");
                    }
                },
                error: function(xhr, status, error) {
                    console.log("채팅방 생성 요청 실패: ", status, error);
                    alert("채팅방 생성에 실패했습니다.");
                }
            });
        }
    });
</script>





</body>
</html>
