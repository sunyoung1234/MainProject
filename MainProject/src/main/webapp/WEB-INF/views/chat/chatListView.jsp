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
	<title>채팅방</title>
	
	<!-- Navigation START -->
	<%@ include file="/WEB-INF/inc/top.jsp"%>
	<!-- Navigation END -->
	
	<!-- ChatBot START -->
	<%@ include file="/WEB-INF/inc/chatbot.jsp" %>
	<!-- ChatBot END -->
</head>
<body id="page-top">

	<!-- navigation 부분 -->
	<%@ include file="/WEB-INF/inc/top.jsp"%>

	<!-- Contact Section-->
	<section class="page-section" id="contact">
		<!-- 부트스트랩으로 padding-top 을 좀 주고자 한다. -->
		<div class="container pt-5">
			<!-- Contact Section Heading-->
			<h2
				class="page-section-heading text-center text-uppercase text-secondary mb-0">채팅방 목록</h2>
			<!-- Icon Divider-->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- Contact Section Form-->
			<div class="row justify-content-center">
		 		<div class="col-lg-8 col-xl-7">
		 		
					<!-- 채팅방 목록 -->
	                <table class="table table-hover">
	                	<thead>
	                		<tr>
	                			<th>방번호</th>
	                			<th>방제목</th>
	                			<th>방장</th>
	                			<th>생성일</th>
	                		</tr>
	                	</thead>
	                	<tbody>
	                		<!-- 데이터의 수만큼 반복되는 부분 -->
	                		<c:forEach items="${roomList }" var="room">
								<tr>
									<td>${room.roomNo }</td>
									<td><a href="<c:url value="/chatView?roomNo=${room.roomNo }"/>">${room.roomName }</a></td>
									<td>${room.memName }</td>
									<td>${room.regDate }</td>
								</tr>    
	                		</c:forEach>
	                	</tbody>
	                </table>
					
					<!-- 글쓰기 버튼 -->
					<div class="d-flex justify-content-end">
						<a id="writeBtn" class="btn btn-primary" href="${pageContext.request.contextPath }/roomCreateView">채팅방 생성</a>
					</div>
					
				</div>
			</div>
		</div>
	</section>

	<!-- footer 부분 -->
	<%@ include file="/WEB-INF/inc/footer.jsp"%>

	<script type="text/javascript">
	
		let v_id = '${sessionScope.login.memId }';
		
		console.log(v_id);
		
		// 글쓰기 버튼 클릭시, 로그인 체크 후 로그인 안되어있으면 안내창 띄움
		document.getElementById("writeBtn").addEventListener("click", ()=>{
			
			if(v_id){
				// 로그인 상태 -> 글쓰기 화면으로 이동
				location.href = '${pageContext.request.contextPath }/boardWriteView';
			}else{
				// 로그인 안된 상태 -> 알림을 띄운 후 글쓰기 화면으로 이동
				alert('로그인 후 채팅방 생성이 가능합니다.');
				location.href = '${pageContext.request.contextPath }/loginView';
			}
			
		});
		
	</script>	
</body>
</html>

