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