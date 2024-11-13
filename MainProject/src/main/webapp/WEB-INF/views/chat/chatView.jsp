<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>채팅</title>
<!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- SockJS 라이브러리 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js"
	integrity="sha512-1QvjE7BtotQjkq8PxLeF6P46gEpBRXuskzIVgjFpekzFVF4yjRgrQvTG1MTOJ3yQgvTteKAcO7DSZI92+u/yZw=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- Stomp.js 라이브러리 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"
	integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<style>
.chatcontent {
	height: 700px;
	width: 100%;
	overflow-y: scroll;
}

.myChat {
	background-color: #E0B1D0;
}

li {
	list-style-type: none;
}

.me {
	text-align: right;
}

.chat-box {
	max-width: 200px;
	display: inline-block;
	border-radius: 15px;
}
</style>
</head>
<body id="page-top">

	<!-- navigation 부분 -->
	<%@ include file="/WEB-INF/inc/top.jsp"%>

	<!-- Contact Section-->
	<section class="page-section" id="contact">
		<div class="container pt-5">
			<!-- Contact Section Form-->
			<div class="row justify-content-center">
				<div class="col-lg-8 col-xl-7">
					<div class="chatWrap">
						<div class="main_tit">
							<h1>방 정보: [ ${room.roomNo}번방 ${room.roomName } ]</h1>
						</div>
						<div class="content chatcontent border border-secondary"
							data-room-no="${room.roomNo}">
							<div id="chatList" class="">
								<c:forEach items="${chatList}" var="chat">
									<!-- 내 채팅일 경우 -->
									<c:if test="${sessionScope.login.memId eq chat.memId}">
										<li data-no="${chat.chatNo}" class="me pr-2"><strong>${chat.memName}</strong>
											<div class="me">
												<strong style="display: inline;" class="align-self-end">${chat.sendDate}</strong>
												<p class='myChat chat-box text-left p-3'>${chat.chatMsg}</p>
											</div></li>
									</c:if>
									<!-- 다른사람의 채팅일 경우 -->
									<c:if test="${sessionScope.login.memId ne chat.memId}">
										<li data-no="${chat.chatNo}" class="pl-2"><strong>${chat.memName}</strong>
											<div>
												<p class='chat-box bg-light p-3'>${chat.chatMsg}</p>
												<strong style="display: inline;" class="align-self-center">${chat.sendDate}</strong>
											</div></li>
									</c:if>
								</c:forEach>
							</div>
						</div>
						<div>
							<div class="d-flex justify-content-center" style="height: 60px">
								<input type="text" id="msgi" name="msg" class="form-control"
									style="width: 75%; height: 100%">
								<button type="button" id="btnSend"
									class="send btn btn-secondary" style="width: 25%; height: 100%">보내기</button>
							</div>
							<div class="d-flex justify-content-center mt-2">
								<!-- 뒤로 가기 버튼을 보내기 버튼 아래에 추가 -->
								<button type="button" id="btnBack" class="btn btn-primary"
									style="width: 25%; height: 100%">뒤로 가기</button>
							</div>
							<!-- 대화 삭제 버튼: 방장이나 admin인 경우에만 표시 -->
							<c:if
								test="${sessionScope.login.memId eq room.memId || sessionScope.login.memId eq 'admin'}">
								<button type="button" id="btnClearChat" class="btn btn-danger"
									style="width: 25%; height: 100%">대화 삭제</button>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- footer 부분 -->
	<%@ include file="/WEB-INF/inc/footer.jsp"%>

	<!-- 대화 삭제 및 소켓 통신 관련 스크립트 -->
	<script type="text/javascript">
		// 대화 삭제 버튼 클릭 시 Ajax로 서버에 삭제 요청 보내기
		$(document).ready(function() {
			$('#btnClearChat').click(function() {
				if (confirm("정말로 대화를 삭제하시겠습니까?")) {
					$.ajax({
						url: '${pageContext.request.contextPath}/clearChat',
						type: 'POST',
						data: { roomNo: ${room.roomNo} },
						success: function(response) {
							if (response === 'success') {
								$('#chatList').empty();  // 화면에서 대화 내용 삭제
								alert('대화가 삭제되었습니다.');
							} else {
								alert('대화 삭제에 실패했습니다.');
							}
						},
						error: function() {
							alert('오류가 발생했습니다. 다시 시도해 주세요.');
						}
					});
				}
			});

			// 뒤로 가기 버튼 클릭 시 이벤트 설정
			$('#btnBack').click(function() {
				window.location.href = "${pageContext.request.contextPath}/chatListView";
			});
		});

		// 소켓 연결에 사용될 stomp 객체
		var client;
		$(document).ready(function() {
			$(".chatcontent").scrollTop($(".chatcontent")[0].scrollHeight);

			// 채팅을 화면에 표시하기 위한 함수
			function renderList(vo) {
				var date = vo.sendDate;
				var html = "";
				var content = "";

				if (vo.memId == "${sessionScope.login.memId}") {
					content = "<p class='myChat chat-box text-left p-3'>" + vo.chatMsg + "</p>";
					html = "<li class='me pr-2'><strong>" + vo.memName + "</strong><div class='me'><strong style='display : inline;' class='align-self-end'>" + date + "</strong>" + content + "</div></li>";
				} else {
					content = "<p class='chat-box bg-light p-3'>" + vo.chatMsg + "</p>";
					html = "<li class='pl-2'><strong>" + vo.memName + "</strong><div>" + content + "<strong style='display : inline;' class='align-self-center'>" + date + "</strong></div></li>";
				}
				return html;
			}

			// socket 관련 설정
			var roomNo = "${room.roomNo}";
			var sock = new SockJS("${pageContext.request.contextPath}/endpoint");
			client = Stomp.over(sock);

			// 메시지 전송 함수
			function sendmsg() {
				var message = $('#msgi').val();
				if (message == "") return false;

				client.send('/app/hello/' + roomNo, {}, JSON.stringify({
					chatMsg : message,
					memId : "${sessionScope.login.memId }",
					memName : "${sessionScope.login.memName }",
					roomNo : "${room.roomNo}"
				}));
				$('#msgi').val('');
			}

			// 연결이 맺어지면 실행
			client.connect({}, function() {
				client.subscribe('/subscribe/chat/' + roomNo, function(chat) {
					let content = JSON.parse(chat.body);
					let v_tag = renderList(content);
					$("#chatList").append(v_tag);
					$(".chatcontent").scrollTop($(".chatcontent")[0].scrollHeight);
				});
			});

			// 메시지 전송 버튼 및 엔터키 이벤트
			$('#btnSend').click(function() { sendmsg(); });
			$('#msgi').keydown(function(e) {
				if (e.keyCode == 13) { sendmsg(); }
			});

			// 채팅창 떠날시 소켓 통신 종료 함수
			function disconnect() {
				if (client != null) {
					client.disconnect();
					sock.close();
				}
			}
			window.onbeforeunload = function(e) { disconnect(); }
		});
	</script>
</body>
</html>
