<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../template/header.jsp"/>
           <center>
            <form action="login_result.jsp" method="post">
	            <input type="text" name="id" placeholder="아이디"/><br/>
	            <input type="password" name="pw" placeholder="비밀번호"/><br/>
	            <input type="submit" value="로그인"/>
            </form>  
           </center>     
    <jsp:include page="../template/aside.jsp"/>
	<jsp:include page="../template/footer.jsp"/>
</body>
</html>