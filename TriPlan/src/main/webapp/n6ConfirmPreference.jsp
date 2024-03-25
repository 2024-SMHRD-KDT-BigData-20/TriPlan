<%@page import="com.smhrd.model.n3PreferenceVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ConfirmPreference</title>
    <style>
        body {
        background: #eee9e0;
        }

        h1 {
        text-align: center;
        }
        
        details:not([open]) { background: #ffffff; }
        details[open] { background: #ffffff; }
        details:hover { background: #f18a0d; }
        .below { background: #f18a0d; }

        html, details, summary { line-height: 2.5; }
        details { margin-bottom: 0.25em; line-height: 2.5; }
        
        .button-container {
    	text-align: center;
		}

		.button-container button {
	    display: inline-block;
	    padding: 10px 20px;
	    margin: 10px;
		}
    </style>

</head>
<body>
	<h1>"nick name" 님의 여행 스타일 확인</h1>
    <details class="details">
        <summary>여행 스타일</summary>
        <ul>
        <li>기본정보</li>
        <li>관광</li>
        <li>음식</li>
        <li>숙소</li>
        </ul>
    </details>
    <div class="button-container">
    <button id="modify">수정하기</button>
    <button id="create">여행 일정 생성하기</button>
    </div>   
</body>
</html>