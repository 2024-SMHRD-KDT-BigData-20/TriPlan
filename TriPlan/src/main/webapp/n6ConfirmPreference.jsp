<%@page import="com.smhrd.model.n3PreferenceVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ConfirmPreference</title>
    <style>
    	ul {
    	list-style-type : none;
    	}
    	
    	li {
    	list-style-type : none;
    	}
    	
        body {
        background: #eee9e0;
        }

        h1 {
        text-align: center;
        }
        
        details {
        background : #fff;
        }

        html, details, summary { line-height: 2.5; }
        details { margin-bottom: 0.25em; line-height: 2.5; }
        
        .button-container {
    	text-align: center;
		}

		.button-container button {
	    display: inline-block;
	    padding: 10px 25px;
	    background : #f18a0d;
	    color : #fff;
	    border : 2px solid  #f18a0d;
	    border-radius: 8px;
	    margin: 10px;
	    line-height : 1.15;
	
	    
		}
    </style>

<%n3PreferenceVO preferenceVO = (n3PreferenceVO)session.getAttribute("userPreference"); %>
</head>
<body>
	<h1>"nick name" 님의 여행 스타일 확인</h1>
    <details class="details">
        <summary>여행 스타일</summary>
        <ul>
        <li>기본정보</li>
        <%=preferenceVO.getPeople()%><br>
        <%=preferenceVO.getTransportation()%><br>
        <%=preferenceVO.getPace()%><br>
        <li>관광</li>
        <%=preferenceVO.getPoi()%>
        <li>음식</li>
        <%=preferenceVO.getFood()%>
        <li>숙소</li>
        <%=preferenceVO.getSleep()%>
        </ul>
    </details>
    <div class="button-container">
    <button id="modify">수정하기</button>
    <button id="create">여행 일정 생성하기</button>
    </div>  
    
    <script>
    // -nickname 가져오기
    // -여행스타일 가져오기
    </script> 
</body>
</html>