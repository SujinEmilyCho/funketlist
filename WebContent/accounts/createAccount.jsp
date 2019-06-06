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
	<div>
		<form action="createAccount_result.jsp" method="post">
			<label for="id">아이디</label><br/>
			<input type="text" name="id"/><br/><br/>
			<label for="pw">비밀번호</label><br/>
			<input type="password" name="pw"/><br/><br/>
			<label for="pw2">비밀번호 재확인</label><br/>
			<input type="password" name="pw2"/><br/><br/>
			<label for="name">이름</label><br/>
			<input type="text" name="name"/><br/><br/>
			<label for="gender">성별</label><br/>
			<select name="gender">
				<option>남자</option>
				<option>여자</option>
			</select><br/><br/>
			<label for="mobileNum">휴대전화</label><br/>
			<input type="text" name="mobileNum"/><br/><br/>
			<input type="submit" value="가입하기"/><br/>
		</form>
	</div>
<jsp:include page="../template/aside.jsp"/>
<jsp:include page="../template/footer.jsp"/>
</body>
</html>