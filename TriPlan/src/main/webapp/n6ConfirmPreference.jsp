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
	<h1>"nick name" ���� ���� ��Ÿ�� Ȯ��</h1>
    <details class="details">
        <summary>���� ��Ÿ��</summary>
        <ul>
        <li>�⺻����</li>
        <li>����</li>
        <li>����</li>
        <li>����</li>
        </ul>
    </details>
    <div class="button-container">
    <button id="modify">�����ϱ�</button>
    <button id="create">���� ���� �����ϱ�</button>
    </div>
    
<%
    n3PreferenceVO preferenceVO = new n3PreferenceVO();
    preferenceVO.setCheckboxValue("true");
    preferenceVO.setRadioValue("value1");

    request.setAttribute("preferenceVO", preferenceVO);
%>

<a href="n3Preference.jsp">�����ϱ�</a>

    
</body>
</html>