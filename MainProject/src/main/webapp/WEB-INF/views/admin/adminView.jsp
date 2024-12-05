<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content />
    <meta name="author" content />
    <title>관리자 페이지</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Custom Google font-->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@100;200;300;400;500;600;700;800;900&amp;display=swap" rel="stylesheet" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.6.2/cropper.min.css" integrity="sha512-UtLOu9C7NuThQhuXXrGwx9Jb/z9zPQJctuAgNUBK3Z6kkSYT9wJ+2+dh6klS+TDBCV9kNPBbAxbVD+vCcfGPaA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <style type="text/css">
        /* 기본 페이지 레이아웃 설정 */
        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
            background-color: #f8f9fa;
        }

        .main-height {
            width: 1300px;
            margin: 50px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        
        .page-middle-container{
        	display:flex;
        	justify-content: space-between; 
        	border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            padding-top: 20px;
            padding-left: 20px; 
            margin-bottom: 20px;
            margin-top:30px;
            border: 1px solid #6FFBE9;
            margin-right:50px; 
            
        }

        .page-count-all {
    		width:800px;
    		height:400px;    
    		margin-bottom: 80px; 
        }
 
        .page-count-box {
            display: flex;
            justify-content: space-between;
            gap: 20px;
            margin-bottom: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            margin-top: 10px;
            padding-top: 20px;
            padding-bottom: 20px;
            padding-left: 20px; 
            border: 1px solid #5F92CF;
            margin-right: 50px;
        }

        .page-count-id, .page-count-page {
            width: 48%;
        }
        
        .select-box{
        	display: flex;
        	width:100%;
        	justify-content: center; 
        	margin-bottom: 40px;
        } 
         

        /* select 박스 스타일 */
        select {
            width: 80%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            margin-bottom: 20px;
            background-color: #fafafa;
        }

        select:focus {
            border-color: #007bff;
            outline: none;
        }
        
        .select-option{
        	width:50%;
        }
        
        .select-division{
        	width:30%; 
        	font-weight: bold;
        	font-size:12px;
        	display: flex;
        	align-items: center;
        	justify-content: center; 
        	margin-right: 10px;
        }
        
        .page-count-all-h2{
        	text-align: center;
        }
        
        .user-container{ 
        	width:100%;
        	height:300px;
        	display: flex;
        	justify-content: space-between;
        	margin-bottom:60px;
        	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 테이블에 그림자 추가 */
	    	border-radius: 8px; /* 테이블 둥근 모서리 */
	    	border: 1px solid #4AE398;
        	
        }
        
        .user-box{
        	width: calc(100% / 3 - 5px);
        	margin-bottom:20px;
        	margin-top:30px;
        	margin-left:30px;
        	margin-right:30px;
        	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 테이블에 그림자 추가 */
	    	border-radius: 8px; /* 테이블 둥근 모서리 */
	    	border: 1px solid #319665;
        	
        }
        
        .user-title{
        	font-size: 30px;
        	display: flex;
        	justify-content: center;
        	margin-top: 30px;
        	margin-bottom: 40px; 
        	 
        }
        
        .user-count{
        	margin-left:60px; 
        	margin-bottom: 20px;
        	color:#354BDB;
        	font-size:25px; 
        }
        
        .user-time{
        	margin-left:60px; 
        	color: #DB3F33;
        	font-size:25px; 
        }
        
        .page-rank-container{
        	width:300px;
        	hegiht:150px;
        	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 테이블에 그림자 추가 */
	    	border-radius: 8px; /* 테이블 둥근 모서리 */
        	margin-right:30px;  
        	margin-left:30px;  
        	margin-top:50px;
        	margin-bottom:80px; 
        	border: 1px solid #CF5B5B;
        }
        
        .page-rank-title{
        	display: flex;
        	justify-content: center;
        	margin-bottom: 40px;
        	margin-top:50px;
        	font-weight: bold;
        	font-size:25px;
        }
        
        .page-rank-first{
        	margin-left: 35px; 
        	margin-bottom:30px;  
        	color: #E9EB13;
        	font-weight:bold;
        }
        
        .page-rank-second{
        	margin-left: 70px;
        	margin-bottom:30px;
        	color: #D2E0EB;
        	font-weight:bold
        }
        
        .page-rank-thrid{
        	margin-left: 70px; 
        	margin-bottom:30px;
        	color: #BA9F7D;
        	font-weight:bold
        }
        
        img{
        	width:30px;
        	height:30px;
        }
        
        .king-img{ 
        	padding-right:8px;
        }
        
        .select-date{
        	width:30%; 
        	font-weight: bold;
        	font-size:15px;
        	display: flex;
        	align-items: center;
        	justify-content: center; 
        	margin-right: 10px;
        }
        
        .userChartBox{
        	display: flex;
        	margin-bottom: 50px;
        	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 테이블에 그림자 추가 */
	    	border-radius: 8px; /* 테이블 둥근 모서리 */
	    	padding-top: 20px;
	    	padding-left: 20px; 
	    	border:  1px solid #ffc107;   
	    	
	    	 
        }
        
        .userChartBoxLeft{
        	width:600px;
        }
        
        .userChartBoxLeft{
        	margin-top:90px;
        }
        
        .login-count-title {
		    position: relative;
		    top: 20px;
		    font-size: 18px;
		    font-weight: bold; 
		    margin-left:20px;
		    background-color: #ffc107;
		    width:250px;
		    height:50px;  
		    display: flex;
			align-items: center;
			padding-left: 10px;
			padding-right:10px;   
			justify-content: center;
			box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 테이블에 그림자 추가 */
	    	border-radius: 8px; /* 테이블 둥근 모서리 */
		}
		
		.login-count-page {
		    position: relative;
		    top: 20px;
		    font-size: 18px;
		    font-weight: bold; 
		    margin-left:20px;
		    background-color: skyblue;
		    width:250px;
		    height:50px;  
		    display: flex;
			align-items: center;
			padding-left: 10px;
			padding-right:10px;   
			justify-content: center;
			box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 테이블에 그림자 추가 */
	    	border-radius: 8px; /* 테이블 둥근 모서리 */
		}
		
		.page-container-main{
			border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            padding-top: 20px;
            padding-left: 20px; 
            margin-bottom: 20px;
            border: 1px solid skyblue;
		
		}
		
		.login-count-visit {
		    position: relative;
		    top: 20px;
		    font-size: 18px;
		    font-weight: bold; 
		    margin-left:20px;
		    background-color: #4AE398;
		    width:250px;
		    height:50px;  
		    display: flex;
			align-items: center;
			padding-left: 10px;
			padding-right:10px;   
			justify-content: center;
			box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 테이블에 그림자 추가 */
	    	border-radius: 8px; /* 테이블 둥근 모서리 */
		}
		
		.admit-title{
			display: flex;
			justify-content: center;
			margin-top: 50px;
		}


    </style>
</head>

<body class="d-flex flex-column">

    <%@ include file="/WEB-INF/inc/top.jsp"%>
	<%@ include file="/WEB-INF/inc/subnavbaradmin.jsp"%> 
	
	<h2 class="admit-title">관리자 페이지</h2>
    <div class="main-height">
    	
    	<div class="login-count-visit">이용자 방문 현황</div>
    	<div class="user-container">
    		<div class="user-box">
	    		<div class="user-title">전체</div>
	    		<div class="user-count">접속자 수 : ${allUserVisit } 명  </div>
	    		<div class="user-time">평균 접속 시간 : ${userAllAvg } 분</div>
	    	</div>
	    	<div class="user-box"> 
	    		<div class="user-title">오늘</div>
	    		<div class="user-count">접속자 수 : ${todayCount} 명</div>
	    		<div class="user-time">평균 접속 시간 : ${todayUserAvg } 분</div>
	    	</div>
	    	<div class="user-box">
	    		<div class="user-title">어제</div>
	    		<div class="user-count">접속자 수 : ${yesterdayCount} 명</div>
	    		<div class="user-time">평균 접속 시간 : ${yesterdayUserAvg } 분</div>
	    	</div>
    	</div>
    	
    	<div class="login-count-title">날짜·시간별 로그인 횟수</div>
    	<div class="userChartBox">
    		<div class="userChartBoxLeft">
    			<canvas id="allUserDateChart"></canvas>
    		</div>
    	
    		<div class="select-option">
    			<div class="select-box">
            		<div class="select-date">
            			날짜
            		</div>
            		<div class="select-option">
            			<select id="selectDate"> 
            			</select>
            		</div>
            	</div>
         		
            	<canvas id="userDateChart"></canvas>
         	</div>
    	</div> 
    	
    	<div class="login-count-page">페이지 방문 횟수</div>
    	<div  class="page-container-main">
	    	<div class="page-middle-container">
	    		<!-- 전체 페이지 방문 횟수 차트 -->
		        <div class="page-count-all">
		        	<h4 class="page-count-all-h2"></h4>
		            <canvas id="myChart"></canvas>
		        </div>
		        <div class="page-rank-container">
		           	<div class="page-rank-title">페이지 접속 순위</div>
		           	<div class="page-rank-first">
		           		
		           </div>
		           	<div class="page-rank-second">2위 : 전기 사용량(230) </div>
		           	<div class="page-rank-thrid">3위 : 전기 사용량(230) </div>
		        </div>
	    	</div>
	        
		
	        <!-- 아이디별 페이지 횟수, 페이지별 아이디 횟수 -->
	        <div class="page-count-box">
	            <div class="page-count-id">
	            	<div class="select-box">
	            		<div class="select-division">
		            		아이디
	            		</div>
	            		<div class="select-option">
	            			<select id="selectId"> 
	               		 	</select>
	            		</div>
	            	</div>
	                
	                <canvas id="myChartId"></canvas>
	            </div>
	            <div class="page-count-page">
	           		<div class="select-box">
	            		<div class="select-division">
		            		페이지 이름
	            		</div>
	            		<div class="select-option">
	            			<select id="selectPageName">
		                	</select>
	            		</div>
	            	</div>
	            	
		                
	            	
	                <canvas id="myChartPage"></canvas>
	            </div>
	        </div>
    		
    	</div>
    	
    </div>

    <%@ include file="/WEB-INF/inc/footer.jsp" %>

    <!-- Bootstrap core JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.6.2/cropper.min.js" integrity="sha512-JyCZjCOZoyeQZSd5+YEAcFgz2fowJ1F1hyJOXgtKu4llIa0KneLcidn5bwfutiehUTiOuK87A986BZJMko0eWQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <script type="text/javascript">
        // 페이지 데이터 처리
        let v_pageNameAll = '${pageNameAll}';
        let v_visitCountAll = '${visitCountAll}';
        

        v_pageNameAll = v_pageNameAll.replace("[", "").replace("]", "").split(",");
        v_visitCountAll = v_visitCountAll.replace("[", "").replace("]", "").replace(/\s+/g, '').split(",");
        
        document.querySelector('.page-rank-first').innerHTML = '<img src="https://cdn-icons-png.flaticon.com/512/862/862758.png"> 1위 : ' + v_pageNameAll[0] + " ("+ v_visitCountAll[0] + ")"
        document.querySelector('.page-rank-second').innerHTML = "2위 : " + v_pageNameAll[1] + " ("+ v_visitCountAll[1] + ")"
        document.querySelector('.page-rank-thrid').innerHTML = "3위 : " + v_pageNameAll[2] + " ("+ v_visitCountAll[2] + ")"
        console.log(v_pageNameAll);
        console.log(v_visitCountAll);

        let ctx = document.getElementById('myChart');
        let myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: v_pageNameAll,
                datasets: [{
                    label: '페이지별 이용 횟수',
                    data: v_visitCountAll,
                    borderWidth: 1,
                    backgroundColor: '#5BCFC0',
                    borderColor: '#5BCFC0'
                }]
            },
            options: {
                responsive: true,
                scales: {
                	 y: {
                         ticks: {
                             stepSize: 1,  // y축의 값을 1씩 증가
                         }
                     }
                }
            }
        });

        let ctx1 = document.getElementById('myChartId');
        let myChart1 = new Chart(ctx1, {
            type: 'bar',
            data: {
                labels: v_pageNameAll,
                datasets: [{
                    label: '아이디별 방문 횟수',
                    data: v_visitCountAll,
                    borderWidth: 1,
                    backgroundColor: '#5F92CF',
                    borderColor: '#5F92CF'
                }]
            },
            options: {
                responsive: true,
                scales: {
                	 y: {
                         ticks: {
                             stepSize: 1,  // y축의 값을 1씩 증가
                         }
                     }
                }
            }
        });

        let v_visitMemId = '${visitMemId}';
        let v_selectIdPageId = '${selectIdPageId}';
        let v_selectIdPageCounting = '${selectIdPageCounting}'
        v_visitMemId = v_visitMemId.replace("[", "").replace("]", "").split(",");
        v_selectIdPageCounting = v_selectIdPageCounting.replace("[", "").replace("]", "").split(",");
        v_selectIdPageId = v_selectIdPageId.replace("[", "").replace("]", "").split(",");
		console.log("asdasd")
		console.log(v_visitMemId)
		console.log(v_visitCountAll)
		console.log(v_selectIdPageCounting)
        let ctx2 = document.getElementById('myChartPage');
        let myChart2 = new Chart(ctx2, {
            type: 'bar',
            data: { 
                labels: v_selectIdPageId,
                datasets: [{
                    label: '페이지별 방문 횟수',
                    data: v_selectIdPageCounting,
                    borderWidth: 1,
                    backgroundColor: '#76BECF',
                    borderColor: '#76BECF'
                }]
            },
            options: {
                responsive: true,
                scales: {
                	 y: {
                         ticks: {
                             stepSize: 1,  // y축의 값을 1씩 증가
                         }
                     }
                }
            }
        });

        let v_memIdAll = '${logMemId}';
        v_memIdAll = v_memIdAll.replace("[", "").replace("]", "").trim().split(",");

        let v_selectElement = document.getElementById("selectId");
        let v_selectOption = document.createElement('option');
        v_selectOption = document.createElement('option');
        v_selectOption.value = 'all';
        v_selectOption.text = '전체';
        v_selectElement.appendChild(v_selectOption);
        for (let i = 0; i < v_memIdAll.length; i++) {
            v_selectOption = document.createElement('option');
            v_selectOption.value = v_memIdAll[i];
            v_selectOption.text = v_memIdAll[i];
            v_selectElement.appendChild(v_selectOption);
        }

        document.getElementById("selectId").addEventListener("change", () => {
            let v_ajax = new XMLHttpRequest();
            v_ajax.open("POST", '${pageContext.request.contextPath}/selectId');
            console.log(event.target.value);
            let v_data = "memId=" + event.target.value;
            console.log(event.target.value)

            v_ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

            v_ajax.onload = () => {
                if (v_ajax.response) {
                    let v_region = JSON.parse(v_ajax.response);
                    myChart1.data.datasets[0].label = '아이디별 방문 횟수';
                    myChart1['data']['labels'] = v_region["pageNames"];
                    myChart1['data']['datasets'][0]['data'] = v_region["visitCounts"];
                    myChart1.update();
                }
            };

            v_ajax.send(v_data);
        });

        let v_logPageName = '${logPageName}';
        console.log(v_logPageName);
        v_logPageName = v_logPageName.replace("[", "").replace("]", "").trim().split(",");

        let v_selectElementPage = document.getElementById("selectPageName");
        let v_selectOptionPage = document.createElement('option');
        v_selectOptionPage = document.createElement('option');
        v_selectOptionPage.value = 'all';
        v_selectOptionPage.text = '전체';
        v_selectElementPage.appendChild(v_selectOptionPage);
        for (let i = 0; i < v_logPageName.length; i++) {
            v_selectOptionPage = document.createElement('option');
            v_selectOptionPage.value = v_logPageName[i];
            v_selectOptionPage.text = v_logPageName[i];
            v_selectElementPage.appendChild(v_selectOptionPage);
        }

        document.getElementById("selectPageName").addEventListener("change", () => {
            let v_ajax = new XMLHttpRequest();
            v_ajax.open("POST", '${pageContext.request.contextPath}/selectPage');
            console.log(event.target.value);
            let v_data = "pageName=" + event.target.value;

            v_ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

            v_ajax.onload = () => {
                if (v_ajax.response) {
                    let v_region = JSON.parse(v_ajax.response);
                    myChart2.data.datasets[0].label = '페이지별 방문 횟수';
                    myChart2['data']['labels'] = v_region["memId"];
                    myChart2['data']['datasets'][0]['data'] = v_region["visitCounts"];
                    myChart2.update();
                }
            };

            v_ajax.send(v_data);
        });
        
        
        let v_userDate = '${userDate}'
        v_userDate = v_userDate.replace("[", "").replace("]", "").trim().split(",");
        v_userDate.reverse()
        let v_selectElementDate = document.getElementById("selectDate");
        let v_selectOptionDate;
        
        console.log(v_userDate)
        
        for (let i = 0; i < v_userDate.length; i++) {
        	v_selectOptionDate = document.createElement('option');
        	v_selectOptionDate.value = v_userDate[i];
        	v_selectOptionDate.text = v_userDate[i];
        	v_selectElementDate.appendChild(v_selectOptionDate);
        }

        let v_loginHour = '${loginHour}'
        let v_loginCount = '${loginCount}'
        
        v_loginHour = v_loginHour.replace("[", "").replace("]", "").trim().split(",");
        v_loginCount = v_loginCount.replace("[", "").replace("]", "").trim().split(",");
        
        let v_userDateChart = document.getElementById("userDateChart")
        let v_userChart = new Chart(v_userDateChart, {
            type: 'line',
            data: { 
                labels: v_loginHour,
                datasets: [{
                    label: '시간별 로그인 횟수',
                    data: v_loginCount,
                    borderWidth: 1,
                    backgroundColor: '#ffc107',
                    borderColor: '#e0a800'
                }]
            },
            options: {
                responsive: true,
                scales: {
                	x: {
                        title: {
                            display: true,   // 제목 표시 여부
                            text: '시'   // x축 제목
                        }
                    },
                	 y: {
                		 title:{
                			 display: true,   // 제목 표시 여부
                             text: '횟수',
                           	 rotation: -270   
                		 },
                		 // beginAtZero: true ,
                         ticks: {
                             stepSize: 1  // y축의 값을 1씩 증가
                         }
                     }
                }
            }
        });
        
        document.getElementById("selectDate").addEventListener("change", () => {
            let v_ajax = new XMLHttpRequest();
            v_ajax.open("POST", '${pageContext.request.contextPath}/selectDate');
            console.log(event.target.value);
            let v_data = "userDate=" + event.target.value;

            v_ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

            v_ajax.onload = () => {
                if (v_ajax.response) {
                    let v_region = JSON.parse(v_ajax.response);
                    v_userChart.data.datasets[0].label = '페이지별 방문 횟수';
                    v_userChart['data']['labels'] = v_region["userHour"];
                    v_userChart['data']['datasets'][0]['data'] = v_region["userCount"];
                    v_userChart.update();
                }
            };

            v_ajax.send(v_data);
        });
        
        let v_allLoginHour = '${allLoginHour}'
        let v_allLoginCount = '${allLoginCount}'
        
        
        v_allLoginHour = v_allLoginHour.replace("[", "").replace("]", "").trim().split(",");
        v_allLoginCount = v_allLoginCount.replace("[", "").replace("]", "").trim().split(",");
        console.log(v_allLoginHour)
        
        let v_allUserDateChart = document.getElementById("allUserDateChart")
        let v_allUserChart = new Chart(v_allUserDateChart, {
            type: 'line',
            data: { 
                labels: v_allLoginHour,
                datasets: [{
                    label: '로그인 횟수',
                    data: v_allLoginCount,
                    borderWidth: 1,
                    backgroundColor: '#ffc107',
                    borderColor: '#e0a800'
                }]
            },
            options: {
                responsive: true,
                scales: {
                	x: {
                        title: {
                            display: true,   // 제목 표시 여부
                            text: '시'   // x축 제목
                        }
                    },
                	 y: {
                		 title:{
                			 display: true,   // 제목 표시 여부
                             text: '횟수',
                           	    
                		 },
                		 // beginAtZero: true ,
                         ticks: {
                             stepSize: 1  // y축의 값을 1씩 증가
                         }
                     }
                }
            }
        });
        
    </script>

</body>

</html>
