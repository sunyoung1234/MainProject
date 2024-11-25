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
<title>전기 사용량 입력</title>
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
	.container {
            margin-top: 50px;
        }

        h2 {
            margin-bottom: 30px;
            font-size: 1.5rem;
            font-weight: bold;
            text-align: center;
            color: #4a90e2;
        }
        
        #electricity-inputs{
        	margin-top:50px;
        }
        
        .input-box{
        	margin-bottom:10px;
        }

        .input-group {
            margin-bottom: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .input-group label {
            width: 200px;
            font-size: 1rem;
            font-weight: 600;
            color: #333;
        }

        .input-group input {
            width: 250px;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
        }

        .input-group input[type="number"] {
            width: 200px;
        }

        button {
            background-color: #4a90e2;
            color: #fff;
            padding: 10px 20px;
            font-size: 1rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            background-color: #357ab7;
        }
    </style>
</style>

</head>
<body class="d-flex flex-column">

	<%@ include file="/WEB-INF/inc/top.jsp"%>
	<div class="container">
	    <h2>전기 사용량 입력 (최근 1년간)</h2>
	    <form id="electricity-form" action="${pageContext.request.contextPath }/saveElec" method="POST">
	      <div id="electricity-inputs">
	        <!-- 월별 전기 사용량 입력 폼이 여기에 추가됩니다. -->
	      </div>
	      <button type="submit">제출</button>
	    </form>
  </div>

	<%@ include file="/WEB-INF/inc/footer.jsp" %>

	<!-- Bootstrap core JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-zoom@1.0.0/dist/chartjs-plugin-zoom.min.js"></script>
	<script type="text/javascript">

    // 12개월 날짜 생성 함수
    function getLast12Months() {
        var months = [];
        var currentDate = new Date();

        // 지난 12개월의 월을 YYYY-MM 형식으로 구하기
        for (var i = 1; i < 15; i++) {
            var month = new Date(currentDate.getFullYear(), currentDate.getMonth() - i, 1);
            var yearMonth = month.getFullYear() + '-' + (month.getMonth() + 1).toString().padStart(2, '0');
            months.push(yearMonth);
        }

        return months;  // reverse() 사용하지 않고 순서대로 반환
    }

    // 전기 사용량 입력 폼 생성
    function generateInputFields() {
        var months = getLast12Months();
        console.log(months)
        let v_ei = document.getElementById("electricity-inputs")

        for(let i = 0; i < months.length; i++){
        	 let v_input = '<div class="input-box">'+ months[i]  +' 전기 사용량 (kWh): ';
             v_input += '<input type="number" name="electricityUse[]">';
             v_input += '<input hidden name="months[]" value='+ months[i]  +'>';
             v_input += '</div>';
             v_ei.innerHTML += v_input ;
        }
        
       
        
    }


    // 페이지 로드 시 입력 필드 생성
    generateInputFields();


	</script>

</body>
</html>
