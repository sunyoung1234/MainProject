<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>채팅방</title>
</head>
<body id="page-top">

	<!-- navigation 부분 -->
	<%@ include file="/WEB-INF/inc/top.jsp"%>

	<!-- Contact Section-->
	<section class="page-section" id="contact">
		<div class="container pt-5">
			<div class="text-right mb-3">
				<strong>현재 접속자 수: ${activeUsers}명</strong>
			</div>

			<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">채팅방 목록</h2>
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon"><i class="fas fa-star"></i></div>
				<div class="divider-custom-line"></div>
			</div>
			<div class="row justify-content-center">
				<div class="col-lg-8 col-xl-7">

					<table class="table table-hover">
						<thead>
							<tr>
								<th>방번호</th>
								<th>방제목</th>
								<th>방장</th>
								<th>생성일</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${roomList }" var="room">
								<tr>
									<td>${room.roomNo }</td>
									<td><a href="<c:url value="/chatView?roomNo=${room.roomNo }"/>">${room.roomName }</a></td>
									<td>${room.memName }</td>
									<td>${room.regDate }</td>
									<td>
										<!-- 방 생성자 또는 관리자인 경우에만 삭제 버튼 표시 -->
										<c:if test="${sessionScope.login.memId eq room.memId || sessionScope.login.memId eq 'admin'}">
											<form action="${pageContext.request.contextPath }/deleteRoom"
												method="post" style="display: inline;">
												<input type="hidden" name="roomNo" value="${room.roomNo}">
												<button type="submit" class="btn btn-danger btn-sm">삭제</button>
											</form>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<div class="d-flex justify-content-end">
						<a id="writeBtn" class="btn btn-primary"
							href="${pageContext.request.contextPath }/roomCreateView">채팅방 생성</a>
					</div>

				</div>
			</div>
		</div>
	</section>

	<!-- footer 부분 -->
	<%@ include file="/WEB-INF/inc/footer.jsp"%>

	<script type="text/javascript">
		let v_id = '${sessionScope.login.memId }';
		
		document.getElementById("writeBtn").addEventListener("click", ()=>{
			if(v_id){
				location.href = '${pageContext.request.contextPath }/boardWriteView';
			}else{
				alert('로그인 후 채팅방 생성이 가능합니다.');
				location.href = '${pageContext.request.contextPath }/loginView';
			}
		});
	</script>
</body>
</html>
