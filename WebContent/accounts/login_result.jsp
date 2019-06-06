<%@page import="com.funketlist.db.MyOracle"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%
	String id=request.getParameter("id");
	String pw=request.getParameter("pw");
	String userID=null;
	String userName=null;
	
	Connection conn=null;	
	Statement stmt=null;
	ResultSet rs=null;	
	String sql="select id, name from accounts where id='"+id+"' and pw='"+pw+"'";

	try{
		conn=MyOracle.getConnection();
		stmt=conn.createStatement();
		rs=stmt.executeQuery(sql);
		if(rs.next()){
			userID=rs.getString(1);
			userName=rs.getString(2);
		}
	}finally{
		if(rs!=null)rs.close();
		if(stmt!=null)stmt.close();
		if(conn!=null)conn.close();
	}
	if(userID==null){
		out.println("로그인에 실패하였습니다");
	}else{
		session.setAttribute("userID", userID);
		session.setAttribute("userName", userName);
%>
<jsp:include page="../template/header.jsp"/>
<%
		out.println(userName+"님 환영합니다");
	} 
%>
<jsp:include page="../template/aside.jsp"/>
<jsp:include page="../template/footer.jsp"/>
</body>
</html>