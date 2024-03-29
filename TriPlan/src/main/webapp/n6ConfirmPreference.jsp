<%@page import="com.smhrd.model.n1UserDAO"%>
<%@page import="com.smhrd.model.n1UserVO"%>
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
        background:  #FFFFFF;
        }

        h1 {
        text-align: center;
        }
        
        details {
        background : #FFFFFF;
        border: 2px solid #65553B;
        }

        html, details, summary { line-height: 2.5; }
        details { margin-bottom: 0.25em; line-height: 2.5; }
        
        .button-container {
    	text-align: center;
		}

		.button-container button {
	    display: inline-block;
	    padding: 10px 25px;
	    background : #B0A591;
	    color : #fff;
	    border : 2px solid  #B0A591;
	    border-radius: 8px;
	    margin: 10px;
	    line-height : 1.15;
	
	    
		}
    </style>

<%
n1UserVO loginMember = (n1UserVO)session.getAttribute("loginMember");
String id = loginMember.getUser_id();
n1UserDAO dao = new n1UserDAO();
n3PreferenceVO preferenceVO = dao.PreferenceToPrint(id); %>
</head>
<body>
	<h1><%=loginMember.getUser_nick()%>���� ���� ��Ÿ�� Ȯ��</h1>
    <details class="details">
        <summary>���� ��Ÿ��</summary>
        <ul>
        <li>�⺻����</li>
        <%=preferenceVO.getPeople()%><br>
        <%=preferenceVO.getTransportation()%><br>
        <%=preferenceVO.getPace()%><br>
        <li>����</li>
        <%=preferenceVO.getPoi()%>
        <li>����</li>
        <%=preferenceVO.getFood()%>
        <li>����</li>
        <%=preferenceVO.getSleep()%>
        </ul>
    </details>
    <div class="button-container">
    <button id="modify" onClick="location.href='ConfirmPreference2.jsp'">�����ϱ�</button>
    <button id="create" onClick="location.href='loading.jsp'">���� ���� �����ϱ�</button>
    </div>  
    
    <script>
    // -nickname ��������
    // -���ེŸ�� ��������
    </script> 
</body>
</html>