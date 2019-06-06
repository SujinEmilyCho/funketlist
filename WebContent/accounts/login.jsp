<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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