<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0">
	<title>${service.servicename }</title>
	<jsp:include page="common/link.jsp" />
	
	<style type="text/css">
		.serviceBox{
			box-shadow:3px 3px 8px #777;
		}
	</style>
	
</head>

<body>
	
	<div class="page-wrapper">
		<jsp:include page="common/index-header.jsp" />
		
		<!--Page Title-->
	    <section class="page-title" style="background-image:url(<%=request.getContextPath() %>/assets/images/background/pattern-2.png);">
	    	<div class="auto-container">
	        	<div class="inner-box">
	                <h1>${service.servicename }</h1>
	                <div class="bread-crumb">
	                	${service.servicedescribe }
	                </div>
	            </div>
	        </div>
	    </section>
		
		<section style="margin-top:30px;">
			<div class="auto-container">
				
				<div class="sec-title">
            		<h2>产品优势</h2>
                	<div class="text">三大优势助跑互联网时代</div>
            	</div>
			
				<div class="row">
				
					<div class="col-md-4">
						<div class="serviceBox panel">
							<img style="width:100%;height:280px" src="${service.img1Addr }">
							<div class="panel-body">
	    						${service.adv1 }
	    					</div>
						</div>
					</div>
					
					<div class="col-md-4">
						<div class="serviceBox panel">
							<img style="width:100%;height:280px" src="${service.img2Addr }">
							<div class="panel-body">
	    						${service.adv2 }
	    					</div>
						</div>
					</div>
					
					<div class="col-md-4">
						<div class="serviceBox panel">
							<img style="width:100%;height:280px" src="${service.img3Addr }">
							<div class="panel-body">
	    						${service.adv3 }
	    					</div>
						</div>
					</div>
					
				</div>
			</div>
		</section>
		
		<jsp:include page="common/footer.jsp" />
	</div>
	
	<jsp:include page="common/script.jsp" />
	
</body>
</html>
