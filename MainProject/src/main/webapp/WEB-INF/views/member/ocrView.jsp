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
<title>마이 페이지</title>
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
    
    .ocr-box{
    	margin-top: 100px;
    	margin-left: 100px;
    }
    
    .ocr-title{
    	margin-bottom:20px;
    	font-weight:bold;
    	font-size:20px;
    	
    }
    
    .inputBox{
    	border: 1px solid black;
    }
    
    .ocr-button-box{
    	display: flex;
    	margin-top:50px;
    }
    
    

    .img-container {
        text-align: center;
        margin-top: 20px;
        overflow: hidden;
        width:300px;
        height:200px;
    }
    
    .img-container2 {
        text-align: center;
        margin-top: 20px;
        overflow: hidden;
        width:190px;
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
    
    
    .ocr-content{
    	margin-left:200px;
    	margin-top: 100px;
    	width:500px;
    	height:500px;
    }
    
    .ocr-table{
    	border-collapse: separate;
   		border-spacing: 30px 70px;
   		width: 100%;
	    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 테이블에 그림자 추가 */
	    border-radius: 8px; /* 테이블 둥근 모서리 */
    }
    
    
    #uploadImg{
    	background-color: #198754;
    	color: white;
    	border: 1px solid #198754;
    	border-radius: 3px;
    }
    
    .ocr-text{
    	width:350px;
    
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
    	margin-top:150px;
    }
    
    .resultText{
    	margin-top:100px;
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
    
</style>

</head>
<body class="d-flex flex-column">

	<%@ include file="/WEB-INF/inc/top.jsp"%>

	<div class="main-height">
		<div class="ocr-box">
			<div class="ocr-title">계량기 사진 첨부</div>
			<div>
				<div class="inputBox">
					<input id="inputImg" type="file" accept="image/*">
				</div>
				<div class="img-container">
					<img id="showImg" alt="숫자 부분만 잘라 저장해주세요">
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
					입력값이 맞다면 버튼 클릭 아니면 다시 전송
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
			<div class="resultText">
				
			</div>
			<button class="finalBox" type="submit" disabled>최종 확인</button>
		</div>
	</div>
	

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
        let v_predictDate
        let v_predictDateGas
        let v_elecDate = '${elecDate}';
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
             })
	     }else{
	    	 
	    	 let v_elecDateGas = v_elecDate * 0.424;
	    	 document.getElementById("elecUse").innerHTML = v_elecDate
	         document.getElementById("gasResult2").innerHTML = Math.round(v_elecDateGas * 100) / 100;
	
	         document.getElementById("lastMonth").innerHTML = lastMonth + "월";
	         document.getElementById("thisMonth").innerHTML = month + "월";
	         
	         let lastMonthUse = '${electricityUse.getElectricityUse() }'
             let gasResult = '${electricityUse.getElectricityUse() }'*0.424
	             
             document.getElementById("gasResult1").innerHTML = Math.round(gasResult*100) / 100
             	
           	
           	if(lastMonthUse < v_elecDate){
               	document.querySelector('.resultText').innerHTML =  lastMonth + '월  ' + Math.round(lastMonthUse * 100) / 100 + ' 보다 많이 사용하였습니다.'    
               }else{
               	document.querySelector('.resultText').innerHTML =  lastMonth + '월  ' + Math.round(lastMonthUse * 100) / 100 + ' 보다 적게 사용하였습니다.'    
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
