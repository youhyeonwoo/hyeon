<%@page import="kr.or.nextit.common.utils.CookieBox"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	쿠키 생성 전체 적용하는 쿠키 <br>
	<a href="<%=request.getContextPath()%>/10/viewCookie.jsp" target="_blank"> 
	전체 보이는 쿠키 이동</a>
	<%
	String[] domains = {"127.0.0.1", "localhost"};
	
	for(String domain: domains){
		
		Cookie cookieAll = new Cookie("title", URLEncoder.encode("존경하는 여러분 ~~","UTF-8"));
		cookieAll.setDomain(domain);
		cookieAll.setPath("/");
		cookieAll.setMaxAge(20);
		response.addCookie(cookieAll);
		
	}
%>
	쿠키 생성 review 적용하는 쿠키 <br>
	<a href="<%=request.getContextPath()%>/review/viewCookie.jsp" target="_blank"> 
	review 보이는 쿠키 이동</a>
	<%
	Cookie cookieItem = new Cookie("review", URLEncoder.encode("사랑하는 여러분 ~~","UTF-8"));
	cookieItem.setDomain("127.0.0.1");
	cookieItem.setPath("/review");
	cookieItem.setMaxAge(20);
	response.addCookie(cookieItem);
	%>
	
	<br><br>
	쿠키 utils(API) 활용 <br>
		<a href="<%=request.getContextPath()%>/10/viewCookieBox.jsp" target="_blank"> 
	view CookieBox 보이는 쿠키 이동</a>
	<%
		CookieBox cookieBox = new CookieBox(request);
		
		Cookie userCookie =  cookieBox.createCookie("userCookie", "홍길동");
		response.addCookie(userCookie);
		
		Cookie userCookie2 = CookieBox.createCookie("userCookie2", "오하영",  "/");
		response.addCookie(userCookie2);
		
		response.addCookie(CookieBox.createCookie("userCookie3", "고생하셨어요~~", "/", 20));
		
	%>
	


</body>
</html>