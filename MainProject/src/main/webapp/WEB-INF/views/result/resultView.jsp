<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>기후 정보 및 설정</title>
    <link href="css/styles.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    
    <style type="text/css">
        .container1 {   
		    width: 400mm; /* 너비 고정 */
		    height: calc(400mm * 1.414); /* 높이 고정 */
		    margin: 50px auto; /* 수직, 수평 가운데 정렬 */
		    box-sizing: border-box; /* 패딩과 보더를 포함한 크기 계산 */
		    display: flex;
		    flex-direction: column;
		    overflow: hidden; /* 내용물이 넘칠 경우 숨김 처리 */
		}
		
		.content {
		    padding-top: 20px; /* 내부 상단 간격 */
		    display: flex;
		    flex: 1;
		    overflow-y: auto; /* 내용이 넘칠 경우 스크롤 추가 */
		}
		
		.left-section, .right-section {
		    padding: 20px; /* 내부 여백 */
		    overflow-y: auto; /* 내용이 넘칠 경우 스크롤 추가 */
		}
		
		h1 {
		    text-align: center;
		    padding-top: 40px;  
		    font-size: 3.3em;
		    color: black;  
		}
				
		.tg { 
			padding-top: 20px;  
		    width: 100%;
		    border-collapse: collapse;
		    margin-bottom: 20px; /* 표와 표 사이 간격 */
		    table-layout: fixed; /* 테이블 레이아웃 고정 */
		}
		
		.tg th, .tg td {
		    border: 1px solid black;
		    padding: 10px;
		    text-align: center;
		    min-width: 100px; /* 최소 셀 너비 */
		}
		
		.tg .wider {
		    min-width: 300px; /* 특정 열 너비 */
		}
		
		h3 {
		    text-align: left;
		    font-size: 1.5em;
		    color: #333;
		    padding-bottom: 30px; /* 제목(h3)과 아래 테이블 간격 증가 */ 
		    padding-top: 20px;
		}
		canvas {
		    max-width: 400px;
		    max-height: 400px;
		    margin-left: 170px;  
		}
		.energy-summary { 
		    margin-top: 15px; /* 위 요소와 간격 */
		    display: flex;
		    gap: 20px; /* 차트와 텍스트 간 간격 */  
		    border: 1px solid #ddd; /* 외곽선 */ 
		    padding: 7px; /* 내부 여백 */
		    border-radius: 8px; /* 둥근 테두리 */
		    background-color: #f9f9f9; /* 배경 색상 */
		    justify-content: center; 
		}
		
		.energy-summary canvas {
			margin-left: 0px; 
			width: 50%;
		    max-width: 200px; /* 차트 크기 제한 */
		    height: 200px;
		}     
		
		.summary-text { 
			width: 50%;
		    font-size: 1em;
		    line-height: 1.5;
		    color: #333;
		    text-align: center; /* 텍스트를 가로로 가운데 정렬 */
		    display: flex; /* 플렉스박스 적용 */
		    flex-direction: column; /* 세로 방향으로 정렬 */
		    align-items: center; /* 가로 정렬을 가운데로 */
		    justify-content: center; /* 세로 정렬도 가운데로 */
		}
		
		.summary-text p {
		    margin: 5px 0; /* 각 줄 간격 */
		}
		
		.cost-summary {
		    margin-top: 20px; /* 위 요소와의 간격 */
		    text-align: center; /* 텍스트를 가운데 정렬 */
		    color: #6B8E23; /* 녹색 톤 색상 */
		    font-family: 'Arial', sans-serif;
		}
		
		.cost-item {
		    display: flex;
		    justify-content: space-between; /* 텍스트를 양쪽 정렬 */
		    align-items: center;
		    font-size: 1.2em;
		    padding: 10px 0;
		}
		
		.cost-label {
		    font-weight: bold;
		    font-size: 1em;
		}
		
		.cost-value {
		    font-weight: bold;
		    font-size: 1.5em;
		}
		
		.cost-line {
		    width: 80%; /* 라인 길이 조정 */
		    border: 0;
		    height: 1px;
		    background-color: #6B8E23; /* 라인 색상 */
		    margin: 5px auto; /* 위아래 간격 조정 */
		}
		.energy-table {
		    margin-top: 20px; /* 위 요소와 간격 */
		    text-align: center;
		    width: 100%;
		}
		
		.energy-table table {
		    width: 100%;
		    border-collapse: collapse; /* 테두리 합치기 */
		    font-size: 14px;
		    color: #333;
		}
		
		.energy-table th, .energy-table td {
		    border: 1px solid #ccc;
		    padding: 10px;
		    text-align: center;
		}
		
		.energy-table th {
		    background-color: #f4f4f4; /* 헤더 배경색 */
		    font-weight: bold;
		}
		
		
		.energy-table td {
		    font-size: 14px;
		}
		
		.energy-table tr:last-child td {
		    font-weight: bold; /* 합계 행 강조 */
		    background-color: #e0f7da; /* 합계 배경색 */
		}
		 #download-pdf {
		    margin-top: 70px;  /* 아래로 20px 이동 */  
		    margin-left: 200px; /* 오른쪽으로 50px 이동 */  
		    padding: 10px 20px; /* 버튼 크기 조정 */
		    background-color: #4CAF50; /* 버튼 배경색 */
		    color: white; /* 텍스트 색상 */
		    border: none; /* 테두리 제거 */
		    border-radius: 5px; /* 모서리 둥글게 */
		    cursor: pointer; /* 마우스 커서 스타일 */
		    font-size: 16px; /* 폰트 크기 */
		  }			
		h5{
			text-align: right;
			margin-right: 50px;
			margin-top: 15px;
		}     
		#doughnutChart2{
			margin-top: 25px;
		}
		  
		.bottom-border-none{
			border: 3px solid red;   
		}  
		.main-color-css {
		    background-color: #e0e0e0; /* 배경색 설정 */
		    color: #333333;
		    font-weight: bold; /* 폰트를 진하게 설정 */
		    font-size: 19px; /* 기본 폰트 크기 */
		}
		
		.sub-main-color-css{
		    background-color: #f4f4f4; /* 배경색 설정 */
		    color: #555555; /* 텍스트 색상 설정 (밝은 배경과 대비되는 회색) */ 
		    font-weight: bold; /* 폰트를 진하게 설정 */
		    font-size: 15px; /* 기본 폰트 크기 */
		}
    </style> 
