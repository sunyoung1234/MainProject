<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content />
<meta name="author" content />
<title>전기 사용량</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Custom Google font-->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@100;200;300;400;500;600;700;800;900&amp;display=swap"
	rel="stylesheet" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->

<link href="css/styles.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.6.2/cropper.min.css" integrity="sha512-UtLOu9C7NuThQhuXXrGwx9Jb/z9zPQJctuAgNUBK3Z6kkSYT9wJ+2+dh6klS+TDBCV9kNPBbAxbVD+vCcfGPaA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<style type="text/css">
    .main-height{
        width: 1300px;
        margin: auto;
        margin-top: 50px;
        margin-bottom: 50px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 테이블에 그림자 추가 */
	    border-radius: 8px; /* 테이블 둥근 모서리 */
        
    }
    
    .elecImgBox{
    	width:1500px;
    }
    
    .elecImg{
    	width:100%;
    	height:100%
    }
    
    .memInfo{
    	display:flex;
    	justify-content:center;
    	margin-right:180px;
    	margin-top:30px;
    	
    }
    
    .info-item-box{
    	display: flex;
    	margin-left:50px;
    	
    }
    
    .info-item2{
    	position:relative;
    	top:40px;
    	margin-left:20px;
    	width:400px;
    	display:flex;
    	justify-content:center;
    	font-size:20px;
    	padding: 5px;
    }
    
    .info-car{
    	color:  #007bff;
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
	
	.get-btn-box{
		display: flex;
		justify-content: end;
		margin-right: 100px;
		padding: 10px;
	}
    
    .get-btn{
    	background-color: #91B4D4;
    	border: 1px solid #91B4D4;
    	border-radius: 5px;
    	color : white;
    }
    
    #chart-container{
    	width:80%;
    	box-shadow: 0 2px 10px rgba(0,0,0,0.1);
	    border-radius: 8px; /* 테이블 둥근 모서리 */
	    margin-left:60px;
	    margin-right:30px;
	    margin-bottom:30px;
	    padding-right:30px;
	    padding-bottom:30px;
	    padding-top: 30px;
	    border: 1px solid #CED41F;
    }  
    
    #myChart{
    	width:100%; 
    	margin-left: 20px;
    	margin-bottom: 20px;
    }
    
    .elecUse-explain{
    	font-size:15px;
    	margin-left: 50px; 
    	 box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 테이블에 그림자 추가 */
	    border-radius: 8px; /* 테이블 둥근 모서리 */
	    padding: 20px;
	    border: 1px solid #ED4941;
    } 
    
    .elecUse-title{
    	display: flex;
    	justify-content: center;
    	font-weight: bold;
    	font-size:20px;
    	color: #ED4941;
    	padding-right: 20px;
    }
    
    .elec-chart-title {
	    position: relative;
	    top: 20px;
	    left:35%;
	    font-size: 18px;
	    font-weight: bold; 
	    margin-left:20px;
	    background-color: #B8D498;
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
    
</style>

</head>
<body class="d-flex flex-column">

	<%@ include file="/WEB-INF/inc/top.jsp"%>
	<%@ include file="/WEB-INF/inc/subnavbarMy.jsp"%>
	
	<div id="loading" style="display: none;">
	  <div class="spinner"></div>
	  <p>데이터를 처리 중입니다. 잠시만 기다려주세요...(최대 1분 소요)</p>
	</div>

	<div class="main-height">
		
		<div class="elecImgBox">
			<div class="info-container">
				<div class="memInfo">
					<div class="elecUse-explain">
						<div class="elecUse-title">주의사항</div>
						<br>※ 건물 주소에 따른 전기 사용량을 그래프로 나타낸 페이지입니다.
						<br>※ 전기 사용량 예측값 불러오기를 통해 3개월치의 전기 사용량 예측값을 확인할 수 있습니다.
						<br>※ 그래프가 정확하지 않을 시 예측값 불러오기를 한번 더 눌러주시기 바랍니다.
						<br>※ 전기 사용량이 규칙적이지 않거나 없는 경우 예측값이 정확하지 않을 수 있습니다.
					</div>
				</div>
				
				
			</div>
			
			<div class="elec-chart-title">전기 사용량 및 예측량</div>
			<div id="chart-container">
				<div class="info-item2">
					<i class="info-car bi-house-door"></i>
					<span>주소 : ${member1.getJibunAddress() }</span>
				</div>
				<form action="${pageContext.request.contextPath}/updateModel" method="post" onsubmit="showLoading()">
					<div class="get-btn-box">
						<button class="get-btn" id="updateBtn" type="submit">전기 사용량 예측값 불러오기</button>
					</div>
				</form>
				<canvas id="myChart"></canvas>
			</div>
			
		</div>
	</div>
	<c:if test="${sessionScope.login.memId != 'admin' }">
	    <%@ include file="/WEB-INF/inc/chatbotbot.jsp"%>
	</c:if>

	<%@ include file="/WEB-INF/inc/footer.jsp" %>

	<!-- Bootstrap core JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-zoom@1.0.0/dist/chartjs-plugin-zoom.min.js"></script>
	<script type="text/javascript">
		function showLoading() {
	        document.getElementById('loading').style.display = 'flex';
	    }
		
		let v_elecUse = '${elecUse}'
		let v_useDate = '${useDate}'
		
		let v_predDate = '${predDates}'
		let v_predUse = '${predUse}'
		
		let v_nextThreeMonths = '${nextThreeMonths}'
		
		let v_predUse1 = '${predUse}'
		
		let v_predData = '${predUseData}'
		
		console.log(v_predData)
		 
		
		v_elecUse = v_elecUse.replace('[','')
		v_elecUse = v_elecUse.replace(']','')
		
		v_useDate = v_useDate.replace('[','')
		v_useDate = v_useDate.replace(']','')
		
		v_predUse = v_predUse.replace(']','')
		v_predUse = v_predUse.replace('[','')
		
		v_predUse1 = v_predUse1.replace(']','')
		v_predUse1 = v_predUse1.replace('[','')
		
		v_predDate = v_predDate.replace(']','')
		v_predDate = v_predDate.replace('[','')
		
		v_nextThreeMonths = v_nextThreeMonths.replace(']','')
		v_nextThreeMonths = v_nextThreeMonths.replace('[','')
		
		v_predData = v_predData.replace(']','')
		v_predData = v_predData.replace('[','')

		v_elecUse = v_elecUse.split(',')
		v_useDate = v_useDate.split(',')
		v_predUse = v_predUse.split(',')
		v_predDate = v_predDate.split(',')
		v_nextThreeMonths = v_nextThreeMonths.split(',')
		v_predUse1 = v_predUse1.split(',')
		v_predData = v_predData.split(',')
		
		let combinedUse = [...v_elecUse];
		
		let savePredUse = []
		savePredUse.push(v_predUse1[1])

		// v_predUse 값을 v_elecUse 배열에 순서대로 추가
		for (let i = 0; i < v_predUse.length; i++) {
		    combinedUse.push(v_predUse[i]);
		}
		
		for (let i = 0; i < v_elecUse.length - 1; i++) {
		    v_predUse.unshift(null); // unshift는 배열의 앞에 요소를 추가
		}
		
		if(v_predUse[v_elecUse.length] == undefined){
			v_predUse[v_elecUse.length-1] = v_elecUse[v_elecUse.length-1]
		}
		
		
		let ctx = document.getElementById('myChart')
		
		let v_chart = new Chart(ctx, {
		    type: 'line',
		    data: {
		      labels: v_predDate,
		      datasets: [{
		        label: '사용량 데이터',
		        data: v_elecUse,
		        borderColor: 'rgba(75, 192, 192, 1)',  // 첫 번째 선의 색상
		        backgroundColor: 'rgba(75, 192, 192, 0)',  // 선만 표시 (채우지 않음)
		        borderWidth: 1,
		        fill: false
		      },{
			        label: '3개월 예측량 데이터',
			        data: v_predUse,
			        borderColor: 'red',  // 첫 번째 선의 색상
			        backgroundColor: 'rgba(75, 192, 192, 0)',  // 선만 표시 (채우지 않음)
			        borderWidth: 1,
			        fill: false
			      },{
				        label: '예측값',
				        data: v_predData,
				        borderColor: 'red',  // 첫 번째 선의 색상
				        backgroundColor: 'rgba(75, 192, 192, 0)',  // 선만 표시 (채우지 않음)
				        borderWidth: 1,
				        fill: false,
				        pointStyle: 'circle',  // 점 모양 설정 (기본값은 'circle')
				        pointRadius: 5,  // 점 크기 조정
				        pointBackgroundColor: 'blue',  // 점 색상 설정
				        borderColor: 'transparent',  // 선을 숨기기 위한 설정 (선 색상 투명)
				        fill: false  // 선을 채우지 않음
				      }]
		    },
		    options: {
		        responsive: true,
		        plugins: {
		          legend: {
		            labels: {
		              generateLabels: function(chart) {
		                let original = Chart.defaults.plugins.legend.labels.generateLabels(chart);
		                // '예측량 데이터2'의 범례만 점 모양으로 변경
		                original.forEach(function(label) {
		                  if (label.datasetIndex === 2) {
		                    label.pointStyle = 'circle';  // 점 모양 설정
		                    label.strokeStyle = 'blue';  // 점 테두리 색상 설정
		                  }
		                });
		                return original;
		              }
		            }
		          }
		        }
		      }
		    });
		
		
		
	
	</script>

</body>
</html>
