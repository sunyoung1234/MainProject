<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<title>채팅방 생성</title>
	<!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body id="page-top">
	<%@ include file="/WEB-INF/inc/top.jsp"%>

	<section class="page-section" id="contact">
		<div class="container pt-5">
			<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">채팅방 생성</h2>
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<div class="row justify-content-center">
		 		<div class="col-lg-8 col-xl-7">
					<form id="boardWriteForm" action="javascript:void(0);"> <!-- form 태그 action 제거 -->
						<div class="mb-3">
							<input class="form-control" type="text" id="roomName" name="roomName" placeholder="방 제목을 입력해주세요" />
						</div>
						
						<div class="d-flex justify-content-end">
							<a class="btn btn-secondary me-2" href="${pageContext.request.contextPath}/chatListView">취소</a>
							<button id="writeBtn" class="btn btn-primary" type="button">생성</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>

	<%@ include file="/WEB-INF/inc/footer.jsp"%>

	<script type="text/javascript">
		$(document).ready(function() {
			// 방 제목 자동 생성
		    const nickname = '${sessionScope.login != null ? sessionScope.login.memName : ''}';
		    if (nickname && !$('#roomName').val()) {
		        $('#roomName').val(nickname + '님의 채팅방');
		    }

		    // 방 생성 버튼 클릭 이벤트
		    $('#writeBtn').on('click', function() {
		        const roomName = $('#roomName').val();

		        if (!roomName) {
		            alert('방 이름을 입력해주세요.');
		            return;
		        }

		        $.post('${pageContext.request.contextPath}/roomCreateDo', { roomName: roomName }, function(response) {
		            if(response.status === "success") {
		                window.location.href = "${pageContext.request.contextPath}/chatView?roomNo=" + response.roomNo;
		            } else if (response.redirect) {
		                window.location.href = response.redirect;
		            } else {
		                alert(response.message || "방 생성에 실패했습니다.");
		            }
		        }).fail(function() {
		            console.error("Failed to send request for room creation");
		        });
		    });
		});
	</script>
</body>
</html>
