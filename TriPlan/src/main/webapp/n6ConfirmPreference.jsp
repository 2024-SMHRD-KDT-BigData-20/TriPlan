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

        details:not([open]) { background: rgba(0,0,255,0.15); }
        details[open] { background: rgba(255,0,0,0.15); }
        details:hover { background: rgba(0,255,0,0.15); }
        .below { background: rgba(255,255,0,0.15); }

        html, details, summary { line-height: 2.5; }
        details { margin-bottom: 0.25em; line-height: 2.5; }
    </style>

</head>
<body>
	<h1>"nick name" 님의 여행 스타일 확인</h1>
    <details class="details">
        <summary>여행 스타일</summary>
        			기본정보<br>
        			관광<br>
        			음식<br>
       				숙소<br>
    </details>
    <button id="modify">수정하기</button>
    <button id="create">여행 일정 생성하기</button>


</body>
</html>