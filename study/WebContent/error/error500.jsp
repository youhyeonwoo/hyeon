<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isErrorPage="true" %>   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here (넥스트 IT)</title>

<c:import url="/inc/lib.jsp"></c:import>

</head>
<body>

	<c:import url="/inc/navbar.jsp"></c:import>
	<div class="container">
	
		시스템에서 에러가 발생 하였어요..
		<hr>
		김규리 관리자에게 전화를 하세용... (000-000-0000)
		<hr>
		<pre>
		김규리가 알려주는 에러 메시지~~~ <br>
		에러 타입 : <%=exception.getClass().getName() %>  
		에러 메시지 : <%=exception.getMessage() %> 
		</pre>
	</div>
	
</body>
</html>




