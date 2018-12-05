<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<%  
    String path = request.getContextPath();  
    String basePath = request.getScheme() + "://"  
            + request.getServerName() + ":" + request.getServerPort()  
            + path + "/";  
%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
    <head>  
        <base href="<%=basePath%>">  
        <title>console-ManageService</title>  

		<%@ include file="common/link.jsp" %>
		
    </head>

    <body>  
    	
    	<div id="wrapper">
	  		<!-- 引入nav导航条 -->
	    	<%@ include file="common/nav-top.jsp" %>
	    	<%@ include file="common/nav-side.jsp" %>
	    	
	    	<!-- 在这里开始写主体 -->
	    	<div id="page-wrapper">
	    		<div id="page-inner">
	    			
	    			<table class="table table-hover table-bordered">
	    				<tr>
	    					<th>编号</th>
	    					<th>名称</th>
	    					<th>类型</th>
	    					<th class="text-center" colspan="2">操作</th>
	    				</tr>
	    				
	    				<c:forEach items="${serviceList}" var="service">
	    				
	    					<tr>
	    						<td>${service.id }</td>
	    						<td>${service.servicename}</td>
	    						<td>
	    							<c:if test="${service.type=='intelligentVideo'}">
	    								智能视频
	    							</c:if>
	    							<c:if test="${service.type=='authentication'}">
	    								身份验证
	    							</c:if>
	    							<c:if test="${service.type=='internet'}">
	    								移动互联网
	    							</c:if>
	    							<c:if test="${service.type=='other'}">
	    								其他
	    							</c:if>
	    						</td>
	    						
	    						<td class="text-center">
	    							<a href="console/serviceDelete.action?id=${service.id }">
	    								<button type="button" class="btn btn-danger deleteNews">
	    									删除
	    								</button>
	    							</a>
	    						</td>
	    						
	    						<td class="text-center">
	    							<a href="console/serviceUpdate?id=${service.id }">
		    							<button  type="button" class="btn btn-info">
											更新
		    							</button>
	    							</a>
	    						</td>
	    						
	    					</tr>
	    				
	    				</c:forEach>

	    			</table>
	    					
	    				
	    		</div>	
	    			
	    	
	    	</div>
    
    	</div>
    		
    </body>  
    
</html>  
      			