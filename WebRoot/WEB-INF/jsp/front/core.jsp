<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0">
	<title>${core.corename }</title>
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
		
		<section class="core-section" style="margin-top:30px;">
    		<div class="auto-container">
    			
    			<div class="sec-title">
            		<h2>${core.corename }</h2>
            	</div>
            	
            	<div class="row panel">
	    			<div class="panel-body">
		    			<div class="col-md-3">
		    				<h2 style="margin-top:20px">${core.keyword1 }</h2>
		    				<hr/>
		    				<p>
		    					${core.describe1 }
		    				</p>
		    			</div>
		    			<div class="col-md-9">
		    				<img src="${core.img1Addr }" alt="#" style="width:100%;height:320px"/>
		    			</div>
	    			</div>
	    		</div>
	    		
	    		<div class="row panel">
	    			<div class="panel-body">
		    			<div class="col-md-3">
		    				<h2 style="margin-top:20px">${core.keyword2 }</h2>
		    				<hr/>
		    				<p>
		    					${core.describe2 }
		    				</p>
		    			</div>
		    			<div class="col-md-9">
		    				<img src="${core.img2Addr }" alt="#" style="width:100%;height:320px"/>
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
