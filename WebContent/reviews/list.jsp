<%@page import="com.funketlist.db.MyOracle, com.funketlist.dto.reviewBean"%>
<%@page import="java.sql.*, java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	#form_rows{
		margin-left: 10px;
		float: left;
	}
	#form_search{
		margin-right: 10px;
		float: right;
	}
	#reviewBBS{
	  	clear: both;	 
	  	color: gray; 	     	
	}
	#reviewBBS>table{
		width: 900px;
		margin: 0px auto;   
		border-collapse: collapse;      	
	}
	#reviewBBS>table>thead th{		
		border-bottom: 1px solid dimgray;
	}
	#reviewBBS>table>thead th:nth-child(1){
		width: 70px;	
	}
	#reviewBBS>table>thead th:nth-child(3){
		width: 100px;		
	}
	#reviewBBS>table>thead th:nth-child(4){
		width: 90px;		
	}
	#reviewBBS>table td:nth-child(1), #reviewBBS>table td:nth-child(3), #reviewBBS>table td:nth-child(4){
		text-align: center;
	}
	#reviewBBS>table>tbody td{		
		border-bottom: 1px solid lightgray;
	}
	#reviewBBS>table>tbody a{		
		color: gray;
		text-decoration: none;
	}
	#reviewBBS>table>tbody a:hover{		
		text-decoration: underline;
	}
	.pages{
		text-align: center;
	}
	.pages>a{
		color: gray;
		text-decoration: none;
	}
	.pages>a:hover{
		font-weight: bold;
	}
</style>
</head>
<body>
<jsp:include page="../template/header.jsp"/>
<!-- 여기서 useBean 액션태그 쓰려면 jsp:useBean이거를 데이터 개수만큼 해줘야하는 건가? 재사용방법?없나봐! -->
<%
String param=request.getParameter("rows");
String param2=request.getParameter("idx");
String option=request.getParameter("option");
String keyword=request.getParameter("keyword");
String search="";

int rows=10;
if(param!=null){
	rows=Integer.parseInt(param);
}
int idx=0;
if(param2!=null){
	idx=Integer.parseInt(param2);
}
if(option==null){option="id";}
if(keyword==null){
	keyword="";
	search="%%";
}else{search="%"+keyword+"%";}

ArrayList<reviewBean> list=new ArrayList<reviewBean>();

Connection conn=null;
PreparedStatement pstmt=null;
PreparedStatement pstmt2=null;
ResultSet rs=null;
ResultSet rs2=null;
int total=0;
int from=0;
int to=0;
String sql1="select count(*) from reviewBBS where "+option+" like ?";
String sql2="select * from (select num, sub, id, postdate, rownum as rn from reviewBBS where "+option+" like ? order by num) where rn<=? and rn>? order by rn desc";
try{
	conn=MyOracle.getConnection();
	pstmt=conn.prepareStatement(sql1);
	pstmt.setString(1, search);
	rs=pstmt.executeQuery();
	if(rs.next()){
		total=rs.getInt(1);
	}
	pstmt2=conn.prepareStatement(sql2);
	from=total-rows*idx;
	to=from-rows;
	if(to<0){to=0;}
	pstmt2.setString(1, search);
	pstmt2.setInt(2, from);
	pstmt2.setInt(3, to);
	rs2=pstmt2.executeQuery();
	while(rs2.next()){
		reviewBean bean=new reviewBean();
		bean.setNum(rs2.getInt("num"));
		bean.setSub(rs2.getString("sub"));
		bean.setId(rs2.getString("id"));
		bean.setPostdate(rs2.getDate("postdate"));
		list.add(bean);
	}
}finally{
	if(rs!=null){rs.close();}
	if(rs2!=null){rs2.close();}
	if(pstmt!=null){pstmt.close();}
	if(pstmt2!=null){pstmt2.close();}
	if(conn!=null){conn.close();}
} 

%>
	<br/>
	<form action="list.jsp?rows=<%=rows %>" id="form_rows">
		<select name="rows">
			<option value="10">10줄 보기</option>
			<option value="15">15줄 보기</option>
			<option value="20">20줄 보기</option>
		</select>
		<input type="submit" value="선택"/>
	</form>
	<form action="list.jsp?&option=<%=option%>&keyword=<%=keyword%>" id="form_search">
		<select name="option">
			<option value="id">글쓴이</option>
			<option value="sub">제목</option>
			<option value="content">내용</option>
		</select>
		<input type="text" name="keyword"/>
		<input type="submit" value="검색"/>
	</form>
	<div id="reviewBBS">	
		<br/>
		<table>
			<thead>
			<tr>
				<th>글번호</th>
				<th>글제목</th>
				<th>글쓴이</th>
				<th>작성일</th>
			</tr>
			</thead>
			<tbody>
			<%
			for(int i=0; i<list.size(); i++){ 
			%>
			<tr>			
				<td><%=list.get(i).getNum() %></td>
				<td><a href="detail.jsp?num=<%=list.get(i).getNum()%>"><%=list.get(i).getSub() %></a></td>
				<td><%=list.get(i).getId() %></td>
				<td><%=list.get(i).getPostdate() %></td>
			</tr>				
			<%}%>
			</tbody>
		</table>
		<br/>
	</div>
	<div class="pages">
	<%
		int totalPages=total/rows;
		if(total%rows!=0){totalPages++;}
		int nthBundle=idx/10;
		int lastPage=nthBundle*10+10;
		if(lastPage>totalPages){
			lastPage=totalPages;
		}
		if(nthBundle>0){
	%>
		<a href="list.jsp?rows=<%=rows %>&idx=<%=nthBundle*10-1 %>&option=<%=option%>&keyword=<%=keyword%>">&lt;이전&nbsp;</a>
	<%	}
		for(int i=nthBundle*10; i<lastPage; i++){			
	%>
		<a href="list.jsp?rows=<%=rows %>&idx=<%=i %>&option=<%=option%>&keyword=<%=keyword%>">&nbsp;<%=i+1 %>&nbsp;</a>
	<%	}
		if(nthBundle!=(totalPages-1)/10){
	%>
		<a href="list.jsp?rows=<%=rows %>&idx=<%=lastPage%>&option=<%=option%>&keyword=<%=keyword%>">&nbsp;다음&gt;</a>
	<%	} %>
	<br/><br/><br/>
	</div>	
<jsp:include page="../template/aside.jsp"/>
<jsp:include page="../template/footer.jsp"/>
</body>
</html>