<%@page import="kr.or.nextit.member.service.MemberVo"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>

<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DB Test</title>
<jsp:include page="/inc/lib.jsp"/>
</head>
<body>

<jsp:include page="/inc/navbar.jsp"/>
	<div class="container">
	<h1> DBCP Test </h1>
	<%
		// 1. 드라이버 로딩
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		long startTime = System.currentTimeMillis();

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 2. 연결설정 
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
											   "java", 
											   "oracle");
			// 3. 구문객체 생성    
			pstmt = conn.prepareStatement(" select * from tb_member ");

			// 4. 구문객체 실행
			rs = pstmt.executeQuery();
%>
<table class="table">
<thead>
	<tr>
		<th>아이디</th>
		<th>이름</th>
		<th>이메일</th>
	</tr>
</thead>
<tbody>
<%
			while (rs.next()) {
			StringBuilder params = new StringBuilder();
			params.append("?mem_id=");
			params.append(rs.getString("mem_id"));
			params.append("&mem_pwd=");
			params.append(rs.getString("mem_pwd"));
%>
			<tr>
				<td>
					<a href="<%=request.getContextPath()%>/12/dbConnectionView.jsp<%=params.toString()%>"> 
						<%= rs.getString("mem_id")%>
					</a>
				</td> 
				<td><%= rs.getString("mem_name") %></td>
				<td><%= rs.getString("mem_email") %></td>
			</tr>	
<%
			}
%>
</tbody>
</table>

<%
		} catch (SQLException ex) {
			out.println(ex.getMessage());
			ex.printStackTrace();
		} finally {
			// 6. 자원해제
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {}
			// 7. 연결종료(제일 중요) 
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {}
		}
	%>
	걸린 시간 :
	<%=System.currentTimeMillis() - startTime%>ms

</div>
</body>
</html>