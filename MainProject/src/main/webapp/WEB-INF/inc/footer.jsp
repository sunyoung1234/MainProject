<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <style type="text/css">
        /* Footer 고정 스타일 */
        .footer {
            background-color: #343a40; /* bg-dark 색상 */
            color: #fff; /* text-white */
            padding: 20px 0;
            position: relative;
            bottom: 0;
            width: 100%;
            height:150px; 
            text-align: center; 
        } 
        body {
            margin: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        main {
            flex: 1; /* Footer를 하단으로 밀기 위한 공간 */
        }
        
        .footer-top{
        	 color: #fff; /* text-white */
        	 margin-bottom: 30px;  
        }
        
        .footer-top {
        	display: flex;
        	width:1200px;
        	margin-left:200px;
        	font-size:15px;
        	margin-bottom: 10px; 
        }
        
        .foot-top-box{
        	margin-right: 40px;  
        	margin-bottom: 10px;
        }
        
        .foot-top-box1{
        	margin-bottom: 10px;
        }
        
        .foot-top-box2{
        	margin-bottom: 10px;
        }
        
        .footer-top-left{
			width:300px;        
        }
        
        .footer-top-left3{
			width:350px;        
        }
        
        .footer-top-left5{
			width:550px;        
        }
           
    </style>
</head>
<body>
    <!-- 페이지의 주요 내용 -->
    <main>
        <!-- 메인 컨텐츠가 렌더링됩니다 -->
    </main> 
    <!-- Footer -->
    <footer class="footer">
 
    	<div class="footer-top">
    		<div class="footer-top">
    			<div class="footer-top-left">상호명 : GreenSolution</div> 
    			<div class="footer-top-left">대표 이름 : 박선영</div> 
    			<div class="footer-top-left3">주소 : 대전 서구 문정로 48번길</div> 
    			<div class="footer-top-left">대표번호 : 010-1111-1111</div> 
    			<div class="footer-top-left5">대표 이메일 : greensolution@greensolution.com</div>
    		</div>
    	</div> 
        <div class="footer-bottom">
            <p class="m-0 text-center">Copyright &copy; GreenSolution All rights reserved.</p>
        </div>
    </footer>
    <!-- Bootstrap core JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS -->
    <script src="js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</body>
</html>