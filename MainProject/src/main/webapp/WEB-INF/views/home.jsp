<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Scrolling Nav - Start Bootstrap Template</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />	
    	<style type="text/css">
    		.my-box{
    			width:100px;
    			height:290px;
    			border: 1px solid black;
    		}
    	
    	</style>
    
    </head>
    <body>
    
    
    	
        
        
        <!-- Navigation-->
    <%@ include file="/WEB-INF/inc/top.jsp"%>
        
        <div class="my-box">
        	<div>
		        <a href="${pageContext.request.contextPath }/map">지도</a>
        	</div>
        </div>
        <!-- Footer-->
	<%@ include file="/WEB-INF/inc/footer.jsp"%>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        
        
    </body>
</html>
