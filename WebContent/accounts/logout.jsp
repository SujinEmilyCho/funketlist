<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../template/header.jsp"/>
	<div>
		<form action="logout_result.jsp">
			<p>로그아웃하시겠습니까?</p>
			<input type="submit" value="확인"/>
		</form>	
	</div>
<jsp:include page="../template/aside.jsp"/>
<jsp:include page="../template/footer.jsp"/>
</body>
</html>