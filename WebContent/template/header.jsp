<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<link rel="stylesheet" type="text/css" href="/funketlist/style.css"/>   
	<title>��Ŷ����Ʈ</title>
</head>
<body>
	<header>
	    <h1><a href="/funketlist/index.jsp">��Ŷ����Ʈ</a></h1>
	<!--            <img alt="pin-Icon" src="/funketlist/imgs/pin2.jpg"/>-->
	    <div>
	        <input type="text" id="search" value="���� ���� ��������?"/>
	        <a href="#"><img alt="search-img" src="/funketlist/imgs/search-Icon.png"></a>
	        <ul>
	        <% if(session.getAttribute("userID")==null){%>
	        	<li><a href="/funketlist/accounts/login.jsp">�α���</a></li>
	        	<li><a href="/funketlist/accounts/createAccount.jsp">ȸ������</a></li>
	        <%}else{%>
	        	<li><a href="/funketlist/accounts/logout.jsp">�α׾ƿ�</a></li>
	        	<li><a href="#">������</a></li>
	        <%} %>
	        </ul>
	    </div>            
	</header> 
    
    <nav>
        <ul>
            <li><a href="#">������</a></li>
            <li><a href="#">����</a></li>
            <li><a href="#">������</a></li>
            <li><a href="/funketlist/reviews/list.jsp">�ı�</a></li>
            <li><a href="#">F&amp;A</a></li>
<!--                <li><a href="#">���α׷�</a></li>-->
<!--                <li><a href="#">����/����</a></li>-->
        </ul>
    </nav>
	   <!-- header ��! --> 
  	<section>
  	  	<div>
</body>
</html>