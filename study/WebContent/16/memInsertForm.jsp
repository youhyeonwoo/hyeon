<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@page import="kr.or.nextit.function.service.CommCodeVo"%>
<%@page import="kr.or.nextit.function.service.impl.ComCodeServiceImpl"%>
<%@page import="kr.or.nextit.function.service.ComCodeService"%>
<%@page import="java.util.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
	request.setCharacterEncoding("UTF-8");

	ComCodeService codeService = new ComCodeServiceImpl();
	
	List<CommCodeVo> hobbys = codeService.getCodeList("A1");
	List<CommCodeVo> sexs = codeService.getCodeList("B2");

	request.setAttribute("hobbys", hobbys);
	request.setAttribute("sexs", sexs);
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 관리</title>
<jsp:include page="/inc/lib.jsp"></jsp:include>
</head>
<body>

	<jsp:include page="/inc/navbar.jsp"></jsp:include>

	<div class="container">
		<h3>회원가입</h3>
		
	<c:url var="actionUrl" value="/16/memInsertProc.jsp"></c:url>
	<form action="${actionUrl}" method="post">
	
		<table class="table">
			<tbody>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="userId" value="${param.userId }"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="userPw" value="${param.userPw }"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="userName" value="${param.userName }"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<select name="userSex">
							<c:forEach var="item" items="${sexs}">
								<option value="${item.key }" 
									    ${param.userSex eq item.key ? 'selected="selected"':'' } 
								> ${item.value } </option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>취미</td>
					<td>
					<% 
						String[] userHobby = request.getParameterValues("userHobby"); 
					%>
					<c:set var="hobbyItem" value="<%=userHobby %>"></c:set>
					
					<c:forEach var="item" items="${hobbys}">
						<input type="checkbox" name="userHobby" value="${item.key }" 
						   	
						   	<c:forEach var="hobby" items="${hobbyItem}">
							 ${hobby eq item.key ? 'checked="checked"' : ''}
							<c:if test="${hobby eq item.key}">
								checked="checked"
							</c:if>		
							</c:forEach>
							
						> ${item.value } <br>
					</c:forEach>
					
					</td>
					
					
				</tr>
				<tr>
					<td colspan="2">
						<button type="submit">가입</button>
					</td>
				</tr>
			</tbody>
		</table>

</form>
	</div>
</body>
</html>