<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>기후 정보 및 설정</title>
	<style type="text/css">
	.tg  {border-collapse:collapse;border-spacing:0;}
	.tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
	  overflow:hidden;padding:10px 5px;word-break:normal;}
	.tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
	  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
	.tg .tg-c3ow{border-color:inherit;text-align:center;vertical-align:top}
	</style>
        
</head>
<body>
    
	<table class="tg">
		<thead>
		  <tr>
		    <th class="tg-c3ow" rowspan="2">기후 정보</th>
		    <th class="tg-c3ow">기후 조건</th>
		    <th class="tg-c3ow" colspan="3"></th>
		  </tr>
		  <tr>
		    <th class="tg-c3ow">평균 기온()</th>
		    <th class="tg-c3ow">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
		    <th class="tg-c3ow">난방도시</th>
		    <th class="tg-c3ow">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
		  </tr>
		</thead>
		<tbody>
		  <tr>
		    <td class="tg-c3ow" rowspan="2">기본 설정</td>
		    <td class="tg-c3ow">건물 유형</td>
		    <td class="tg-c3ow"></td>
		    <td class="tg-c3ow">축열</td>
		    <td class="tg-c3ow"></td>
		  </tr>
		  <tr>
		    <td class="tg-c3ow">난방 온도</td>
		    <td class="tg-c3ow"></td>
		    <td class="tg-c3ow">냉방 온도</td>
		    <td class="tg-c3ow"></td>
		  </tr>
		  <tr>
		    <td class="tg-c3ow" rowspan="2">발열 정보</td>
		    <td class="tg-c3ow">전체 거주자 수 </td>
		    <td class="tg-c3ow"></td>
		    <td class="tg-c3ow" rowspan="2">내부발열<br>입력 유형</td>
		    <td class="tg-c3ow"></td>
		  </tr>
		  <tr>
		    <td class="tg-c3ow">내부 발열</td>
		    <td class="tg-c3ow"></td>
		    <td class="tg-c3ow"></td>
		  </tr>
		  <tr>
		    <td class="tg-c3ow" rowspan="2">면적 체적</td>
		    <td class="tg-c3ow">유효 실내면적</td>
		    <td class="tg-c3ow"></td>
		    <td class="tg-c3ow">환기용 체적</td>
		    <td class="tg-c3ow"></td>
		  </tr>
		  <tr>
		    <td class="tg-c3ow">A/V 비</td>
		    <td class="tg-c3ow" colspan="3"></td>
		  </tr>
		</tbody>
	</table>
	<table class="tg">
		<thead>
		  <tr>
		    <th class="tg-baqh" rowspan="3">열관류율</th>
		    <th class="tg-baqh">지붕</th>
		    <th class="tg-baqh">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
		    <th class="tg-baqh">외벽 등</th>
		    <th class="tg-baqh">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
		  </tr>
		  <tr>
		    <th class="tg-baqh">바닥/지면</th>
		    <th class="tg-baqh"></th>
		    <th class="tg-baqh">외기간접</th>
		    <th class="tg-baqh"></th>
		  </tr>
		  <tr>
		    <th class="tg-baqh">출 입 문</th>
		    <th class="tg-baqh"></th>
		    <th class="tg-baqh">창호 전체</th>
		    <th class="tg-baqh"></th>
		  </tr></thead>
		<tbody>
		  <tr>
		    <td class="tg-baqh" rowspan="2">기본 유리</td>
		    <td class="tg-baqh">제품</td>
		    <td class="tg-baqh" colspan="3"></td>
		  </tr>
		  <tr>
		    <td class="tg-baqh">열관류율</td>
		    <td class="tg-baqh"></td>
		    <td class="tg-baqh">일사획득계수</td>
		    <td class="tg-baqh"></td>
		  </tr>
		  <tr>
		    <td class="tg-baqh" rowspan="2">기본 창틀</td>
		    <td class="tg-baqh">제 품</td>
		    <td class="tg-baqh" colspan="3"></td>
		  </tr>
		  <tr>
		    <td class="tg-baqh">창틀 열관류율</td>
		    <td class="tg-baqh"></td>
		    <td class="tg-baqh">간봉 열관류율</td>
		    <td class="tg-baqh"></td>
		  </tr>
		  <tr>
		    <td class="tg-baqh" rowspan="3">환기<br>정보</td>
		    <td class="tg-baqh">제품</td>
		    <td class="tg-baqh" colspan="3"></td>
		  </tr>
		  <tr>
		    <td class="tg-baqh">난방효율</td>
		    <td class="tg-baqh"></td>
		    <td class="tg-baqh">냉방효율</td>
		    <td class="tg-baqh"></td>
		  </tr>
		  <tr>
		    <td class="tg-baqh">습도회수율</td>
		    <td class="tg-baqh"></td>
		    <td class="tg-baqh">전력</td>
		    <td class="tg-baqh"></td>
		  </tr>
		  <tr>
		    <td class="tg-baqh">열교</td>
		    <td class="tg-baqh">선형전달계수</td>
		    <td class="tg-baqh"></td>
		    <td class="tg-baqh">점형전달계수</td>
		    <td class="tg-baqh"></td>
		  </tr>
		</tbody>
</table>
</body>
</html>
