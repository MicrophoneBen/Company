<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0">
	<title>关于我们</title>
	<jsp:include page="common/link.jsp" />
</head>

<body>
	
	<div class="page-wrapper">
		<jsp:include page="common/index-header.jsp" />
		
		<section class="about-section" style="margin-top:30px;">
			<div class="auto-container">
			
				<div class="sec-title">
            		<h2>${company.companyName }</h2>
                	<div class="text">地址:${company.address }|邮箱:${company.email}|电话:${company.telephone }</div>
            	</div>
            	
            	<hr/>
            	
            	<div>
            		${company.content }
            	</div>
            	
			</div>
		</section>
		
		<jsp:include page="common/footer.jsp" />
	</div>
	
	<jsp:include page="common/script.jsp" />
	
</body>
</html>
