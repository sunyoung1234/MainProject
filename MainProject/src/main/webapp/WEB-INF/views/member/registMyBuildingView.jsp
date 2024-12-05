<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<!-- buildingForm.html -->
<html>
<head>
    <title>건물 정보 입력</title> 
  <link href="css/styles.css" rel="stylesheet" />
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
  <style>
        /* 전체 배경과 폰트 설정 */
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            color: #333;
            margin: 0;
            padding: 0;
        } 
 
	    .form-container {
	        width: 40%; /* 폼 컨테이너 넓이 */   
	        margin: 0 auto; /* 중앙 정렬 */
	        padding: 30px; /* 내부 여백 */
	        border: 1px solid #ccc; /* 테두리 */
	        border-radius: 10px; /* 둥근 모서리 */
	        background-color: #f9f9f9; /* 배경색 */
	        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
	        margin-top: 30px;
	        margin-bottom: 30px;
	    }
	
	    .form-container label {
	        display: block; /* 라벨 블록 요소 */
	        margin-bottom: 10px; /* 라벨 아래 여백 */
	        font-size: 18px; /* 라벨 글자 크기 */
	        font-weight: bold; /* 글자 굵기 */
	    }
	    .form-container .radio-inline label {
	        display: inline-block; /* 수평 정렬 */
	        font-size: 18px; /* 다른 label과 동일한 크기 */
	        font-weight: normal; /* 필요 시 굵기 조정 가능 */
	        margin-right: 10px; /* 버튼과 간격 설정 */
	    }
	    
	
	    .form-container input, 
	    .form-container select, 
	    .form-container button {
	        width: 95%; /* 입력 필드 넓이 */
	        padding: 15px; /* 내부 여백 */
	        margin-top: 20px;
	        margin-bottom: 20px; /* 아래 여백 */
	        border: 1px solid #ccc; /* 테두리 */
	        border-radius: 8px; /* 둥근 모서리 */
	        font-size: 18px; /* 글자 크기 */
	    }
	
	    .form-container input[type="radio"], 
	    .form-container input[type="checkbox"] {
	        width: auto; /* 기본 크기 유지 */
	        margin-right: 5px; /* 라디오와 라벨 간 거리 */
	    }
	
	    .form-container .radio-inline {
	        display: inline-block; /* 라디오 버튼 수평 정렬 */
	        margin-right: 15px; /* 라디오 버튼 사이 간격 줄이기 */
	        font-size: 16px; /* 글자 크기 */
	    }
	
	    .form-container button {
	        background-color: #4CAF50; /* 버튼 배경색 */
	        color: white; /* 버튼 글자 색 */
	        font-weight: bold; /* 글자 굵기 */
	        font-size: 20px; /* 버튼 글자 크기 */
	        cursor: pointer; /* 마우스 커서 */
	        transition: background-color 0.3s ease; /* 호버 애니메이션 */
	    }
	
	    .form-container button:hover {
	        background-color: #45a049; /* 버튼 호버 색상 */
	    }
        /* 제목 스타일 */
        h1 {
            text-align: center;
            color: #444;
            padding-top: 50px; /* 상단 여백을 추가 */
        }
        #inputFileBtn{
	    	width: 50px;
	    }

			    
	    #inputFileBtn:hover{
	    	cursor: pointer;
	    } 
   	    .reviewImages{
	    	width: 100px;
	    	height: 100px;
	    }
	    
   	    #filesDiv{
	    	display: flex;
	    	flex-wrap: wrap;
	    }
	    
	    #filesDiv > div{
	    	margin: 20px;
	    }
	    
	    .deleteReviewImg{
	    	color: red;
	    	font-weight: bold;
	    	text-align: end;   
	    }
	    
	    .deleteReviewImg:hover{ 
	    	cursor: pointer;   
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
	<%@ include file="/WEB-INF/inc/subnavbarMap.jsp"%> 
	<div id="loading" style="display: none;">
	  <div class="spinner"></div>
	  <p>데이터를 처리 중입니다. 잠시만 기다려주세요...(최대 1~2 분 소요)</p>
	</div>

    <h1>건물 정보 입력</h1>
    <div class="form-container">  
	    <form action="${pageContext.request.contextPath }/registMyBuilding" method="post" onsubmit="showLoading()" enctype="multipart/form-data">
	        <!-- 건물명 입력 -->
	        <label for="buildingName">건물명:</label>
	        <input type="text" id="buildingName" name="buildingName" required><br><br>
	        
	        <label >건물주소:</label>
	        <!-- 주소 input -->
			<div class="form-floating mb-3">

				<div class="d-flex">
				    <input type="text" id="sample4_postcode" name="postcode" class="form-control" placeholder="우편번호" readonly />
				    <input type="button" class="btn btn-custom ms-2" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
				</div>
			</div>

			<div class="form-floating mb-3">
			    <input type="text" id="sample4_roadAddress" name="roadAddress" class="form-control" placeholder="도로명 주소" readonly />
			    <label for="sample4_roadAddress" class="label-small">도로명 주소</label>
			</div>
			 
			<div class="form-floating mb-3">
			    <input type="text" id="sample4_jibunAddress" name="jibunAddress" class="form-control" placeholder="지번 주소" readonly  />
			    <label for="sample4_jibunAddress" class="label-small">지번 주소</label>
			</div>
			
			<div class="form-floating mb-3">
			    <input type="text" id="sample4_extraAddress" name="extraAddress" class="form-control" placeholder="참고 항목" />
			    <label for="sample4_extraAddress" class="label-small">상세 주소</label>
			</div>
	
	        <!-- 기후 선택 -->
	        <label for="climate">기후 선택:</label>
	        <select id="climate" name="climate" required>
	            <option value="서울">서울</option>
	            <option value="춘천">춘천</option>
	            <option value="강릉">강릉</option>
	            <option value="원주">원주</option>
	            <option value="대전">대전</option>
	            <option value="청주">청주</option>
	            <option value="서산">서산</option>
	            <option value="대구">대구</option>
	            <option value="포항">포항</option>
	            <option value="영주">영주</option> 
	            <option value="부산">부산</option>
	            <option value="진주">진주</option>
	            <option value="전주">전주</option>
	            <option value="광주">광주</option>
	            <option value="목포">목포</option>
	            <option value="제주">제주</option>
	        </select><br><br>
	
	        <!-- 주거 형태 선택 -->
	        <label class="radio-inline" >주거 형태:</label><br>
	        <input type="radio" id="residential" name="residentialType" value="주거" required>
	        <label class="radio-inline" for="residential">주거</label><br>
	        <input type="radio" id="nonResidential" name="residentialType" value="비주거(주5일)">
	        <label class="radio-inline"  for="nonResidential">비주거</label><br><br>
	
	        <!-- 구조 형식 선택 -->
	        <label class="radio-inline" >구조 형식:</label><br> 
	        <input type="radio" id="wood" name="structureType" value="목조" required>
	        <label class="radio-inline"  for="wood">목조</label><br>
	        <input type="radio" id="concrete" name="structureType" value="철근콘크리트">
	        <label class="radio-inline"  for="concrete">철근콘크리트</label><br><br>
	
	        <!-- 실내 연면적 입력 -->
	        <label>실내 연면적 입력:</label><br>
	        <label for="squareMeterArea">제곱미터 (m²):</label>
	        <input type="number" id="squareMeterArea" name="squareMeterArea" step="0.01" oninput="convertSquareMeterToPyeong()"><br>
	
	        <label for="pyeongArea">평수:</label>
	        <input type="number" id="pyeongArea" name="pyeongArea" step="0.01" oninput="convertPyeongToSquareMeter()"><br><br>
	
	        <!-- 층 수 입력 -->
	        <label for="floors">층 수:</label>
	        <input type="number" id="floors" name="floors" required><br><br>
	
	        <!-- 출입문 개수 입력 -->
	        <label for="doors">출입문 개수:</label>
	        <input type="number" id="doors" name="doors" required><br><br>
	
	        <!-- 단열 수준 선택 -->
	        <label class="radio-inline" >단열 수준:</label><br>
	        <input type="radio" id="passiveInsulation" name="insulationLevel" value="패시브(상세)" required>
	        <label class="radio-inline"  for="passiveInsulation">패시브</label><br>
	        <input type="radio" id="normalInsulation" name="insulationLevel" value="일반(법규,중부지방)">
	        <label class="radio-inline"  for="normalInsulation">일반</label><br><br>
	
	        <!-- 창호/기밀 수준 선택 -->
	        <label class="radio-inline" >창호/기밀 수준:</label><br>
	        <input type="radio" id="passiveWindow" name="windowLevel" value="패시브" required>
	        <label class="radio-inline"  for="passiveWindow">패시브</label><br>
	        <input type="radio" id="normalWindow" name="windowLevel" value="일반">
	        <label class="radio-inline"  for="normalWindow">일반</label><br><br>
	
	        <!-- 환기 장치 선택 --> 
	        <label class="radio-inline" >환기 장치:</label><br>
	        <input type="radio" id="passiveVentilation" name="ventilationSystem" value="열회수형(고효율)" required>
	        <label class="radio-inline"  for="passiveVentilation">열회수형(고효율)</label><br>
	        <input type="radio" id="normalVentilation" name="ventilationSystem" value="열회수형(일반)">
	        <label class="radio-inline"  for="normalVentilation">일반</label><br><br> 
	
	        <!-- 태양광 패널 개수 입력 -->
	        <label class="radio-inline" >태양광 패널 총 출력(KW):</label><br>
	        <input type="number" id="solarPanelCount" name="solarPanelKW" min="0"><br>
	        <input type="checkbox" id="noPanel" name="noPanel" value="0" onclick="toggleSolarPanelInput()">
	        <label class="radio-inline"  for="noPanel">없음</label><br><br>
	 
	 		<label for="inputFileBtn">건물 사진</label>
            <img id="inputFileBtn" src="https://cdn-icons-png.flaticon.com/512/5735/5735394.png">
			<input style="display: none;" name="files" type="file" id="inputFile" multiple accept="image/*">
			<div id="filesDiv">
				
			</div>
	 
	        <button type="submit">제출</button> 
	    </form>
    </div>
    <c:if test="${sessionScope.login.memId != 'admin' }">
	    <%@ include file="/WEB-INF/inc/chatbotbot.jsp"%>
	</c:if>
    <%@ include file="/WEB-INF/inc/footer.jsp" %>
    
    <script type="text/javascript">
		let v_postcode = document.querySelector('#sample4_postcode');	// 우편번호
		let v_roadAddress = document.querySelector('#sample4_roadAddress'); // 도로명 주소
		let v_jibunAddress = document.querySelector('#sample4_jibunAddress'); // 상세 주소
		let v_extraAddress = document.querySelector('#sample4_extraAddress'); // 참고 항목
		
		let v_filesDiv = document.getElementById('filesDiv');
		let fileHTML = '';
	    
	    function showLoading() {
	        document.getElementById('loading').style.display = 'flex';
	    }
		
        // 평수와 제곱미터 환산 코드 유지
        function convertPyeongToSquareMeter() {
            const pyeong = document.getElementById("pyeongArea").value;
            if (pyeong) {
                document.getElementById("squareMeterArea").value = (pyeong * 3.3).toFixed(0);
            }
        }

        function convertSquareMeterToPyeong() {
            const squareMeter = document.getElementById("squareMeterArea").value;
            if (squareMeter) {
                document.getElementById("pyeongArea").value = (squareMeter / 3.3).toFixed(0);
            }
        }

        // 태양광 패널 없음 체크시 패널 수 입력 비활성화
        function toggleSolarPanelInput() {
            const noPanel = document.getElementById("noPanel").checked;
            document.getElementById("solarPanelCount").disabled = noPanel;
            if (noPanel) {
                document.getElementById("solarPanelCount").value = 0; // 입력 값 초기화
            }
        }
        
	    function sample4_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	            	
	                var roadAddr = data.roadAddress;
	                var extraRoadAddr = '';
	                var jibunAddr = '';
	                
	                if(data.autoJibunAddress != ''){
	                	jibunAddr = data.autoJibunAddress;
	                }else{
	                	jibunAddr = data.jibunAddress;
	                }

	                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
	                    extraRoadAddr += data.bname;
	                }
	                if (data.buildingName !== '' && data.apartment === 'Y') {
	                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                $('#sample4_postcode').val(data.zonecode);
	                $('#sample4_roadAddress').val(roadAddr);
	                $('#sample4_jibunAddress').val(jibunAddr);
	                $('#sample4_extraAddress').val(extraRoadAddr);
	            }
	        }).open();
	    }
	    
    	document.getElementById('inputFile').addEventListener('change',()=>{
    		let fileList = event.target.files;
    		
    		
    		let v_filesDiv = document.getElementById('filesDiv');
    		let fileHTML = '';
    		
    		for(let i=0; i< fileList.length; i++){
    			
	   			let reader = new FileReader(); // 각 파일에 대해 새로운 파일리더 생성 (비동기적으로 읽을 수 없음 한번에 하나만)
	   			
    			
        		reader.onload = function(e){
	    			fileHTML += '<div><span style="display: none;">'+ (i+1) + '. ' + fileList[i]['name'] +'</span>';
	    			fileHTML += '<p class="deleteReviewImg"> X </p>'
        			fileHTML += '<img class="reviewImages" src="' + e.target.result + '"></div>'
		   			v_filesDiv.innerHTML = fileHTML;  
        			
			    	let v_delBtns = document.querySelectorAll('.deleteReviewImg');
			    	v_delBtns.forEach((del,j) =>{
			    		del.addEventListener('click',()=>{
			    			const dataTransfer = new DataTransfer();
			    			del.parentElement.remove();  
			    			let fileArray = Array.from(document.getElementById('inputFile').files);
			    			
			    			fileArray.splice( j, 1);
			    			fileArray.forEach(file => { 
			    				dataTransfer.items.add(file); 
			    			});
			    			document.getElementById('inputFile').files = dataTransfer.files;
			    		}) 
			    	})
        		}
        		reader.readAsDataURL(fileList[i]) 
        		
    		}
    		
    		
    	}) 
    	
    	
    	
    	
    	document.getElementById('inputFileBtn').addEventListener('click',()=>{
    		document.getElementById('inputFile').click();
    	})
    </script>
    
    
</body>
</html>
