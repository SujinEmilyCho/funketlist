<%@page import="com.funketlist.db.MyOracle, java.sql.*"%>
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
<%
	request.setCharacterEncoding("UTF-8");
	String id=request.getParameter("id");
	String pw=request.getParameter("pw");
	String name=request.getParameter("name");
	String gender=request.getParameter("gender");
	gender=gender.substring(0, 1);
	String param=request.getParameter("mobileNum");	
	int mobileNum=Integer.parseInt(param);
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	int result=0;
	String sql="insert into accounts values (accounts_seq.nextval, ?, ?, ?, ?, ?)";
	try{
		conn=MyOracle.getConnection();
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, name);
		pstmt.setString(4, gender);
		pstmt.setInt(5, mobileNum);
		result=pstmt.executeUpdate();
		if(result>0){
			out.print("가입을 축하합니다<br/>");
			out.print("로그인 후 이용해주세요");
		}else{
			out.print("다시 시도해주세요");
		}
	}finally{
		if(pstmt!=null)pstmt.close();
		if(conn!=null)conn.close();
	}
%>
	
	<div>
	</div>
<jsp:include page="../template/aside.jsp"/>
<jsp:include page="../template/footer.jsp"/>
</body>
</html>