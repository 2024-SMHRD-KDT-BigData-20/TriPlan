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
	<h1>"nick name" ���� ���� ��Ÿ�� Ȯ��</h1>
    <details class="details">
        <summary>���� ��Ÿ��</summary>
        			�⺻����<br>
        			����<br>
        			����<br>
       				����<br>
    </details>
    <button id="modify">�����ϱ�</button>
    <button id="create">���� ���� �����ϱ�</button>


</body>
</html>