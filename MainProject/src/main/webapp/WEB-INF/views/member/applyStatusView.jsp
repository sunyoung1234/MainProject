<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZEB 신청 현황</title>

<link href="css/styles.css" rel="stylesheet" />

<style type="text/css">
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }
        h1 {
        	padding-top: 50px;
            text-align: center;
            color: #333;
            font-size: 2.5rem;
        }
        .container1 {
            width: 80%;
            margin: 0 auto;
            margin-top: 20px;
            margin-left: 30px;
            margin-right: 30px; 
            border: 2px solid orange;  
        }
        .form-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        .form-container form {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
        }
        .form-container label {
            font-weight: bold;
            margin-right: 10px;
        }
        .form-container input,
        .form-container select,
        .form-container button {
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1rem;
        }
        .form-container input{
        	width: 250px;
        }
        
        .form-container button {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        .form-container button:hover {
            background-color: #45a049; 
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
            font-weight: bold;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        footer {
            margin-top: 50px;
            text-align: center;
            padding: 10px 0;
            background-color: #333;
            color: white;
        }
	    .download-link {
	        cursor: pointer; /* 마우스 커서가 포인터로 변경 */
	        text-decoration: none; /* 기본 밑줄 제거 */
	        color: #007BFF; /* 링크처럼 보이게 파란색 지정 */
	        font-weight: bold; /* 눈에 띄게 굵은 텍스트 */
	        display: inline-flex; /* 아이콘과 텍스트를 정렬 */
	        align-items: center; /* 아이콘과 텍스트 세로 정렬 */
	    }
	
	    .download-link:hover {
	        color: #0056b3; /* 어두운 파란색으로 변경 */
	        text-decoration: underline; /* 호버 시 밑줄 추가 */
	        transform: scale(1.05); /* 약간 확대 효과 */
	    }
	
	    .download-link:active {
	        transform: scale(0.95); /* 클릭 시 살짝 눌리는 효과 */
	        color: #003865; /* 더 어두운 색상으로 변경 */
	    }
	    tbody tr:hover{
	    	cursor: pointer;     
	    }
</style>


</head>
<body>
	<%@ include file="/WEB-INF/inc/top.jsp" %>
	
    <h1>신청현황</h1>
	<c:if test="${sessionScope.login.getMemId() != 'admin' }"> 
	
		<div class="container">
	        <div class="form-container">  
	            <div>  
	                <label for="status">상태:</label>
	                <select id="status" name="status">
	                	<option value="전체">전체</option>
	                    <option value="신청중">신청중</option>
	                    <option value="완료">완료</option>
	                    <option value="취소">취소</option>
	                </select>
	            </div>
	        </div>
	
	        <!-- 신청 현황 테이블 -->
	        <table>
	            <thead>
	                <tr>
	                    <th>번호</th>
	                    <th>건물명</th>
	                    <th>첨부 파일</th>
	                    <th>신청 날짜</th>
	                    <th>신청 상태</th>
	                </tr>
	            </thead>
	            <tbody>
	                <c:forEach var="apply" items="${applys}" varStatus="status"> 
	                    <tr>
	                        <td>${status.count }</td>
	                        <td>${apply.buildingName }</td>  
	                        <td class="download-link">💾 ${apply.fileName }</td>   
	                        <td>${apply.applyDate }</td>
	                        <td class="applyStatus">${statusList[status.index] }</td>
	                    </tr>
	                </c:forEach>
	            </tbody>
	        </table>
	    </div>
	</c:if>
	<c:if test="${sessionScope.login.getMemId() == 'admin' }"> 
	
		<div class="container">
	        <div class="form-container">  
	            <div>  
	                <label for="status">상태:</label>
	                <select id="status" name="status">
	                	<option value="전체">전체</option>
	                    <option value="신청중">신청중</option>
	                    <option value="완료">완료</option>
	                    <option value="취소">취소</option>
	                </select>
	            </div>
	        </div>
	
	        <!-- 신청 현황 테이블 -->
	        <table>
	            <thead>
	                <tr>
	                    <th>번호</th>
	                    <th>아이디</th>
	                    <th>건물명</th>
	                    <th>신청 날짜</th>
	                    <th>신청 상태</th>
	                </tr>
	            </thead>
	            <tbody>
	                <c:forEach var="apply" items="${applyAdmin}" varStatus="status"> 
	                    <tr class="trs">
	                        <td>${status.count }</td>
	                        <td>${apply.memId }</td>
	                        <td>${apply.buildingName }</td>  
	                        <td>${apply.applyDate }</td>
	                        <td class="applyStatus">${statusAdmin[status.index] }</td>
	                    </tr>
	                    <form class="submitForm" style="display: none;" action="${pageContext.request.contextPath }/applyZEBDetailView" method="post">
		                    <input name="bId" class="buildingId" style="display:none;" value="${apply.buildingId }">
	                    </form>
	                </c:forEach>
	            </tbody>
	        </table>
	    </div>
	</c:if>
    <%@ include file="/WEB-INF/inc/chatbotbot.jsp"%>
	
	<%@ include file="/WEB-INF/inc/footer.jsp" %>
	
	
	<script type="text/javascript">
		let v_status = document.querySelector('#status'); 
	    let v_applyStatus = document.querySelectorAll('.applyStatus'); 
	    let v_tableRows = document.querySelectorAll('tbody tr'); 
	    let v_numberCells = document.querySelectorAll('tbody tr td:first-child'); 
	    let v_downLoad = document.querySelectorAll('.download-link');
	    let v_trs = document.querySelectorAll('.trs');
	    let v_bId = document.querySelectorAll('.buildingId');
	    let forms = document.querySelectorAll('.submitForm');
	
	    v_status.addEventListener('change', () => {
	        const selectedStatus = v_status.value; 
	        let currentNum = 1;
	
	        v_tableRows.forEach((row, index) => {
	            const statusCell = v_applyStatus[index]; 
	            const statusText = statusCell.innerText; 
	
	            if (selectedStatus === "전체" || statusText.includes(selectedStatus)) {
	                row.style.display = ""; 
	                v_numberCells[index].innerText = currentNum++;
	            } else {
	                row.style.display = "none"; 
	            }
	        });
	    });
		
		v_downLoad.forEach(dl =>{
			dl.addEventListener('click',()=>{
				
				let fn = dl.innerHTML;
				fn = fn.substr(3);
				
				location.href = "${pageContext.request.contextPath}/downLoadFile?fileName=" + fn
			})
		})
		
		v_trs.forEach((tr,idx) =>{ 
			tr.addEventListener('click',()=>{
				forms[idx].submit();
			})
		})
		
		
		
		
	</script>
</body>
</html>