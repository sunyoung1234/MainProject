<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>리뷰 작성</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <link href="css/styles.css" rel="stylesheet" />

    <!-- External libraries and icons -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" rel="stylesheet" />
    
    <style>
        /* 독립적인 스타일 */
        .review-container-wrapper {
            display: flex;
            justify-content: center;
            padding: 20px;
            background-color: #f4f4f9;
            min-height: 100vh;
        }

        .review-container {
            width: 1000px;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .review-container h2 {
            text-align: center;
            color: #333;
        }

        .review-container label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        .review-container input[type="text"],
        .review-container select,
        .review-container textarea {
            width: 100%;
            padding: 8px;
            margin-bottom: 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        
        .review-container form{ 
        	margin-top: 25px;  
        }
        

        #submitBtn {
            width: 100%;
            padding: 10px;
            background-color: #198754;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
            margin-top: 15px;
        }
        
        #submitBtn:hover{
       	 background-color: #157347; 
        }

        .review-container input[type="submit"]:hover {
            background-color: #157347;
        }
        
        #buyHistory{
        	width: 80%;
	        height: 15%;
	        display: flex;
	        align-items: center;
	        justify-content: space-between;
	        margin: auto;
	        background-color: #fff;
	        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5); 
	        border-radius: 8px;
	        padding: 10px;        	
        }
        
        #buyHistory:hover{
        	transform: scale(1.05); 
        }
        
        #buyHistory img{
        	width: 12%;
        	margin-right: 10px;
        }
        
        #buyHistory span {
	        font-size: 14px;
	        font-weight: bold;
	        color: #333;
	        margin-left: 20px;
	    }
	    
	    #inputFileBtn{
	    	width: 50px;
	    }
	    
	    #inputFileBtn:hover{
	    	cursor: pointer;
	    } 
	    
	    #inputFile{
	    	display: none;
	    }
	    
	    .reviewImages{
	    	width: 100px;
	    	height: 100px;
	    }
	    
	    #filesDiv{
	    	display: flex;
	    	flex-wrap: wrap;
	    }
	    
	    #filesDiv > div{
	    	margin: 20px;
	    }
	    
	    .deleteReviewImg{
	    	color: red;
	    	font-weight: bold;
	    	text-align: end;   
	    }
	    
	    .deleteReviewImg:hover{ 
	    	cursor: pointer;   
	    }
    </style>
</head>
<body class="d-flex flex-column">

    <!-- top.jsp 포함 (전체 레이아웃에 영향 없음) -->
    <%@ include file="/WEB-INF/inc/top.jsp" %>

    <main class="flex-shrink-0">
        <div class="review-container-wrapper">
            <div class="review-container">
                <h2>리뷰 작성</h2>
                <!-- 리뷰대상 -->  
                <div id="buyHistory"> 
                	<img src="data:image/jpeg;base64,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">
                	<span>고라파덕</span>
                	<span>구매수량: 1</span>
                	<span>구매날짜 : 2024/11/08 (금)</span> 
                </div>
                
                <form id="reviewForm" action="${pageContext.request.contextPath }/reviewWriteDo" method="post" enctype="multipart/form-data">
                    <label for="revTitle">리뷰 제목</label> 
                    <input type="text" id="revTitle" name="revTitle" placeholder="이름을 입력하세요" required>

                    <label for="rating">평점</label>
                    <select id="rating" name="rating" required>
                        <option value="">평점을 선택하세요</option>
                        <option value="5">★★★★★ (5점)</option>
                        <option value="4">★★★★☆ (4점)</option>
                        <option value="3">★★★☆☆ (3점)</option>
                        <option value="2">★★☆☆☆ (2점)</option>
                        <option value="1">★☆☆☆☆ (1점)</option>
                    </select>

                    <label for="revContent">리뷰 내용</label>
                    <textarea id="revContent" name="revContent" rows="4" placeholder="리뷰를 입력하세요" required></textarea>
                    
                    <label for="inputFileBtn">리뷰 사진</label>
                    <img id="inputFileBtn" src="https://cdn-icons-png.flaticon.com/512/5735/5735394.png">
					<input name="files" type="file" id="inputFile" multiple accept="image/*">
					<div id="filesDiv">
						
					</div>
                    <button id="submitBtn" type="submit" >리뷰 등록!</button>  
                </form>
            </div>
        </div>
    </main>

    <!-- footer.jsp 포함 (전체 레이아웃에 영향 없음) -->
    <%@ include file="/WEB-INF/inc/footer.jsp" %>

    <script>
    	document.getElementById('inputFile').addEventListener('change',()=>{
    		let fileList = event.target.files;
    		
    		
    		let v_filesDiv = document.getElementById('filesDiv');
    		let fileHTML = '';
    		
    		for(let i=0; i< fileList.length; i++){
    			
	   			let reader = new FileReader(); // 각 파일에 대해 새로운 파일리더 생성 (비동기적으로 읽을 수 없음 한번에 하나만)
	   			
    			
        		reader.onload = function(e){
	    			fileHTML += '<div><span style="display: none;">'+ (i+1) + '. ' + fileList[i]['name'] +'</span>';
	    			fileHTML += '<p class="deleteReviewImg"> X </p>'
        			fileHTML += '<img class="reviewImages" src="' + e.target.result + '"></div>'
		   			v_filesDiv.innerHTML = fileHTML;  
        			
        			if(i == fileList.length-1){
				    	let v_delBtns = document.querySelectorAll('.deleteReviewImg');
				    	console.log(v_delBtns);
				    	v_delBtns.forEach((del,j) =>{
				    		del.addEventListener('click',()=>{
				    			del.parentElement.remove();
				    			document.getElementById('inputFile').files.remove(j);
				    			console.log(document.getElementById('inputFile').files);
				    		})
				    	})
        			}
        		}
        		reader.readAsDataURL(fileList[i])
        		
    		}
    		
    		
    	}) 
    	
    	
    	
    	
    	document.getElementById('inputFileBtn').addEventListener('click',()=>{
    		document.getElementById('inputFile').click();
    	})
    	
    	
    
    </script>

</body>
</html>
