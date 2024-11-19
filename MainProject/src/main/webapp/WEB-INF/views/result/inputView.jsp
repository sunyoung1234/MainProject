<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<!-- buildingForm.html -->
<html>
<head>
    <title>건물 정보 입력</title> 
  <style>
        /* 전체 배경과 폰트 설정 */
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            color: #333;
            margin: 0;
            padding: 0;
        } 
 
        /* 중앙 정렬된 form 컨테이너 */
        .form-container {
        	border: 2px solid red; 
            max-width: 500px;  
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        
        /* 제목 스타일 */
        h1 {
            text-align: center;
            color: #444;
        }

        /* input과 label의 스타일 */
        label {
            display: block;
            font-weight: bold;
            margin: 10px 0 5px;
        }

        input[type="text"],
        input[type="number"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        /* 버튼 스타일 */
        button[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        button[type="submit"]:hover {
            background-color: #45a049;
        }

        /* 라디오 버튼과 체크박스 스타일 */
        input[type="radio"],
        input[type="checkbox"] {
       	    display: inline-block; 
            margin-right: 10px;
        }
        
        label.radio-inline {
		    display: inline-block;
		    margin-right: 15px;
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
    
    <script>
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
        
        
        
    </script> 
</head>
<body>
	<div id="loading" style="display: none;">
	  <div class="spinner"></div>
	  <p>데이터를 처리 중입니다. 잠시만 기다려주세요...(최대 1~2 분 소요)</p>
	</div>

    <h1>건물 정보 입력</h1>
    <div class="form-container">  
	    <form action="${pageContext.request.contextPath }/submitBuildingInfo" method="post" onsubmit="showLoading()">
	        <!-- 건물명 입력 -->
	        <label for="buildingName">건물명:</label>
	        <input type="text" id="buildingName" name="buildingName" required><br><br>
	
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
	 
	        <button type="submit">제출</button> 
	    </form>
    </div>
    
    <script type="text/javascript">
	    function showLoading() {
	        document.getElementById('loading').style.display = 'flex';
	    }
    </script>
    
    
</body>
</html>
