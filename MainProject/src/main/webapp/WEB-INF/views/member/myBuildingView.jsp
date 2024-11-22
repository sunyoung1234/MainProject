<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>내 건물 목록</title>
    <link href="css/styles.css" rel="stylesheet" />
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f9f9f9;
        }
        h1 {
            text-align: center;
            color: #333;
            padding-bottom: 30px;
            padding-top: 35px; 
        }
        .building-list {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }
        .building-card {
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            overflow: hidden;
            width: 350px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .building-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }
        .building-card img {
            width: 100%;
            height: 250px;
            object-fit: cover;
        }
        .building-info {
            padding: 20px;
            text-align: center;
        }
        .building-name {
            font-size: 22px;
            font-weight: bold;
            margin: 0 0 12px;
            color: #333;
        }
        .building-address {
            font-size: 16px;
            color: #555;
            margin: 0 0 12px;
        }
        .building-test {
            font-size: 15px;
            color: #007BFF;
            font-weight: bold;
        }
        .btn-box {
            display: flex;
            justify-content: space-around;
            padding: 15px 20px 20px;
        }
        button {
            border: none;
            border-radius: 5px;
            padding: 12px 18px;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
            width: 45%;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .btn-green {
            background-color: #28a745;
            color: #fff;
        }
        .btn-green:hover {
            background-color: #218838;
        }
        .btn-disabled {
            background-color: #6c757d;
            color: #fff;
            cursor: not-allowed;
        }
        button:active {
            transform: translateY(0);
        }
        .floating-btn {
            position: fixed;
            bottom: 100px; 
            right: 50px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 50%;
            width: 60px;
            height: 60px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 24px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            cursor: pointer;
            transition: all 0.3s ease;
        }
        .floating-btn:hover {
            background-color: #0056b3;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
            transform: translateY(-2px);
        }
        @keyframes blink {
	    0%, 49% {
	        opacity: 1; /* 툴팁이 보임 */
	   	 }
	    50%, 100% {
	        opacity: 0; /* 툴팁이 사라짐 */  
	   	 }
		}
        
        .msg-box{ 
            position: fixed;
            bottom: 120px; 
            right: 120px;
            background-color: #333;
            color: white;
            padding: 10px 15px;
            border-radius: 5px;
            font-size: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            opacity: 1; 
            animation: blink 7s infinite; 
        }
        /* 모달 오버레이 */
		.modal-overlay {
		    position: fixed;
		    top: 0;
		    left: 0;
		    width: 100vw;
		    height: 100vh;
		    background-color: rgba(0, 0, 0, 0.6); /* 배경 어둡게 처리 */
		    display: none; /* 기본적으로 숨김 */
		    z-index: 998; /* 화면 위로 */
		    display: none; 
		    justify-content: center;
		    align-items: center; /* 모달 정중앙 배치 */
		}
		
		/* 모달 박스 */
		.modal-box {
		    background-color: #fff;
		    border-radius: 10px;
		    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
		    padding: 20px 30px;
		    width: 500px;
		    max-height: 90vh; /* 모달의 최대 높이 */
		    overflow-y: auto; /* 내용이 많을 경우 스크롤 */
		    z-index: 999;
		    position: relative; /* 내부 버튼 포지셔닝에 필요 */
		    animation: fadeIn 0.3s ease-out; /* 나타나는 애니메이션 */
		}
		#overlay2{
		    position: fixed;
		    top: 0;
		    left: 0;
		    width: 100vw;
		    height: 100vh;
		    background-color: rgba(0, 0, 0, 0.6); /* 배경 어둡게 처리 */
		    z-index: 998; /* 화면 위로 */
		    justify-content: center;
		    align-items: center;
		    display: none ; 
		} 

		/* 모달 박스 */
		.modal2 {
		    background: #fff;
		    border-radius: 8px;
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		    width: 400px;
		    max-width: 90%; /* 화면 크기에 맞춰 반응형 처리 */
		    padding: 20px;
		    z-index: 999; /* 오버레이 위로 */
		    animation: fadeIn 0.3s ease-out; /* 나타나는 애니메이션 */
		}
		
		/* 입력 폼 스타일 */
		.modal2 form {
		    display: flex;
		    flex-direction: column;
		    gap: 15px;
		}
		
		.modal2 label {
		    font-weight: bold;
		    margin-bottom: 5px;
		}
		
		.modal2 select,
		.modal2 input[type="file"],
		.modal2 input[type="text"],
		.modal2 button {
		    padding: 10px;
		    border: 1px solid #ccc;
		    border-radius: 4px;
		    font-size: 14px;
		    box-sizing: border-box; /* 패딩 포함한 크기 조정 */
		}
		
		.modal2 select:focus,
		.modal2 input[type="file"]:focus,
		.modal2 input[type="text"]:focus {
		    outline: none;
		    border-color: #5b9bd5;
		    box-shadow: 0 0 5px rgba(91, 155, 213, 0.5);
		}
		
		.modal2 button {
		    background-color: #5b9bd5;
		    color: #fff;
		    font-weight: bold;
		    cursor: pointer;
		    border: none;
		    border-radius: 4px;
		    padding: 10px 20px;
		    font-size: 14px;
		    transition: background-color 0.3s ease;
		}
		
		/* 제출 버튼 스타일 */
		.modal2 button[type="submit"] {
		    background-color: #5b9bd5;
		}
		
		.modal2 button[type="submit"]:hover {
		    background-color: #4a8ad4;
		}
		
		/* 뒤로가기 버튼 스타일 */
		.modal2 .back-btn2 {
		    background-color: #dc3545;
		}
		
		.modal2 .back-btn2:hover {
		    background-color: #c82333;
		}
		
		/* 나타나는 애니메이션 */
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
		
		/* 모달의 나타나는 애니메이션 */
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
		
		/* 버튼 꾸미기 */
		.modal-box button {
		    margin: 10px 5px 0 0;
		    padding: 10px 20px;
		    border: none;
		    border-radius: 5px;
		    font-size: 16px;
		    cursor: pointer;
		    transition: all 0.3s ease;
		}
		
		/* 뒤로가기 버튼 (빨간색) */
		.back-btn {
		    background-color: #dc3545;
		    color: white;
		}
		
		.back-btn:hover {
		    background-color: #c82333;
		}
		
		/* 테스트하기 버튼 (초록색) */
		.test-btn {
		    background-color: #28a745;
		    color: white;
		}
		
		.test-btn:hover {
		    background-color: #218838;
		}
		#loading {
	        position: fixed;
	        top: 0;
	        left: 0;
	        width: 100%;
	        height: 100%;
	        background-color: rgba(0, 0, 0, 0.5);
	        display: none;
	        flex-direction: column;
	        justify-content: center;
	        align-items: center;
	        z-index: 1000;
	        color: white;
	        text-align: center;
	    }
	    .spinner {
	        border: 5px solid #f3f3f3;
	        border-top: 5px solid #3498db;
	        border-radius: 50%;
	        width: 50px;
	        height: 50px;
	        animation: spin 1s linear infinite;
	    }
	    @keyframes spin {
	        0% { transform: rotate(0deg); }
	        100% { transform: rotate(360deg); }
	    }
	    #loadingMessage {
	        margin-top: 20px;
	        font-size: 18px;
	    }


    </style>
