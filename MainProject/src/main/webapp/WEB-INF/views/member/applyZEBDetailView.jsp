<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ZEB 신청내용</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js" integrity="sha512-1QvjE7BtotQjkq8PxLeF6P46gEpBRXuskzIVgjFpekzFVF4yjRgrQvTG1MTOJ3yQgvTteKAcO7DSZI92+u/yZw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js" integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f9f9f9;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        .container {
            width: 80%;
            margin: 0 auto;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .details-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .details-table th,
        .details-table td {
            text-align: left;
            padding: 12px;
            border: 1px solid #ddd;
        }

        .details-table th {
            background-color: #f4f4f4;
            font-weight: bold;
            text-align: left;
        }

        .details-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .details-table tr:hover {
            background-color: #f1f1f1;
        }

        form {
            margin-top: 20px;
            display: flex;
            flex-direction: column;
            gap: 20px; /* 요소 간 간격 */
        }

        .input-container {
            display: flex;
            flex-direction: column;
        }

        .radio-container {
		    display: flex;
		    flex-direction: column;
		    gap: 10px; /* 라디오 그룹 간 간격 */
		}
		
		.radio-container label {
		    font-size: 1.5rem; /* "거절 여부" 텍스트 크기 증가 */
		    font-weight: bold;
		    margin-bottom: 10px;
		}
		
		.radio-container div {
		    display: flex;
		    align-items: center; /* 라디오 버튼과 텍스트 수직 정렬 */
		    gap: 20px; /* 라디오 버튼과 텍스트 간 간격 */
		}
		
		.radio-container input[type="radio"] {
		    transform: scale(1.5); /* 라디오 버튼 크기 확대 */
		    margin-right: 10px; /* 버튼과 텍스트 간격 */
		}
		
		.radio-container label[for="approve"],
		.radio-container label[for="reject"] {
		    font-size: 1.2rem; /* 라벨 텍스트 크기 */
		}

        select,
        input[type="text"] {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1rem;
            width: 100%; /* 입력 필드 너비 100% */
            box-sizing: border-box; /* 패딩 포함 */
        }

        select:focus,
        input[type="text"]:focus {
            border-color: #4CAF50;
            outline: none;
            box-shadow: 0 0 5px rgba(76, 175, 80, 0.5); /* 초록색 포커스 효과 */
        }

        #levBox,
        #reasonBox {
            display: none; /* 초기에는 숨김 */
        }

        .button-container {
            display: flex;
            justify-content: center; /* 버튼을 좌우로 배치 */
            gap: 20px;
            margin-top: 20px;
        }

        .button {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1rem;
            width: 24%; /* 버튼 크기 조정 */
        }

        #submitBtn{
            background-color: #4CAF50;
            color: white;
        }

        #submitBtn:hover {
            background-color: #45a049;
        }

        .button.back {
            background-color: #f44336;
            color: white;
        }

        .button.back:hover {
            background-color: #d32f2f;
        }
        
    	#download-link {
	        cursor: pointer; /* 마우스 커서가 포인터로 변경 */
	        text-decoration: none; /* 기본 밑줄 제거 */
	        color: #007BFF; /* 링크처럼 보이게 파란색 지정 */
	        font-weight: bold; /* 눈에 띄게 굵은 텍스트 */
	        display: inline-flex; /* 아이콘과 텍스트를 정렬 */
	        align-items: center; /* 아이콘과 텍스트 세로 정렬 */
	    }
	
	    #download-link:hover {
	        color: #0056b3; /* 어두운 파란색으로 변경 */
	        text-decoration: underline; /* 호버 시 밑줄 추가 */
	        transform: scale(1.05); /* 약간 확대 효과 */
	    }
	
	    #download-link:active {
	        transform: scale(0.95); /* 클릭 시 살짝 눌리는 효과 */
	        color: #003865; /* 더 어두운 색상으로 변경 */
	    }
    </style>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e0184ed647e553cf5795a108feda8a4a&libraries=clusterer,services"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e0184ed647e553cf5795a108feda8a4a"></script>
