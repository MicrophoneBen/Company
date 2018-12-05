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
        <title>console-ManageCase</title>  
        
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
	    					<th>客户名称</th>
	    					<th class="text-center" colspan="2">操作</th>	
	    				</tr>
	    				
	    				<c:forEach items="${caseList }" var="client">
	    				
	    					<tr>
	    						<td>${client.id }</td>
	    						<td>${client.clientName }</td>	
	    						<td>
	    							<a href="console/caseUpdate?id=${client.id }">
		    							<button  type="button" class="btn btn-info">
											更新
		    							</button>
	    							</a>
	    						</td>
	    						<td>
	    							<a href="console/caseDelete.action?id=${client.id }">
		    							<button  type="button" class="btn btn-danger">
											删除
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
      			