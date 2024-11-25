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
        height: 900px;
        width: 1300px;
        border: 1px solid black;
        margin: auto;
        margin-top: 50px;
        margin-bottom: 50px;
        
        display: flex;
    }
    
    .elecImgBox{
    	width:1500px;
    	height:600px;
    }
    
    .elecImg{
    	width:100%;
    	height:100%
    }
    
    .memInfo{
    	margin-left:100px;
    	
    }
    
    .info-item-box{
    	display: flex;
    	
    }
    
    .info-item2{
    	margin-left:20px;
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
		
	}
    
    .get-btn{
    	background-color: #28A745;
    	border: 1px solid #28A745;
    	border-radius: 5px;
    	color : white;
    }
    
    #chart-container{
    	margin-top :50px;
    }
    
</style>

</head>
<body class="d-flex flex-column">

	<%@ include file="/WEB-INF/inc/top.jsp"%>
	
	<div id="loading" style="display: none;">
	  <div class="spinner"></div>
	  <p>데이터를 처리 중입니다. 잠시만 기다려주세요...(최대 1분 소요)</p>
	</div>

	<div class="main-height">
		<div class="elecImgBox">
			<div class="memInfo">
				<h2>회원정보</h2>
				<div class="info-item-box">
					<div class="info-item">
						<i class="info-car bi-person-circle"></i>
						<span>닉네임 : ${member1.getMemName() }</span>
					</div>
					<div class="info-item2">
						<i class="info-car bi-house-door"></i>
						<span>주소 : ${member1.getJibunAddress() }</span>
					</div>
				</div>
				
			</div>
			
			
			
			<div id="chart-container">
				<form action="${pageContext.request.contextPath}/updateModel" method="post" onsubmit="showLoading()">
					<div class="get-btn-box">
						<button class="get-btn" id="updateBtn" type="submit">전기 사용량 예측값 불러오기</button>
					</div>
				</form>
				<canvas id="myChart"></canvas>
			</div>
			
		</div>
	</div>
	

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
		
		
		console.log(v_elecUse)
		console.log(v_useDate)
		console.log(v_predUse)
		console.log(v_predDate)
		console.log(v_nextThreeMonths)
		console.log(typeof(v_elecUse))
		console.log(typeof(v_useDate))
		console.log(typeof(v_predUse))
		console.log(typeof(v_predDate))
		
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
		
		
		console.log(combinedUse)
		
		
		
		// 결과 출력
		console.log(v_useDate);
		console.log(v_elecUse.length)
		console.log(v_predUse[v_elecUse.length])
		
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
			        label: '예측량 데이터',
			        data: v_predUse,
			        borderColor: 'red',  // 첫 번째 선의 색상
			        backgroundColor: 'rgba(75, 192, 192, 0)',  // 선만 표시 (채우지 않음)
			        borderWidth: 1,
			        fill: false
			      },{
				        label: '예측량 데이터2',
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
