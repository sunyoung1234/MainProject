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
            max-width: 1300px;
            margin: 50px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .page-count-all {
    		width:600px;
    		height:400px;    
    		margin-bottom: 10px; 
        }
 
        .page-count-box {
            display: flex;
            justify-content: space-between;
            gap: 20px;
            margin-bottom: 40px;
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
        	width:100%;
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
        


    </style>
</head>

<body class="d-flex flex-column">

    <%@ include file="/WEB-INF/inc/top.jsp"%>

    <div class="main-height">
    	<h2>이용자 방문 현황</h2>
        <!-- 전체 페이지 방문 횟수 차트 -->
        <div class="page-count-all">
        	<h4 class="page-count-all-h2">페이지 방문 횟수 총합</h4>
            <canvas id="myChart"></canvas>
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

        <!-- 사용자 접속 시간 -->
        <div>
            <canvas id="myChartTime"></canvas>
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
        v_visitCountAll = v_visitCountAll.replace("[", "").replace("]", "").split(",");

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
                    backgroundColor: '#007bff',
                    borderColor: '#0056b3'
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
                    backgroundColor: '#28a745',
                    borderColor: '#218838'
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
        v_visitMemId = v_visitMemId.replace("[", "").replace("]", "").split(",");

        let ctx2 = document.getElementById('myChartPage');
        let myChart2 = new Chart(ctx2, {
            type: 'bar',
            data: {
                labels: v_visitMemId,
                datasets: [{
                    label: '페이지별 방문 횟수',
                    data: v_visitCountAll,
                    borderWidth: 1,
                    backgroundColor: '#ffc107',
                    borderColor: '#e0a800'
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
    </script>

</body>

</html>
