<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ZEB 신청 페이지</title>
	<link href="css/styles.css" rel="stylesheet" />
	<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;   
        }

        #container1 {
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 400px;
            padding: 20px;
            margin-top: 100px;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
        }

        select, input[type="file"], input[type="text"], button {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        select:focus, input[type="file"]:focus, input[type="text"]:focus {
            outline: none;
            border-color: #5b9bd5;
            box-shadow: 0 0 5px rgba(91, 155, 213, 0.5);
        }

        button {
            background-color: #5b9bd5;
            color: #fff;
            font-weight: bold;
            cursor: pointer;
            border: none;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #4a8ad4;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }
	</style>
	
</head>
<body>
	<%@ include file="/WEB-INF/inc/top.jsp" %>
	
	<div id="container1">
		<form action="${pageContext.request.contextPath }/applyZEB" method="post" >
		
			<label for="selectBuilding"> 건물 선택</label>
			<select id="selectBuilding" name="building" required>
				<option value="0">===== 선택 =====</option>
			</select>
			
			<label for="inputPdf"> PDF 첨부 </label>
			<input id="inputPdf" name="pdf" type="file" required>
			
			<label for="inputOrg">발급기관명</label>
			<input id="inputOrg" name="org" required value="그린솔루션" disabled>
			 
			<button type="submit"> 제출 </button> 
		</form>
	</div>
	
	
	<%@ include file="/WEB-INF/inc/footer.jsp" %>
</body>
</html>