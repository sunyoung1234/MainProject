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

<style>
    body {
        font-family: Arial, sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        background-color: #f4f4f4;
        margin: 0;
    }

    #container {
        position: relative;
        max-width: 100%;
        max-height: 80vh;
    }

    #image-preview {
        max-width: 100%;
        max-height: 100%;
        display: block;
    }

    /* 자르기 상자 스타일 */
    #crop-box {
        position: absolute;
        border: 2px dashed rgba(0, 123, 255, 0.7);
        background: rgba(0, 123, 255, 0.3);
        cursor: move;
    }

    /* 자르기 상자 크기 조절 핸들 */
    .resize-handle {
        position: absolute;
        background-color: rgba(0, 123, 255, 0.7);
        width: 10px;
        height: 10px;
        cursor: pointer;
    }

    .resize-handle.top-left { top: -5px; left: -5px; cursor: nwse-resize; }
    .resize-handle.top-right { top: -5px; right: -5px; cursor: nesw-resize; }
    .resize-handle.bottom-left { bottom: -5px; left: -5px; cursor: nesw-resize; }
    .resize-handle.bottom-right { bottom: -5px; right: -5px; cursor: nwse-resize; }
</style>

</head>
<body class="d-flex flex-column">

	<%@ include file="/WEB-INF/inc/top.jsp"%>

	<div id="container">
        <input type="file" id="image-upload" accept="image/*">
        <br>
        <img id="image-preview" src="" alt="미리보기">
        <div id="crop-box">
            <div class="resize-handle top-left"></div>
            <div class="resize-handle top-right"></div>
            <div class="resize-handle bottom-left"></div>
            <div class="resize-handle bottom-right"></div>
        </div>
    </div>

	<%@ include file="/WEB-INF/inc/footer.jsp" %>
	
<script>
    let imagePreview = document.getElementById('image-preview');
    let cropBox = document.getElementById('crop-box');
    let imageUpload = document.getElementById('image-upload');
    let isDragging = false;
    let startX, startY;
    let cropBoxX = 50, cropBoxY = 50, cropBoxWidth = 150, cropBoxHeight = 150;
    let imageWidth, imageHeight;

    // 이미지 미리보기와 자르기 상자 설정
    imageUpload.addEventListener('change', function (event) {
        let file = event.target.files[0];
        if (file) {
            let reader = new FileReader();
            reader.onload = function (e) {
                imagePreview.src = e.target.result;
                imagePreview.onload = function () {
                    imageWidth = imagePreview.width;
                    imageHeight = imagePreview.height;
                    
                    // 자르기 상자 크기 비율 설정
                    cropBox.style.width = `${cropBoxWidth}px`;
                    cropBox.style.height = `${cropBoxHeight}px`;
                    cropBox.style.top = `${cropBoxY}px`;
                    cropBox.style.left = `${cropBoxX}px`;
                };
            };
            reader.readAsDataURL(file);
        }
    });

    // 자르기 상자 이동
    cropBox.addEventListener('mousedown', function (e) {
        isDragging = true;
        startX = e.clientX - cropBox.offsetLeft;
        startY = e.clientY - cropBox.offsetTop;

        function onMouseMove(e) {
            if (isDragging) {
                let moveX = e.clientX - startX;
                let moveY = e.clientY - startY;

                // 이미지 영역 내에서만 이동 가능하도록 제한
                moveX = Math.max(0, Math.min(moveX, imageWidth - cropBox.offsetWidth));
                moveY = Math.max(0, Math.min(moveY, imageHeight - cropBox.offsetHeight));

                cropBox.style.left = `${moveX}px`;
                cropBox.style.top = `${moveY}px`;

                cropBoxX = moveX;
                cropBoxY = moveY;
            }
        }

        function onMouseUp() {
            isDragging = false;
            document.removeEventListener('mousemove', onMouseMove);
            document.removeEventListener('mouseup', onMouseUp);
        }

        document.addEventListener('mousemove', onMouseMove);
        document.addEventListener('mouseup', onMouseUp);
    });

    // 자르기 상자 크기 조정
    const resizeHandles = document.querySelectorAll('.resize-handle');
    resizeHandles.forEach(handle => {
        handle.addEventListener('mousedown', function (e) {
            e.preventDefault();
            let handleClass = e.target.className.split(' ')[1];

            let startWidth = cropBox.offsetWidth;
            let startHeight = cropBox.offsetHeight;
            let startX = e.clientX;
            let startY = e.clientY;

            function onMouseMove(e) {
                let deltaX = e.clientX - startX;
                let deltaY = e.clientY - startY;

                if (handleClass === 'top-left') {
                    cropBox.style.width = `${startWidth - deltaX}px`;
                    cropBox.style.height = `${startHeight - deltaY}px`;
                    cropBox.style.left = `${cropBoxX + deltaX}px`;
                    cropBox.style.top = `${cropBoxY + deltaY}px`;
                } else if (handleClass === 'top-right') {
                    cropBox.style.width = `${startWidth + deltaX}px`;
                    cropBox.style.height = `${startHeight - deltaY}px`;
                    cropBox.style.top = `${cropBoxY + deltaY}px`;
                } else if (handleClass === 'bottom-left') {
                    cropBox.style.width = `${startWidth - deltaX}px`;
                    cropBox.style.height = `${startHeight + deltaY}px`;
                    cropBox.style.left = `${cropBoxX + deltaX}px`;
                } else if (handleClass === 'bottom-right') {
                    cropBox.style.width = `${startWidth + deltaX}px`;
                    cropBox.style.height = `${startHeight + deltaY}px`;
                }

                cropBoxWidth = cropBox.offsetWidth;
                cropBoxHeight = cropBox.offsetHeight;
            }

            function onMouseUp() {
                document.removeEventListener('mousemove', onMouseMove);
                document.removeEventListener('mouseup', onMouseUp);
            }

            document.addEventListener('mousemove', onMouseMove);
            document.addEventListener('mouseup', onMouseUp);
        });
    });

    // 자른 이미지 보내기 (서버에 전달)
    function getCropBoxCoordinates() {
        return {
            x: cropBoxX,
            y: cropBoxY,
            width: cropBoxWidth,
            height: cropBoxHeight
        };
    }

</script>

</body>
</html>
