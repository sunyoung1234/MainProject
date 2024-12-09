<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZEB 본인증 지도</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
	#bodyBox{
		width: 100%;
		height: 100%;
		position: relative;
	}

	#map{
		width: 100%;
		height: 100%;
	}
	
	#infoBox {
		width: 25%;
		height: 80%;   
        position: absolute;
        top: 100px; /* Adjust the distance from the top */
        left: 10px; /* Adjust the distance from the left */
        background: rgba(255, 255, 255); /* Optional: makes the box slightly translucent */
        padding: 10px;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); /* Optional: adds shadow to make it stand out */
        z-index: 10;
        font-family: 'Arial', sans-serif;
    }

	#infoBox div {
        margin-bottom: 10px; 
        font-size: 14px; 
    }

    #infoBox div span {
        font-weight: bold; 
        color: #333; 
    }

    #buildingName, #buildingRegion, #buildingAdr, #buildingUse {
    	background-color: #f7f7f7; 
        border-radius: 5px; 
        padding: 10px;
        color: #555; 
    }
    #applyOrg, #totalArea, #zeroLevel, #measureMethod {
        background-color: #f7f7f7; 
        border-radius: 5px; 
        padding: 10px;
        color: #555;
    }

    /* 항목 내용이 더 긴 경우, 줄바꿈이 되도록 설정 */
    #infoBox div {
        word-wrap: break-word; 
    }

    #infoBox div span {
        font-size: 16px;
        color: #2C3E50; 
    }

    #buildingName { background-color: #EAF1F1; }
    #buildingRegion { background-color: #F9E0A1; }
    #buildingAdr { background-color: #F0D0D6; }
    #buildingUse { background-color: #C8E0F4; }
    #applyOrg { background-color: #C4F9D6; }
    #totalArea { background-color: #F1E1B4; }
    #zeroLevel { background-color: #E6F9D1; }
    #measureMethod { background-color: #D9E6F9; }
    
    #zoomBox {
        position: absolute;
        bottom: 3px; /* Distance from the bottom of the screen */
        right: 7px; /* Distance from the right side */  
        background: rgba(255, 255, 255, 0); /* Optional: makes the box slightly translucent */  
        padding: 10px;
        border-radius: 5px;
        z-index: 10;
    }

    #zoomBox button { 
    	width: 25px;
        margin: 5px;
        padding: 8px;
        font-size: 16px;
        background-color: black;
        color: white;
        border: 1px solid #ccc;
        cursor: pointer;
        border-radius: 5px;
    }

    #zoomBox button:hover {
        background-color: #f0f0f0;
    }

    #maplevel {
        display: block;
        margin-top: 5px;
        font-size: 14px;
    }
    
    #infoSpan{
    	font-weight: bold;
    }
    
    #zebImg{
    	width: 25px;
    	height: 25px;
    }
    
	.custom-overlay {
	  position: absolute;  
	  background-color: rgba(0, 0, 0, 0.6);  
	  color: white;  
	  padding: 10px;
	  border-radius: 8px;
	  font-family: Arial, sans-serif;
	  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
	  text-align: center;  
	  z-index: 100; 
	  transition: all 0.3s ease;
	}
	
	.custom-overlay:hover {
	  background-color: rgba(0, 0, 0, 0.8);  
	  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.6); 
	  transform: scale(1.05);  
	}
	
	.overlay-text {
	  font-size: 16px;
	}
	
	.sido-name {
	  font-weight: bold;
	  font-size: 18px;
	}
	
	.count {
	  font-size: 14px;
	  margin-top: 5px;
	}
	
	.custom-overlay p {
	  margin: 0;
	}
	
	.custom-overlay strong {
	  display: block;  
	}
	    
	#searchBox {
	    position: absolute;
	    top: 20px;
	    left: 50%;
	    transform: translateX(-50%);
	    width: 80%;
	    max-width: 500px;
	    z-index: 20;
	    display: flex; 
	    justify-content: flex-start; 
	    align-items: center; 
	    flex-wrap: nowrap; 
	}
	
	#searchInput {
	    width: 80%; 
	    padding: 10px;
	    font-size: 16px;
	    border: 1px solid #ccc;
	    border-radius: 5px;
	    outline: none;
	    box-sizing: border-box;
	}
	
	#searchInput:focus {
	    border-color: #0078D4;
	}
	
	#searchResults {
	    margin-top: 5px; 
	    background-color: white;
	    border: 1px solid #ccc;
	    border-radius: 5px;
	    max-height: 150px;
	    overflow-y: auto;
	    position: absolute; 
	    width: 100%; 
	    display: none; 
	    z-index: 10;
	    top: 100%; 
	}
	
	#searchResults div {
	    padding: 10px;
	    cursor: pointer;
	    font-size: 14px;
	}
	
	#searchResults div:hover {
	    background-color: #f0f0f0;
	}
	
	#searchBtn {
	    background-color: #0078D4; /* 파란색 */
	    color: white; /* 텍스트 색상 */
	    padding: 10px 15px; /* 버튼 크기 */
	    font-size: 16px; /* 텍스트 크기 */
	    border: none;
	    border-radius: 5px; /* 둥근 모서리 */
	    cursor: pointer; /* 마우스 커서 변경 */
	    margin-left: 3px; /* 입력 필드와 버튼 사이의 간격 */
	}
	
	#searchBtn:hover {
	    background-color: #005ea2; /* 버튼에 마우스를 올렸을 때 어두운 파란색 */
	}
	
	.info-window{
		white-space: nowrap; /* 텍스트가 줄바꿈 없이 한 줄로 표시되도록 설정 */
	    overflow: hidden;    /* 텍스트가 박스를 넘지 않도록 숨김 처리 */
	    text-overflow: ellipsis; 
	}
	
