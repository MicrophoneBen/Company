<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0">
	<title>客户案例</title>
	<jsp:include page="common/link.jsp" />
	
	<style type="text/css">
		.panel{
			box-shadow:3px 3px 8px #777;
			margin-bottom:15px;
		}
	</style>
	
</head>

<body>
	
	<div class="page-wrapper">
		<jsp:include page="common/index-header.jsp" />
		
		<section class="clients-section" style="margin-top:30px;">
			<div class="auto-container">
			
				<div class="sec-title">
            		<h2>客户案例</h2>
                	<div class="text">做每一位客户最美的期待</div>
            	</div>
            	
            	<c:forEach items="${clients}" var="client">
					<div class="row">
		   			  <div class="panel">
		   				<div class="panel-body">
		   					<div class="col-md-2">
		   						<img style="margin-top:60px;width:100%;" src="${client.clientLogoAddr }" />
		   					</div>
		   					<div class="col-md-6">
		   						<h1>
		   							${client.clientName }
		   						</h1>
		   						<br/><br/>
		   						<p>
		   							${client.caseDescribe }
		   						</p>
		   					</div>
		   					<div class="col-md-4">
		   						<img alt="#" src="${client.caseImgAddr }" style="width:100%;height:280px">
		   					</div>
		   				</div>
		   			  </div>
		   			</div>            	
            	</c:forEach>
            	
			</div>
		</section>
		
		<jsp:include page="common/footer.jsp" />
	</div>
	
	<jsp:include page="common/script.jsp" />
	
</body>
</html>