</head>
<body>
	<%@ include file="/WEB-INF/inc/top.jsp" %>
	
	<div id="loading" style="display: none;">
	  <div class="spinner"></div>
	  <p>데이터를 처리 중입니다. 잠시만 기다려주세요...(최대 1~2 분 소요)</p>
	</div>
	
    <h1>내 건물 목록</h1>
    <div class="building-list">
        <c:forEach var="building" varStatus="status" items="${myBuildingList}">
            <div class="building-card">
                <c:if test="${building.buildingImg == 'none' }">
                    <img src="${pageContext.request.contextPath}/resources/image/bb.png" alt="건물 이미지">
                </c:if>
                <c:if test="${building.buildingImg != 'none' }">
                    <img src="${pageContext.request.contextPath}/displayImage?imgName=${building.buildingImg}" alt="건물 이미지">
                </c:if>
                <div class="building-info">
                    <p class="building-name">${building.buildingName}</p>
                    <p class="building-address">${building.roadAddress}</p>
                    <p class="building-test">테스트 여부: ${building.testYn}</p>
                    <p class="building-test">ZEB 등록 여부: ${building.zebTestYn }</p>
                </div>
                <div class="btn-box">
                    <!-- zeb 테스트하기 버튼: 조건에 따라 스타일 및 비활성화 처리 -->
                    <c:choose>
                        <c:when test="${building.testYn == 'N'}">
                            <button id="testModal" class="test-modal btn-green">ZEB 테스트</button>
                        </c:when>
                        <c:otherwise>
                            <button class="test-modal btn-disabled" disabled>ZEB 테스트</button>
                        </c:otherwise>
                    </c:choose>
                    <!-- zeb 신청하기 버튼 (기본 설정) -->
                    <c:choose>
                    	<c:when test="${building.zebTestYn == 'N' }">
		                    <button id="registBuilding" class="regist-building btn-green">ZEB 건축물<br>등록하기</button> 
                    	</c:when>
                    	<c:otherwise>
                    		<button id="registBuilding" class="regist-building btn-disabled" disabled>ZEB 건축물<br>등록하기</button> 
                    	</c:otherwise>
                    </c:choose> 
                </div>
            </div>
			<div class="modal-overlay">
			    <div class="modal-box">
			        <h2>건물 정보</h2>
			        <table class="modal-table">
			            <tr>
			                <th>건물명</th>
			                <td>${building.buildingName }</td>
			            </tr>
			            <tr>
			            	<th>건물 주소</th>
			            	<td>${building.roadAddress } ${building.extraAddress }</td>
			            </tr>	
			            <tr>
			                <th>기후(지역)</th>
			                <td>${building.climate }</td>
			            </tr>
			            <tr>
			                <th>주거 유형</th>
			                <td>${building.residentialType }</td>
			            </tr>
			            <tr>
			                <th>구조 유형</th>
			                <td>${building.structureType }</td>
			            </tr>
			            <tr>
			                <th>면적(㎡)</th>
			                <td>${building.squareMeterArea }</td>
			            </tr>
			            <tr>
			                <th>층 수</th>
			                <td>${building.floors }</td>
			            </tr>
			            <tr>
			                <th>문 개수</th>
			                <td>${building.doors }</td>
			            </tr>
			            <tr>
			                <th>단열 수준</th>
			                <td>${building.insulationLevel }</td>
			            </tr>
			            <tr>
			                <th>창호 수준</th>
			                <td>${building.windowLevel }</td>
			            </tr>
			            <tr>
			                <th>환기 시스템</th>
			                <td>${building.ventilationSystem }</td>
			            </tr>
			            <tr>
			                <th>태양광 패널 용량(kW)</th>
			                <td>${building.solarPanelKW } kW</td>
			            </tr>
			        </table>
	                <div style="text-align: center; margin-top: 20px;">
			            <button class="back-btn">뒤로가기</button>
			            <button class="test-btn btn-green">테스트하기</button>
			        </div>
			    </div>
			</div>
			
        </c:forEach>
        
        <div id="overlay2">
				<div class="modal2">
					<form action="${pageContext.request.contextPath }/applyZEB" method="post" enctype="multipart/form-data" >
					
						<label for="selectBuilding"> 건물 선택</label>
						<select id="selectBuilding" name="bname" required>
							<option>===== 선택 =====</option>
							<c:forEach var="b_name" items="${buildingName }" varStatus="status">
								<option class="options" value="${b_name}">${b_name }</option>
							</c:forEach>
						</select>
						
						<label for="inputPdf"> 인증 파일 첨부 </label>
						<input id="inputPdf" name="attachment" type="file" accept=".pdf, .xls, .xlsx, .xlsm" required>
						
						<label for="inputOrg">발급기관명</label>
						<input id="inputOrg" name="applianceOrg" required>
						
						<div style="display: flex; justify-content: space-between; gap: 10px;">
						    <button type="button" class="back-btn2">뒤로가기</button>
						    <button type="submit">제출</button>
						</div>
					</form>
				</div>
		</div>
        
    </div>
    <button class="floating-btn" onclick="location.href='registerBuildingPage'">+</button>
    <div class="msg-box">다른 건물 추가 등록하기</div>
    <form id="submitForm" style="display: none;" action="${pageContext.request.contextPath }//submitBuildingInfo" method="post" onsubmit="showLoading()">
		<!-- 건물명 입력 -->
		<input type="text" id="buildingName" name="buildingName" required><br><br>
		<input type="text" id="buildingAddr" name="buildingAddr"><br><br>
		
		<!-- 기후 선택 -->
		<input type="text" id="climate" name="climate">
	
		<!-- 주거 형태 선택 -->
		<input type="text" id="residential" name="residentialType" required>
	
		<!-- 구조 형식 선택 -->
		<input type="text" id="wood" name="structureType"  required>
	
		<!-- 실내 연면적 입력 -->
		<input type="number" id="squareMeterArea" name="squareMeterArea" step="0.01" oninput="convertSquareMeterToPyeong()"><br>
	
		<!-- 층 수 입력 -->
		<input type="number" id="floors" name="floors" required><br><br>
	
		<!-- 출입문 개수 입력 -->
		<input type="number" id="doors" name="doors" required><br><br>
	
		<!-- 단열 수준 선택 -->
		<input type="text" id="passiveInsulation" name="insulationLevel"  required>
	
		<!-- 창호/기밀 수준 선택 -->
		<input type="text" id="passiveWindow" name="windowLevel" required>
	
		<!-- 환기 장치 선택 --> 
		<input type="text" id="passiveVentilation" name="ventilationSystem"  required>
	
		<!-- 태양광 패널 kW 입력 -->
		<input type="number" id="solarPanelCount" name="solarPanelKW" min="0"><br>
	
		<button id="submitBtn" type="submit">제출</button> 
	</form>
    <%@ include file="/WEB-INF/inc/footer.jsp" %>
    
    <script type="text/javascript">
	    let v_backBtn = document.querySelectorAll('.back-btn');
	    let v_testBtn = document.querySelectorAll('.test-btn');
	    let v_registBtn = document.querySelectorAll('.regist-building');
	    let v_testModal = document.querySelectorAll('.test-modal');
	    let v_overlay = document.querySelectorAll('.modal-overlay');
	    let v_form = document.querySelector('#submitForm');
	    
	    let v_options = document.querySelectorAll('.options');
	    
	    let v_backBtn2 = document.querySelectorAll('.back-btn2')[0];
	    let v_overlay2 = document.querySelector('#overlay2');
	    
	    v_testModal.forEach((v_tm,idx) =>{
	    	v_tm.addEventListener('click',()=>{
	    		v_overlay[idx].style.display = "flex";
	    	})
	    })
	    
	    v_backBtn.forEach((v_bb,idx)=>{
	    	v_bb.addEventListener('click',()=>{
	    		v_overlay[idx].style.display = "none";
	    	})
	    })
	    
	    v_registBtn.forEach( (v_rb,idx) =>{ 
	    	v_rb.addEventListener('click',()=>{
		    	v_overlay2.style.display = "flex";
	    	})
	    })
	    
	   
    	v_backBtn2.addEventListener('click',()=>{
    		v_overlay2.style.display = "none"; 
    	})
	    
	    
	    let v_table = document.querySelectorAll('.modal-table')
	    
	    v_testBtn.forEach((v_test,idx)=>{
	    	
	    	v_test.addEventListener('click',()=>{
	    		let rows = v_table[idx].querySelectorAll('td');
	    		let inputs = v_form.querySelectorAll('input'); 
	    		
	    		rows.forEach((row,idx) =>{
	    			if(idx != 1){
		    			if(inputs[idx].type == 'number'){
		    				inputs[idx].value = Number(row.innerText);
		    				if(idx == 11){
		    					inputs[idx].value = parseFloat(row.innerText);
		    				}
		    			}else{
			    			inputs[idx].value = row.innerText;
		    			}
	    			}
	    			
	    		})
	    		document.getElementById('submitBtn').click();
	    		
	    	})	
	    })
    
   	    function showLoading() {
	        document.getElementById('loading').style.display = 'flex';
	    }
    
    </script>
</body>
</html>