</style>

</head>
<body>
	<div id="bodyBox">
		<div style="position: absolute; top: 20px; left: 20px; z-index: 20;">
		    <button onclick="goBack()" style="
		        display: flex; 
		        align-items: center; 
		        padding: 15px 22px; /* 버튼의 패딩을 1.5배 확대 */
		        font-size: 21px; /* 기존보다 글씨 크기를 확대 */
		        font-weight: bold; 
		        border-radius: 7.5px; /* 모서리도 약간 키움 */
		        border: none; 
		        cursor: pointer; 
		        background-color: #FF4C4C; 
		        color: white;">
		        <span style="margin-right: 8px; font-size: 24px;">←</span> 뒤로가기
		    </button>
		</div>
		<div id="map" style="width:100%;height:1000px;"></div>   
		<div id="infoBox">
			<div id="buildingName"><span id="infoSpan">건물명</span> : </div>
			<div id="buildingRegion"><span id="infoSpan">지역</span> : </div>
			<div id="buildingAdr"><span id="infoSpan">상세주소</span> : </div>
			<div id="buildingUse"><span id="infoSpan">건물용도</span> : </div>
			<div id="applyOrg"><span id="infoSpan">신청기관</span> : </div>
			<div id="totalArea"><span id="infoSpan">연면적</span> : </div>
			<div id="zeroLevel"><span id="infoSpan">ZEB등급</span> : </div>
			<div id="measureMethod"><span id="infoSpan">측정기기</span> : </div>
			
			<div style="margin-top: 150px;">   
				<p>ZEB1<img id="zebImg" src="${pageContext.request.contextPath }/resources/image/zeb1.png"> => 에너지자립률 100%이상  </p>
				<p>ZEB2<img id="zebImg" src="${pageContext.request.contextPath }/resources/image/zeb2.png"> => 에너지자립률 80%이상 ~ 100% 미만  </p>
				<p>ZEB3<img id="zebImg" src="${pageContext.request.contextPath }/resources/image/zeb3.png"> => 에너지자립률 60%이상 ~ 80% 미만  </p>
				<p>ZEB4<img id="zebImg" src="${pageContext.request.contextPath }/resources/image/zeb4.png"> => 에너지자립률 40%이상 ~ 60% 미만  </p>
				<p>ZEB5<img id="zebImg" src="${pageContext.request.contextPath }/resources/image/zeb5.png"> => 에너지자립률 20%이상 ~ 40% 미만  </p>
			</div>
		</div>
	</div>
	<div id="zoomBox">
	    <button onclick="zoomIn()">+</button>
	    <button onclick="zoomOut()">-</button>
	</div>
	
	<div id="searchBox">
	    <input type="text" id="searchInput" placeholder="건물명 또는 주소 검색" onkeyup="searchAddr()">
	    <button id="searchBtn" onclick="searchBar()">검색</button>
	    <div id="searchResults"></div>
	</div>
	
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e0184ed647e553cf5795a108feda8a4a&libraries=clusterer,services"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e0184ed647e553cf5795a108feda8a4a"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/sidodo.js"></script>
	
	
	
	<script type="text/javascript">
	
	
	 	const data = { 울산: 28, 충북: 87, 서울: 103, 전북: 100, 경기: 297, 충남: 87, 부산: 50, 강원: 120, 경북: 119, 대전: 42, 세종: 30,제주: 34, 대구: 58, 전남: 92,인천: 80, 광주: 34,경남: 140 };
		let mapContainer = document.getElementById('map'), // 지도를 표시할 div    
	    mapOption = { 
	        center: new kakao.maps.LatLng(36.144932, 127.082053), // 지도의 중심좌표
	        level: 13 // 지도의 확대 레벨
	    }; 
		
		let map = new kakao.maps.Map(mapContainer, mapOption);
		let center = map.getCenter(); 
		displayLevel();
		
		let positions = []; // 제로에너지 건물 목록
		let markers = []; // marker 모아둔 배열
	    let infowindows = [];
		
		<c:forEach var="zero" items="${zeroList}">
		    positions.push({ 
		        title: '${zero.getBuildingName()}',
		        region: '${zero.getRegion()}',
		        addr: '${zero.getBuildingAddress()}',
		        use: '${zero.getBuildingUse()}',
		        apply: '${zero.getApplicantOrganization()}',
		        area: '${zero.getTotalArea()}',
		        method: '${zero.getMeasureMethod()}',
		        level: '${zero.getZeroLevel()}',
		        latlng: new kakao.maps.LatLng(${zero.getLatitude()},${zero.getLongitude()})
		    });
		</c:forEach> 
		
		
		
		for (var i = 0; i < positions.length; i ++){
			if(positions[i].level == 'ZEB 1'){
				imageSrc = "${pageContext.request.contextPath }/resources/image/zeb1.png";  
			}else if(positions[i].level == 'ZEB 2'){
				imageSrc = "${pageContext.request.contextPath }/resources/image/zeb2.png";
			}else if(positions[i].level == 'ZEB 3'){
				imageSrc = "${pageContext.request.contextPath }/resources/image/zeb3.png";
			}else if(positions[i].level == 'ZEB 4'){
				imageSrc = "${pageContext.request.contextPath }/resources/image/zeb4.png";
			}else{
				imageSrc = "${pageContext.request.contextPath }/resources/image/zeb5.png";
			}
			
		    var imageSize = new kakao.maps.Size(30,30); // 24,35   
		     
		    // 마커 이미지를 생성합니다    
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		    
		    // 마커를 생성합니다 
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng, // 마커를 표시할 위치
		        image : markerImage, // 마커 이미지
		        clickable: true
		    });
		    
		    
		    
		    
		    
		    var iwContent = '<div class="info-window" style="padding:5px;">'+ positions[i].title +'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	        iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

		    // 인포윈도우를 생성합니다
		    var infowindow = new kakao.maps.InfoWindow({
		        content : iwContent,
		        removable : iwRemoveable
		    });
	        infowindows.push(infowindow);
	        
		    markers.push(marker); 
		    hideMarkers();
		}
		
		
		let v_name = document.querySelector('#buildingName');
		let v_region = document.querySelector('#buildingRegion');
		let v_addr = document.querySelector('#buildingAdr');
		let v_use = document.querySelector('#buildingUse');
		let v_apply = document.querySelector('#applyOrg');
		let v_area = document.querySelector('#totalArea');
		let v_level = document.querySelector('#zeroLevel');
		let v_method = document.querySelector('#measureMethod'); 
		
		for(let i=0; i<markers.length; i++){
			kakao.maps.event.addListener(markers[i], 'click', function() {
		          v_name.innerHTML = '<span id="infoSpan"> 건물명 </span> : ' + positions[i].title;
		          v_region.innerHTML = '<span id="infoSpan"> 지역 </span> : ' + positions[i].region;
		          v_addr.innerHTML = '<span id="infoSpan"> 상세주소 </span> : ' + positions[i].addr;
		          v_use.innerHTML = '<span id="infoSpan"> 건물용도 </span> : ' + positions[i].use;
		          v_apply.innerHTML = '<span id="infoSpan"> 신청기관 </span> : ' + positions[i].apply;
		          v_area.innerHTML = '<span id="infoSpan"> 연면적 </span> : ' + positions[i].area + ' m²';
		          v_level.innerHTML = '<span id="infoSpan"> ZEB등급 </span> : ' + positions[i].level;
		          v_method.innerHTML = '<span id="infoSpan"> 측정기기 </span> : ' + positions[i].method;
		          
		          level = map.getLevel();
		          console.log(level)
		          while(level > 4){ 
		        	  map.setLevel(level-1);
		          }
		          map.setCenter(positions[i].latlng);
		    }); 
			
			kakao.maps.event.addListener(markers[i], 'mouseover', ()=>{
				infowindows[i].open(map, markers[i]);
			})
			kakao.maps.event.addListener(markers[i], 'mouseout', ()=>{
				infowindows[i].close();
			})
		}
		
		function zoomIn() {        
		    level = map.getLevel();
		    
		    map.setLevel(level - 1);
		    
		    displayLevel();
		}    

		function zoomOut() {    
		    level = map.getLevel(); 
		    
		    map.setLevel(level + 1);
		    
		    displayLevel(); 
		}
		
		function displayLevel(){
			
		}
		
		function setMarkers(map) {
		    for (var i = 0; i < markers.length; i++) {
		        markers[i].setMap(map);
		    }            
		}
		
		function showMarkers() {
		    setMarkers(map)    
		}

		function hideMarkers() {
		    setMarkers(null);    
		}
		var jsonData = JSON.parse(JSON.stringify(SidoFile));
		let centerList = [];
		
		for(let i=0 ; i < jsonData['features'].length; i++){
			console.log(jsonData['features'][i]['properties']['SIG_KOR_NM'])
			
			var region = jsonData['features'][i]['properties']['SIG_KOR_NM'];
			var polygonPath = []; 
			for(let j=0; j< jsonData['features'][i]['geometry']['coordinates'][0].length; j++){
				polygonPath.push(new kakao.maps.LatLng(jsonData['features'][i]['geometry']['coordinates'][0][j][1],jsonData['features'][i]['geometry']['coordinates'][0][j][0]))
			}
			
			var polygon = new kakao.maps.Polygon({
			    path:polygonPath, // 그려질 다각형의 좌표 배열입니다
			    strokeWeight: 5, // 선의 두께입니다
			    strokeColor: '#39DE2A'	, // 선의 색깔입니다
			    strokeOpacity: 0.5, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
			    strokeStyle: 'solid', // 선의 스타일입니다
			    fillColor: '#39DE2A', // 채우기 색깔입니다 
			    fillOpacity: 0 // 채우기 불투명도 입니다
			});  

			// 지도에 다각형을 표시합니다
			polygon.setMap(map);
			
			
			
			var centerP = getPolygonCenter(polygonPath,region);
			var region_count = data[region];
			
			centerList.push(centerP);
			
			var content = '<div class="custom-overlay"><span class="overlay-text"><strong class="sido-name">'
				content += region + '</strong><p class="count">' 
				content += region_count + '</p></span></div>'
			
			var customOverlay = new kakao.maps.CustomOverlay({
			    position: centerP, 
			    content: content   
			});
			
			customOverlay.setMap(map);
		}
		
		let v_overlay = document.querySelectorAll('.custom-overlay');
		
		v_overlay.forEach((co,index) =>{
			co.addEventListener('click',()=>{
				level = map.getLevel();
				while(level>9){
					map.setLevel(level-1);
				}
				map.setCenter(centerList[index]);
			})
		})
		
		function getPolygonCenter(polygonPath,region) {
		    var latSum = 0;
		    var lngSum = 0;
		    var pathLength = polygonPath.length;

		    // 각 좌표의 위도와 경도를 더함
		    for (let i = 0; i < pathLength; i++) {
		        latSum += polygonPath[i].getLat();  // 위도
		        lngSum += polygonPath[i].getLng();  // 경도
		    } 

		    // 평균값을 구해서 중심 좌표를 반환
		    var centerLat = latSum / pathLength;
		    var centerLng = lngSum / pathLength;
		    
		    if(region == "충북"){ 
		    	centerLat += 0.2;
		    	centerLng -= 0.1;
		    }else if(region == "세종"){
		    	centerLat -= 0.05;
		    }else if(region == "충남"){
		    	centerLng -= 0.15;
		    }else if(region == "서울"){
		    	centerLng += 0.1;
		    }else if(region == "경기"){
		    	centerLat -= 0.25; 
		    	centerLng += 0.15;
		    }else if(region == "경북"){
		    	centerLat += 0.25; 
		    }else if(region == "대구"){
		    	centerLat += 0.05;  
		    }else if(region == "울산"){
		    	centerLat += 0.05;
		    }
		    
		    centerLat += 0.11;
		    centerLng -= 0.11; 

		    return new kakao.maps.LatLng(centerLat, centerLng);
		}
		
		kakao.maps.event.addListener(map, "zoom_changed", function (){
		
			displayLevel();
			level = map.getLevel();
			if(level < 11){
				showMarkers();
			}else{
				hideMarkers();
			}
			
			if(level < 10){
				v_overlay.forEach(co=>{
					co.style.display = "none"; 
				})
			}else{
				v_overlay.forEach(co=>{
					co.style.display = "block";
				})
			}
			
			while(level > 13){
				map.setLevel(level-1);
				map.setCenter(new kakao.maps.LatLng(36.144932, 127.082053))
			}
		})
		
		function searchAddr() {
		    let searchInput = document.getElementById('searchInput').value;
		    let searchResults = document.getElementById('searchResults');
		    let filteredResults = positions.filter(position => {
		        return position.title.replaceAll(" ","").includes(searchInput.replaceAll(" ","")) || position.addr.replaceAll(" ","").includes(searchInput.replaceAll(" ",""));
		    });
			
		    searchResults.innerHTML = ''; 
		    if (searchInput.trim() !== '') {
		        filteredResults.forEach(result => {
		            let resultDiv = document.createElement('div');
		            resultDiv.textContent = result.title + '-' + result.addr;
		            searchResults.appendChild(resultDiv); 
		            resultDiv.onclick = () => { 
		            	document.getElementById('searchInput').value = result.title; 
		                searchResults.style.display = 'none';  
		            };
		        });
		        searchResults.style.display = 'block'; 
		    } else {
		        searchResults.style.display = 'none'; 
		    }
		}
		
		function searchBar(){
			let searchInput = document.getElementById('searchInput').value;
			
			
			let dots = positions.filter(position =>{
				return  searchInput === position.title 
			})
			let idx =0;
			dots.forEach(dot => {
				for(let i=0; i< positions.length; i++){
					if(dot.title === positions[i].title){
						idx = i;
					}
				}
			})
			
			
			if(dots.length > 0){
				 kakao.maps.event.trigger(markers[idx], 'click');
			}else{
				alert('정확한 건물명을 입력해주세요.'); 
			}
		}
		
		var geocoder = new kakao.maps.services.Geocoder();

		var callback = function(result, status) {
		    if (status === kakao.maps.services.Status.OK) {
		        console.log(result[0].x);
		    }
		};

		geocoder.addressSearch('해남군 송지면', callback);
		
		function goBack() {
			window.location.href = document.referrer;  
		}
		
		let mapSession = '${sessionScope.requestMap}';
		
		if(mapSession){
			console.log(mapSession);
			positions.forEach((pos,idx)=>{
				if(pos.title == mapSession){
					kakao.maps.event.trigger(markers[idx],'click');
				}				
			})
			$.ajax({
                url: '${pageContext.request.contextPath}/deleteBuildingName',
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({ buildingName : mapSession }),
                success: function (messages) {
                }
            });
		}	
		
	</script>
</body>
</html>