</head>
<body>
    <h1>ZEB 신청내용</h1>

    <div class="container">
        <table class="details-table">
            <tbody>
                <tr>
                    <th>회원 아이디</th>
                    <td>${apply.memId}</td>
                </tr>
                <tr>
                    <th>건물명</th>
                    <td>${apply.buildingName}</td>
                </tr>
                <tr>
                    <th>증빙 서류</th>
                    <td id="download-link">💾 ${apply.fileName}</td>
                </tr>
                <tr>
                    <th>측정 등급</th>
                    <td id="grade">${grade} 등급</td>
                </tr>
                <tr>
                    <th>신청 기관</th>
                    <td>${apply.applianceOrg}</td>
                </tr>
                <tr>
                    <th>신청 날짜</th>
                    <td>${apply.applyDate}</td>
                </tr>
                <tr>
                    <th>승인 여부</th>
                    <td>${apply.approveYn == 'Y' ? '승인' : '승인전'}</td>
                </tr>
                <tr>
                    <th>거절 여부</th>
                    <td>${apply.rejectYn == 'Y' ? '거절' : ''}</td>
                </tr>
                <tr>
                    <th>거절 사유</th>
                    <td>${rejectContent }</td>
                </tr>
            </tbody>
        </table>
        <div style="display:none;" id="roadAddress">${road }</div>
		<c:if test="${apply.rejectYn == 'N' && apply.approveYn == 'N' }">
	        <form id="submitForm" action="${pageContext.request.contextPath }/applyResult" method="post">
	            <!-- 승인 여부 -->
	            <div class="radio-container">
				    <div>
				        <input type="radio" id="approve" name="approveYn" value="승인" required>
				        <label for="approve">승인</label>
				    </div>
				    <div>
				        <input type="radio" id="reject" name="approveYn" value="거절">
				        <label for="reject">거절</label>
				    </div>
				</div>
				<input style="display: none;" name="buildingId" value="${apply.buildingId }">
				
				  <!-- 승인: ZEB Level -->
	            <div class="input-container" id="levBox">
		            </div>
	
	
	            <!-- 거절: 이유 -->
	            <div class="input-container" id="reasonBox">
	                <label for="rejectReason">거절 사유</label>
	                <input id="rejectReason" name="rejectReason" type="text" placeholder="거절 사유를 입력해주세요">
	            </div>
	            
	            <input style="display:none;" id="latitude" name="latitude">
	            <input style="display:none;" id="longitude" name="longitude">
	            
	            
	
	            <!-- 버튼 -->
	            <div class="button-container">
	                <button id="submitBtn" type="button" class="button">제출</button>
	                <button type="button" class="button back" onclick="window.history.back()">뒤로가기</button>
	            </div>
	        </form>
		</c:if>
		<c:if test="${apply.rejectYn == 'Y' || apply.approveYn == 'Y' }">
			<div class="button-container">
                <button type="button" class="button back" onclick="window.history.back()">뒤로가기</button>
            </div>
		</c:if>
		
    </div>
    <c:if test="${sessionScope.login.memId != 'admin' }">
	    <%@ include file="/WEB-INF/inc/chatbotbot.jsp"%>
	</c:if>

    <script>
    
	    document.addEventListener('DOMContentLoaded', function(){
			const sock = new SockJS("${pageContext.request.contextPath}/endpoint");
	        const client = Stomp.over(sock);
	
	        client.connect({}, function () {
	       	client.subscribe('/subscribe/yn', function (yn) {
	            	
	            	
	                console.log(yn)
	                
	            }); 
	        });
	        let radioButtons = document.querySelectorAll('input[name="approveYn"]');
	        let levBox = document.getElementById('levBox');
	        let reasonBox = document.getElementById('reasonBox');
	        let v_download = document.querySelector('#download-link')
	
	        radioButtons.forEach(radio => {
	            radio.addEventListener('change', () => {
	                const selectedValue = document.querySelector('input[name="approveYn"]:checked').value;
	
	                if (selectedValue === "승인") {
	                    levBox.style.display = "block";
	                    reasonBox.style.display = "none";
	                } else {
	                    levBox.style.display = "none";
	                    reasonBox.style.display = "block";
	                }
	            });
	        });
	        
	        v_download.addEventListener('click',()=>{
	        	let fileName = v_download.innerText;
	        	fileName = fileName.substr(3);
	        	location.href = "${pageContext.request.contextPath}/downLoadFile?fileName=" + fileName;
	        	
	        })
	        
	        document.querySelector('#submitBtn').addEventListener('click',()=>{
	        	client.send('/app/yn', {}, JSON.stringify({
                    building_id : '${apply.buildingId }'
                })); 
	        	
	        	document.getElementById('submitForm').submit();
	        })
	        
	        var geocoder = new kakao.maps.services.Geocoder();
	
			var callback = function(result, status) {
			    if (status === kakao.maps.services.Status.OK) {
			        console.log(result[0].x);
			        console.log(result[0].y);
			        document.querySelector('#latitude').value = result[0].y;
			        document.querySelector('#longitude').value = result[0].x;
			    }
			};
	
			geocoder.addressSearch(document.querySelector('#roadAddress').innerHTML, callback);
		})
    </script>
    
</body>
</html>
