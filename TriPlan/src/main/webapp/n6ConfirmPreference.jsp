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
    
    <script>
    // -nickname ��������
    // -���ེŸ�� ��������
    </script> 
</body>
</html>