<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<link rel="stylesheet" type="text/css" href="/funketlist/style.css"/>   
	<title>펀킷리스트</title>
</head>
<body>
	<header>
	    <h1><a href="/funketlist/index.jsp">펀킷리스트</a></h1>
	<!--            <img alt="pin-Icon" src="/funketlist/imgs/pin2.jpg"/>-->
	    <div>
	        <input type="text" id="search" value="어디로 가고 싶으세요?"/>
	        <a href="#"><img alt="search-img" src="/funketlist/imgs/search-Icon.png"></a>
	        <ul>
	        <% if(session.getAttribute("userID")==null){%>
	        	<li><a href="/funketlist/accounts/login.jsp">로그인</a></li>
	        	<li><a href="/funketlist/accounts/createAccount.jsp">회원가입</a></li>
	        <%}else{%>
	        	<li><a href="/funketlist/accounts/logout.jsp">로그아웃</a></li>
	        	<li><a href="#">내계정</a></li>
	        <%} %>
	        </ul>
	    </div>            
	</header> 
    
    <nav>
        <ul>
            <li><a href="#">여행지</a></li>
            <li><a href="#">축제</a></li>
            <li><a href="#">원데이</a></li>
            <li><a href="/funketlist/reviews/list.jsp">후기</a></li>
            <li><a href="#">F&amp;A</a></li>
<!--                <li><a href="#">프로그램</a></li>-->
<!--                <li><a href="#">문의/예약</a></li>-->
        </ul>
    </nav>
	   <!-- header 끝! --> 
  	<section>
  	  	<div>
</body>
</html>