</head>
<body>
	<button id="download-pdf">PDF 다운로드</button>
	<%@ include file="/WEB-INF/inc/top.jsp" %>
    <div id="capture-div" class="container1">  
        <h1>에너지 결과 페이지</h1>
        <h5>주소 : 미래융합교육원</h5>
        <div class="content">
            <div class="left-section">
                <!-- 왼쪽 구역 내용 -->
                <h3>재생 에너지 정보</h3>
                <table class="tg">
                    <thead>
                        <tr>
                            <th class="tg-c3ow main-color-css" rowspan="2">기후 정보</th>
                            <th class="tg-c3ow sub-main-color-css">기후 조건</th>
                            <th class="tg-c3ow" colspan="3"></th>
                        </tr>
                        <tr>
                            <th class="tg-c3ow sub-main-color-css">평균 기온()</th>
                            <th class="tg-c3ow"></th>
                            <th class="tg-c3ow sub-main-color-css">난방도시</th>
                            <th class="tg-c3ow"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="tg-c3ow main-color-css" rowspan="2">기본 설정</td>
                            <td class="tg-c3ow sub-main-color-css">건물 유형</td>
                            <td class="tg-c3ow"></td>
                            <td class="tg-c3ow sub-main-color-css">축열</td>
                            <td class="tg-c3ow"></td>
                        </tr>
                        <tr>
                            <td class="tg-c3ow sub-main-color-css">난방 온도</td>  
                            <td class="tg-c3ow"></td>
                            <td class="tg-c3ow sub-main-color-css">냉방 온도</td>
                            <td class="tg-c3ow"></td>
                        </tr>
                        <tr>
                            <td class="tg-c3ow main-color-css" rowspan="2">발열 정보</td>
                            <td class="tg-c3ow sub-main-color-css" >전체 거주자 수</td>
                            <td class="tg-c3ow"></td>
                            <td class="tg-c3ow sub-main-color-css" rowspan="2">내부발열<br>입력 유형</td>
                            <td class="tg-c3ow"></td>
                        </tr>
                        <tr>
                            <td class="tg-c3ow sub-main-color-css">내부 발열</td>
                            <td class="tg-c3ow"></td>
                            <td class="tg-c3ow"></td>
                        </tr>
                        <tr>
                            <td class="tg-c3ow main-color-css" rowspan="2">면적 체적</td>
                            <td class="tg-c3ow sub-main-color-css">유효 실내면적</td>
                            <td class="tg-c3ow"></td>
                            <td class="tg-c3ow sub-main-color-css">환기용 체적</td>
                            <td class="tg-c3ow"></td>
                        </tr>
                        <tr>
                            <td class="tg-c3ow sub-main-color-css ">A/V 비</td>
                            <td class="tg-c3ow" colspan="3"></td>
                        </tr>
                    </tbody>
                </table>
                
                <!-- 두 번째 테이블 -->
                <h3>재생 에너지 정보</h3>
                <table class="tg">
                    <thead>
                        <tr>
                            <th class="tg-baqh main-color-css" rowspan="3">열관류율</th>
                            <th class="tg-baqh sub-main-color-css">지붕</th>
                            <th class="tg-baqh"></th>
                            <th class="tg-baqh sub-main-color-css">외벽 등</th>
                            <th class="tg-baqh"></th>
                        </tr>
                        <tr>
                            <th class="tg-baqh sub-main-color-css">바닥/지면</th>
                            <th class="tg-baqh"></th>
                            <th class="tg-baqh sub-main-color-css">외기간접</th>
                            <th class="tg-baqh"></th>
                        </tr>
                        <tr>
                            <th class="tg-baqh sub-main-color-css">출 입 문</th>
                            <th class="tg-baqh"></th>
                            <th class="tg-baqh sub-main-color-css">창호 전체</th>
                            <th class="tg-baqh"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="tg-baqh main-color-css" rowspan="2">기본 유리</td>
                            <td class="tg-baqh sub-main-color-css">제품</td>
                            <td class="tg-baqh" colspan="3"></td>
                        </tr>
                        <tr>
                            <td class="tg-baqh sub-main-color-css">열관류율</td>
                            <td class="tg-baqh"></td>
                            <td class="tg-baqh sub-main-color-css">일사획득계수</td>
                            <td class="tg-baqh"></td>
                        </tr>
                        <tr>
                            <td class="tg-baqh main-color-css" rowspan="2">기본 창틀</td>
                            <td class="tg-baqh sub-main-color-css">제 품</td>
                            <td class="tg-baqh" colspan="3"></td>
                        </tr>
                        <tr>
                            <td class="tg-baqh sub-main-color-css">창틀 열관류율</td>
                            <td class="tg-baqh"></td>
                            <td class="tg-baqh sub-main-color-css">간봉 열관류율</td>
                            <td class="tg-baqh"></td>
                        </tr>
                        <tr>
                            <td class="tg-baqh main-color-css" rowspan="3">환기 정보</td>
                            <td class="tg-baqh sub-main-color-css">제품</td>
                            <td class="tg-baqh" colspan="3"></td>
                        </tr>
                        <tr>
                            <td class="tg-baqh sub-main-color-css">난방효율</td>
                            <td class="tg-baqh"></td>
                            <td class="tg-baqh sub-main-color-css">냉방효율</td>
                            <td class="tg-baqh"></td>
                        </tr>
                        <tr>
                            <td class="tg-baqh sub-main-color-css">습도회수율</td>
                            <td class="tg-baqh"></td>
                            <td class="tg-baqh sub-main-color-css">전력</td>
                            <td class="tg-baqh"></td>
                        </tr>
                        <tr>
                            <td class="tg-baqh main-color-css">열교</td>
                            <td class="tg-baqh sub-main-color-css">선형전달계수</td>
                            <td class="tg-baqh"></td>
                            <td class="tg-baqh sub-main-color-css">점형전달계수</td>
                            <td class="tg-baqh"></td>
                        </tr>
                    </tbody>
                </table>
                <!-- 세 번째 테이블 -->
                <h3>재생 에너지 정보</h3>
                <table class="tg">
                    <thead>
                        <tr>
                            <th class="tg-baqh main-color-css" rowspan="3">재생<br>에너지</th>
                            <th class="tg-baqh sub-main-color-css">태양열</th>
                            <th class="tg-baqh wider"></th>
                        </tr>
                        <tr>
                            <th class="tg-baqh sub-main-color-css">지열</th>
                            <th class="tg-baqh wider"></th>
                        </tr>
                        <tr>
                            <th class="tg-baqh sub-main-color-css">태양광</th>
                            <th class="tg-baqh wider"></th>
                        </tr>
                    </thead>
                </table>
                <h3>재생 에너지 정보</h3>  
                <div class="energy-summary">
				    <canvas id="doughnutChart3" width="200" height="200"></canvas>
				    <div class="summary-text">
				        <p><strong style="color: orange; font-size: 2em;">전기요금 절감 93%</strong></p>
				        <p>연간 CO<sub>2</sub> 절감: <strong>2.6 Ton</strong></p>
				        <p>소나무 대체효과: <strong>398 그루</strong></p>
				        <p>태양광 적용전: <strong>3,859 kWh/yr</strong>, <strong>602,860 원/yr</strong></p>
				        <p>태양광 적용후: <strong>44,610 원/yr</strong></p>
				    </div>
				</div>
                
            </div>
            
            <div class="right-section">     
                <!-- 오른쪽 구역에 표 삽입 -->
                <h3>재생 에너지 정보</h3>
                <table class="tg">
                    <thead>
                        <tr>
                            <th class="tg-baqh main-color-css" rowspan="3">난방</th>
                            <th class="tg-baqh sub-main-color-css" colspan="2">난방 성능</th>
                            <th class="tg-baqh"></th>
                        </tr>
                        <tr>
                            <th class="tg-sh4c sub-main-color-css" colspan="2">난방에너지 요구량</th>
                            <th class="tg-sh4c"></th>
                        </tr>
                        <tr>
                            <th class="tg-sh4c sub-main-color-css" colspan="2">난방 부하</th>
                            <th class="tg-sh4c"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="tg-baqh main-color-css" rowspan="6">냉방</td>
                            <td class="tg-ysmt sub-main-color-css" style="border-bottom: none;" colspan="2">냉방에너지 요구량</td>
                            <td class="tg-sh4c"></td>
                        </tr>
                        <tr>
                            <td class="tg-sh4c sub-main-color-css" style="border-top: none;" rowspan="2"></td> 
                            <td class="tg-baqh sub-main-color-css">헌열에너지</td>
                            <td class="tg-sh4c"></td>
                        </tr>
                        <tr>
                            <td class="tg-baqh sub-main-color-css">제습에너지</td>
                            <td class="tg-sh4c"></td>
                        </tr>
                        <tr>
                            <td class="tg-sh4c sub-main-color-css" style="border-bottom: none;" colspan="2">냉방 부하</td> 
                            <td class="tg-sh4c">ss</td>  
                        </tr>
                        <tr>
                            <td class="tg-sh4c sub-main-color-css" style="border-top: none;" rowspan="2"></td>
                            <td class="tg-baqh sub-main-color-css">헌열 부하</td>
                            <td class="tg-sh4c"></td>
                        </tr>
                        <tr>
                            <td class="tg-baqh sub-main-color-css">제습 부하</td>
                            <td class="tg-sh4c"></td>
                        </tr>
                        <tr>
                            <td class="tg-baqh main-color-css" rowspan="3">총량</td>
                            <td class="tg-sh4c sub-main-color-css" colspan="2">총 에너지 소요량</td>
                            <td class="tg-sh4c"></td>
                        </tr>
                        <tr>
                            <td class="tg-sh4c sub-main-color-css" colspan="2">CO2 배출량</td>
                            <td class="tg-sh4c"></td>
                        </tr>
                        <tr>
                            <td class="tg-sh4c sub-main-color-css" colspan="2">1차 에너지 소요량</td>
                            <td class="tg-sh4c"></td>
                        </tr>
                        <tr>
                            <td class="tg-baqh main-color-css">기밀</td>
                            <td class="tg-sh4c sub-main-color-css" colspan="2">기밀도 n50 (1/h)</td>
                            <td class="tg-sh4c"></td>
                        </tr>
                        <tr>
                            <td class="tg-baqh main-color-css">검토결과</td>   
                            <td class="tg-sh4c sub-main-color-css" colspan="3">☞ 에너지 효율등급 기준에 의한 등급 :</td>
                        </tr>
                    </tbody>
                </table>
                <div class="energy-table">
				    <table>
				        <thead>
				            <tr>
				                <th>사용처<br>(Use)</th>
				                <th colspan="2">에너지 기초소요량</th>
				                <th colspan="2">에너지 비용</th>
				            </tr>
				            <tr>
				                <th></th>
				                <th>(kWh/yr)</th>
				                <th>비율</th>
				                <th>(원/yr)</th>
				                <th>비율</th>
				            </tr>
				        </thead>
				        <tbody>
				            <tr>
				                <td>난방</td>
				                <td>2,448</td>
				                <td>25%</td>
				                <td>134,450</td>
				                <td>35%</td>
				            </tr>
				            <tr>
				                <td>온수</td>
				                <td>3,105</td>
				                <td>32%</td>
				                <td>180,010</td>
				                <td>47%</td>
				            </tr>
				            <tr>
				                <td>냉방</td>
				                <td>924</td>
				                <td>10%</td>
				                <td>11,778</td>
				                <td>3%</td>
				            </tr>
				            <tr>
				                <td>환기</td>
				                <td>501</td>
				                <td>5%</td>
				                <td>5,608</td>
				                <td>1%</td>
				            </tr>
				            <tr>
				                <td>조명</td>
				                <td>578</td>
				                <td>6%</td>
				                <td>6,474</td>
				                <td>2%</td>
				            </tr>
				            <tr>
				                <td>조리</td>
				                <td>424</td>
				                <td>4%</td>
				                <td>24,744</td>
				                <td>6%</td>
				            </tr>
				            <tr>
				                <td>가전</td>
				                <td>1,735</td>
				                <td>18%</td>
				                <td>19,421</td>
				                <td>5%</td>
				            </tr>
				            <tr>
				                <td>기타</td>
				                <td>0</td>
				                <td>0%</td>
				                <td>0</td>
				                <td>0%</td>
				            </tr>
				            <tr>
				                <td>합 계</td>
				                <td>9,716</td>
				                <td></td>
				                <td>382,484</td>
				                <td></td>
				            </tr>
				        </tbody>
				    </table>
				</div>
				                
                <canvas id="doughnutChart2" width="200" height="200"></canvas>
                <div class="cost-summary">
				    <div class="cost-item">
				        <span class="cost-label">▶▶ 연간 난방 비용</span>
				        <span class="cost-value">134,500 원</span>
				    </div>
				    <hr class="cost-line">
				    <div class="cost-item">
				        <span class="cost-label">▶▶ 연간 총에너지 비용</span>
				        <span class="cost-value">382,500 원</span>
				    </div>
				    <hr class="cost-line">
				</div>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/inc/footer.jsp"%>
    <script>
    
    const ctx2 = document.getElementById('doughnutChart2').getContext('2d');

	 // 데이터와 레이블
	 const labels2 = ['난방', '온수', '냉방', '환기', '조명', '조리', '가전', '기타'];
	 const data2 = [134450, 180010, 11778, 5608, 6474, 24744, 19421, 0];
	
	 // 도넛 차트 생성
	 const doughnutChart2 = new Chart(ctx2, {
	     type: 'doughnut', // 도넛 차트 타입
	     data: {
	         labels: labels2, // 데이터 레이블
	         datasets: [{
	             data: data2, // 데이터 값
	             backgroundColor: [
	                 '#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0',
	                 '#9966FF', '#FF9F40', '#E7E9ED', '#FF6384'
	             ], // 각 섹션 색상
	             hoverBackgroundColor: [
	                 '#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0',
	                 '#9966FF', '#FF9F40', '#E7E9ED', '#FF6384'
	             ]
	         }]
	     },
	     options: {
	         responsive: true,
	         plugins: {
	             legend: {
	                 position: 'top', // 범례 위치
	             },
	             tooltip: {
	                 enabled: true // 툴팁 활성화
	             }
	         }
	     }
	 });
	 
	    const ctx3 = document.getElementById('doughnutChart3').getContext('2d');

	    // 데이터 설정
	    const labels3 = ['전기요금 절감', '기타'];
	    const data3 = [93, 7];

	    // 차트 생성
	    const doughnutChart3 = new Chart(ctx3, {
	        type: 'doughnut',
	        data: {
	            labels: labels3,
	            datasets: [{
	                data: data3,
	                backgroundColor: ['#FFA500', '#E7E9ED'], // 도넛 색상
	                hoverBackgroundColor: ['#FF8C00', '#D6D8DB']
	            }]
	        },
	        options: {
	            responsive: true,
	            plugins: {
	                legend: {
	                    display: false // 레전드 숨기기
	                },
	                tooltip: {
	                    enabled: false // 툴팁 숨기기
	                }
	            },
	            cutout: '80%', // 도넛 중앙 구멍 크기 설정
	        }
	    });

	</script>
	<script type="text/javascript">
	
		document.getElementById("download-pdf").addEventListener("click", function () {
	        // A4 크기 (pt 단위)
	        const A4_WIDTH = 595.28;
	        const A4_HEIGHT = 841.89;
	
	        html2canvas(document.querySelector("#capture-div"), { scale: 2 }).then((canvas) => {
	            const imgData = canvas.toDataURL("image/png");
	
	            // HTML 캡처 이미지 크기 계산
	            const imgWidth = canvas.width;  // 캔버스 가로 크기
	            const imgHeight = canvas.height; // 캔버스 세로 크기
	
	            // 비율 유지하며 A4 크기에 맞게 조정
	            const pdf = new jspdf.jsPDF("portrait", "pt", "a4");
	            const aspectRatio = imgHeight / imgWidth;
	            const pdfWidth = A4_WIDTH;
	            const pdfHeight = pdfWidth * aspectRatio;
	
	            // 이미지 추가 (중앙 정렬)
	            const xOffset = (A4_WIDTH - pdfWidth) / 2;
	            const yOffset = (A4_HEIGHT - pdfHeight) / 2;
	            pdf.addImage(imgData, "PNG", xOffset, yOffset, pdfWidth, pdfHeight);
	
	            // PDF 다운로드
	            pdf.save("capture.pdf");
	        });
	    });
	</script> 
</body>
</html>
