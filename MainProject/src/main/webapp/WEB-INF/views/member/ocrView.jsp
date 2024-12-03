<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content />
<meta name="author" content />
<title>계량기 사진 첨부</title>
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
        margin: auto;
        margin-top: 50px;
        margin-bottom: 50px;
        display: flex; 
         box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 테이블에 그림자 추가 */
	    border-radius: 8px; /* 테이블 둥근 모서리 */
    }
    
    .ocr-box{
    	margin-top: 100px;
    	margin-left: 100px;
    }
    
    .ocr-title{
    	font-size: 24px;
	    color: #333;
	    margin-bottom: 20px;
	    border-bottom: 2px solid #04b89f;
	    padding-bottom: 10px;
	    font-weight: bold;
    	
    }
    
    .inputBox{
    	border: 1px solid black;
    }
    
    .ocr-button-box{
    	display: flex;
    	margin-top:20px;
    } 
    
    

    .img-container {
        text-align: center;
        margin-top: 20px;
        overflow: hidden;
        width:90%;
        height:200px;
    }
    
    .img-container2 {
        text-align: center;
        margin-top: 20px;
        overflow: hidden;
        width:200px;
        height:150px;
    }

    #showImg {
        width:100%;
        height:100%;
    }

    #croppedImg {
        max-width: 100%;
        margin-top: 20px;
        border: 1px solid #ccc;
        display: block;
    }
    
    .ocr-result{
    	margin-top:20px;
    	color: #80B95F;
    	font-weight:bold;
    	font-size:20px;
    }
    
    
    .ocr-content {
    	flex: 1.5;
    	margin-left: 150px;
    	margin-top: 120px;  
	}
	
	.ocr-content table {
	    width: 95%; 
	    border-collapse: collapse;
	    margin-top: 30px;
	    background: #fafafa;
	    border-radius: 12px;
	    overflow: hidden;
	}
	
	.ocr-content th,
	.ocr-content td {
	    padding: 20px;
	    text-align: center;
	    font-size: 16px; 
	    border-bottom: 1px solid #ddd;
	}
	
	.ocr-content th {
	    background: #04b89f;
	    color: white;
	    font-weight: bold;
	    font-size: 18px;
	}
	
	.ocr-content td:last-child {
	    font-weight: bold;
	    color: #333;
	}
    
    
    #uploadImg{
    	background-color: #198754;
    	color: white;
    	border: 1px solid #198754;
    	border-radius: 3px;
    }
    
    .ocr-text{
    	width:385px;
    
    }
    
    .checkBox{
    	margin-left: 20px;
    	
    }
    
    #checkBtn{
    	background-color: #80B95F;
    	color:white;
    	width:80px;
    	border: 1px solid #80B95F;
    	border-radius: 5px;
    }
    
    .finalBox{
    	margin-top:30px;
    }
    
    .resultText{
    	margin-top:20px;
    	margin-bottom: 20px; 
    }
    
    .finalBox{
    	background-color: skyblue;
    	color:white;
    	border: 1px solid skyblue;
    	width:150px;
    }
    
    .saveCroppedBox{
    	margin-top: 20px;
    }
    
    .fast-link-box{
    	margin-top: 20px;
    	width:250px;
    	text-align: center;
    	background-color: #04b89f;
    	border-radius: 5px;
    	
    }
    
    .fast-link{
    	text-decoration: none;
    	color : white;
    }
    
    .myChart-box{
    	margin-top: 70px;
    	width:95%;
    }
    
    .explain{
    	margin-top: 15px;
    }
    
    .title-explain{
    	font-size: 12px; 
    }
    
    .product-elec{
    	color:blue;
    }
    
    .product-elec:hover{
    	cursor: pointer;
    	color: red;
    }
    
    .login-count-title {
		    position: relative;
		    top: 70px;  
		    font-size: 18px;
		    font-weight: bold; 
		    margin-left:850px; 
		    background-color: #D9D578;
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
		
		.elec-title{
			display: flex;
			justify-content: center;
			margin-top:50px;
		}
    
</style>

</head>
<body class="d-flex flex-column">

	<%@ include file="/WEB-INF/inc/top.jsp"%>
	<%@ include file="/WEB-INF/inc/subnavbarBoard.jsp"%>
	
	<h1 class="elec-title">전기 사용량 기입</h1>
	<!-- <div class="login-count-title">전기 사용량 기입</div>	  -->
	<div class="main-height">
		<div class="ocr-box">
			<div class="ocr-title">계량기 사진 첨부 <br><span class="title-explain">※ 예측값이 안 나올 시 우측 하단 버튼 클릭하여 예측값을 불러와주시기 바랍니다.</span></div>
			<div>
				<div class="inputBox">
					<input id="inputImg" type="file" accept="image/*">
				</div>
				<div class="img-container">
					<img id="showImg" alt="숫자 부분만 잘라 저장해주세요" src="https://cdn-icons-png.flaticon.com/512/4481/4481168.png">
				</div>
				<div class="explain">
					<span>※ 사진 내 박스를 조정하여 숫자만 잘라주시기 바랍니다.</span>
					<span><br>※ 사진 내 마우스 휠로 사진의 크기를 조정할 수 있습니다.</span>
				</div>
			</div>
			<div class="saveCroppedBox">
				<button id="saveCroppedImage" class="btn btn-primary">자른 이미지 저장</button>
			</div>
			<!-- 자른 이미지를 보여줄 부분 -->
			<div class="img-container2">
				<img id="croppedImg" src="" >
			</div>
			<button id="uploadImg">이미지 보내기</button>
			
			<div class="ocr-result">
				전기 사용량 : 
			</div>
			<div class="ocr-button-box">
				<div class="ocr-text">
					입력값이 맞다면 확인 클릭 아니면 다시 전송해주세요
				</div>
				<div class="checkBox"><button id="checkBtn">확인</button></div>
			</div>
		</div>
		<div class="ocr-content">
			<table class="ocr-table">
				<colgroup>
					<col width="25%">
					<col width="35%">
					<col width="35%">
				</colgroup>
				<thead>
					<tr>
						<th>분류</th>
						<th id="lastMonth"></th>
						<th id="thisMonth"></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>전기 사용량</th>
						<td>${electricityUse.getElectricityUse() }</td>
						<td id="elecUse"></td>
					</tr>
					<tr>
						<th>탄소 배출량</th>
						<td id="gasResult1"></td>
						<td id="gasResult2"></td>
					</tr>
				</tbody>
			</table>
			<div class="myChart-box">
				<canvas id="myChart"></canvas>
			</div>
			<div class="resultText">
				
			</div>
			<button class="finalBox" type="submit" disabled>데이터 전송</button>
			<div class="fast-link-box">
				<a class="fast-link" href="${pageContext.request.contextPath }/electricityUseView">전기 사용량 및 예측값 보러가기</a>
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.6.2/cropper.min.js" integrity="sha512-JyCZjCOZoyeQZSd5+YEAcFgz2fowJ1F1hyJOXgtKu4llIa0KneLcidn5bwfutiehUTiOuK87A986BZJMko0eWQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

	<script type="text/javascript">
        let cropper; // Cropper 객체 선언

        // 이미지 파일을 선택하고 미리보기 이미지를 설정
        document.getElementById("inputImg").addEventListener('change', function () {
            let inputImg = document.getElementById("inputImg").files[0];
            let fileURL = URL.createObjectURL(inputImg);
            let imageElement = document.getElementById("showImg");

            // 이미지 설정
            imageElement.src = fileURL;

            // 이미지 로드 후 cropper.js 초기화
            imageElement.onload = function () {
                if (cropper) {
                    cropper.destroy(); // 이전 cropper를 파괴하고 새로 초기화
                }

                // 새로운 cropper 인스턴스 생성
                cropper = new Cropper(imageElement, {
                    aspectRatio: 'free', // 비율 설정 (원하는 비율로 변경 가능)
                    viewMode: 1,         // 이미지 크기 조정 모드 (1은 자르기 영역 제한)
                    autoCropArea: 0.5,   // 초기 크기 비율 설정 (50%)
                    responsive: true,    // 화면 크기에 맞춰 조정
                    zoomable: true,      // 이미지 확대/축소 가능
                    movable: true,       // 이미지 이동 가능
                });
            };
        });

        // 자른 이미지를 저장하는 버튼 클릭 이벤트
        document.getElementById("saveCroppedImage").addEventListener('click', ()=> {
            if (cropper) {
                // 자른 이미지 데이터 얻기 (base64)
                let canvas = cropper.getCroppedCanvas();
                let croppedImage = canvas.toDataURL("image/png"); // PNG 포맷으로 변환
                
                // 자른 이미지를 미리보기로 보여주기
                document.getElementById("croppedImg").src = croppedImage;

            }
        });
        
        let v_use = '${monthUse}'
        
        let v_elecUse;
        
        document.getElementById("uploadImg").addEventListener('click', ()=> {
            if (cropper) {
                // 자른 이미지 데이터 얻기 (base64)
                let canvas = cropper.getCroppedCanvas();
                let croppedImage = canvas.toDataURL("image/png"); // PNG 포맷으로 변환
                
                let v_ajax = new XMLHttpRequest();
                v_ajax.open("POST", "${pageContext.request.contextPath}/uploadImage");
                v_ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                let v_data = "image=" + encodeURIComponent(croppedImage);
                console.log(v_data)

                // 요청이 완료되었을 때 처리할 코드
                v_ajax.onload = function () {
                    if (v_ajax.status === 200) {
                        console.log("서버 응답:", v_ajax.responseText);
                        alert("이미지 업로드 성공!");
                        document.querySelector('.ocr-result').innerHTML = '전기 사용량 : ' + v_ajax.responseText
                        v_elecUse = v_ajax.responseText
                       
                    } else {
                        console.error("이미지 전송 실패:", v_ajax.status, v_ajax.statusText);
                        alert("이미지 업로드 실패.");
                    }
                };

                v_ajax.send(v_data);
            }
            
            
        });
        
        
        
        
        date = new Date();
        
        month = date.getMonth() + 1;
        lastMonth = month - 1
        if(month>12){
        	month = 1
        	lastMonth = 12  
        }
        
        if(lastMonth<1){
        	lastMonth = 12
        }
        let v_predictDate = '${predictDate}';
        let v_predictDateGas
        let v_elecDate = '${elecDate}';
        v_predictDate = parseFloat(v_predictDate);  // 숫자로 변환
        v_predictDateGas = v_predictDate * 0.424;
        console.log(v_elecDate)
        let v_monthLast = '${electricityUse.getElectricityUse()} '
        console.log(v_monthLast)
        let ctx = document.getElementById("myChart")
        
        let myChart = new Chart(ctx,{
        	type:'line',
        	data:{
        		labels:[lastMonth+'월', month+'월'],
        		datasets:[{
        			label:'전기 사용량',
        			data:[v_monthLast,null],
        			borderColor: 'rgba(75, 192, 192, 1)',  // 첫 번째 선의 색상
    		        backgroundColor: 'rgba(75, 192, 192, 0)',  // 선만 표시 (채우지 않음)
    		        borderWidth: 1,
    		        fill: false
        		},{
        			label:'전기 사용량 예측값',
            		data:[null,v_predictDate],
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
		    	x: {
		        ticks: {
		            stepSize: 0.5 // 라벨 간격 설정
		        }
		    },
		        responsive: true,
		        plugins: {
		          legend: {
		            labels: {
		              generateLabels: function(chart) {
		                let original = Chart.defaults.plugins.legend.labels.generateLabels(chart);
		                // '예측량 데이터2'의 범례만 점 모양으로 변경
		                original.forEach(function(label) {
		                  if (label.datasetIndex === 1) {
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
        })
        
        let v_predUseOneMonth = '${predUseOneMonth}'
        
	     if (!v_elecDate) {
	         v_predictDate = '${predictDate}';  // 서버에서 전달된 예측값
	         v_predictDate = parseFloat(v_predictDate);  // 숫자로 변환
	         v_predictDateGas = v_predictDate * 0.424;
	
	         document.getElementById("elecUse").innerHTML = Math.round(v_predictDate * 100) / 100;
	         document.getElementById("gasResult2").innerHTML = Math.round(v_predictDateGas * 100) / 100;
	
	         document.getElementById("lastMonth").innerHTML = lastMonth + "월";
	         document.getElementById("thisMonth").innerHTML = month + "월 예측값";
	         
	         let lastMonthUse = '${electricityUse.getElectricityUse() }'
             let gasResult = '${electricityUse.getElectricityUse() }'*0.424
	             
             document.getElementById("gasResult1").innerHTML = Math.round(gasResult*100) / 100
             
             document.getElementById("checkBtn").addEventListener("click", ()=>{
             	
             	document.getElementById("thisMonth").innerHTML = month + "월";
             	document.querySelector(".finalBox").disabled = false;
             	document.getElementById("elecUse").innerHTML = v_elecUse
             	let v_result2 = v_elecUse * 0.424
             	document.getElementById("gasResult2").innerHTML = Math.round(v_result2*100) / 100
             	
             	if(v_predictDate < v_elecUse){
                 	document.querySelector('.resultText').innerHTML =  month + '월 예측값 ' + Math.round(v_predictDate*100) / 100 + ' 보다 많이 사용하였습니다.'    
                 }else{
                 	document.querySelector('.resultText').innerHTML =  month + '월 예측값 ' + Math.round(v_predictDate*100) / 100 + ' 보다 적게 사용하였습니다.'    
                 }
             	
             	myChart['data']['datasets'][0]['data'] = [v_monthLast, v_elecUse]
             	myChart.update()
             })
	     }else{
	    	 v_predictDate = '${predictDate}';  // 서버에서 전달된 예측값
	         v_predictDate = parseFloat(v_predictDate);  // 숫자로 변환
	         v_predUseOneMonth = parseFloat(v_predUseOneMonth)
	         v_predictDateGas = v_predictDate * 0.424;
	    	 let v_elecDateGas = v_elecDate * 0.424;
	    	 document.getElementById("elecUse").innerHTML = v_elecDate
	         document.getElementById("gasResult2").innerHTML = Math.round(v_elecDateGas * 100) / 100;
	
	         document.getElementById("lastMonth").innerHTML = lastMonth + "월";
	         document.getElementById("thisMonth").innerHTML = month + "월";
	         
	         let lastMonthUse = '${electricityUse.getElectricityUse() }'
             let gasResult = '${electricityUse.getElectricityUse() }'*0.424
	             
             document.getElementById("gasResult1").innerHTML = Math.round(gasResult*100) / 100
             console.log( myChart['data']['datasets'][0].data)
             console.log(v_elecUse)
             myChart['data']['datasets'][0]['data'] = [v_monthLast, v_elecDate]
             myChart['data']['datasets'][1]['data'] = [null, v_predUseOneMonth]
             console.log(v_predUseOneMonth)
          	 myChart.update()
           	console.log( myChart['data']['datasets'][0].data)
             if(v_predUseOneMonth < v_elecDate){
              	document.querySelector('.resultText').innerHTML =  month + '월 예측값 ' + Math.round(v_predUseOneMonth*100) / 100 + ' 보다 많이 사용하였습니다.'
              	document.querySelector('.resultText').innerHTML += '<br><a class="product-elec" href="${pageContext.request.contextPath}/productView">에너지 효율 등급 높은 제품 사용을 추천합니다.</a>'
              }else{
              	document.querySelector('.resultText').innerHTML =  month + '월 예측값 ' + Math.round(v_predUseOneMonth*100) / 100 + ' 보다 적게 사용하였습니다.'    
              }
             
             
	     }

		
        
        
        
        document.querySelector(".finalBox").addEventListener("click", ()=>{
        	 let v_ajax = new XMLHttpRequest();
             v_ajax.open("POST", "${pageContext.request.contextPath}/ocrInsert");
             v_ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

             let v_data = "electricityUse=" + v_elecUse;
          
             
             v_ajax.onload = function () {
                 if (v_ajax.status === 200) {
                     console.log("서버 응답:", v_ajax.responseText);
                     alert("데이터 전송 완료");
                    
                 } else {
                     console.error("이미지 전송 실패:", v_ajax.status, v_ajax.statusText);
                 }
             };

             v_ajax.send(v_data);
             
             
        })
        
        
        
        	
        
        
        
        
	</script>

</body>
</html>
