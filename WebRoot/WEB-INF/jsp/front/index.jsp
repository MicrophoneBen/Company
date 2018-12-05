<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0">
	<title>Home</title>
	<jsp:include page="common/link.jsp" />
</head>

<body>
	
	<div class="page-wrapper">
		<jsp:include page="common/index-header.jsp" />
		<jsp:include page="common/index-carousel.jsp" />
		<jsp:include page="common/index-service.jsp" />
		<jsp:include page="common/index-latestNews.jsp" />
		<jsp:include page="common/index-clients.jsp" />
		<jsp:include page="common/footer.jsp" />
	</div>
	
	<jsp:include page="common/script.jsp" />
	
</body>
</html>
