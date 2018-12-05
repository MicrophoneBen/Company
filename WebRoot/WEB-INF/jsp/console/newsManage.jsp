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
        <title>console-ManageNews</title>  
        
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
	    					<th>标题</th>
	    					<th>发布时间</th>
	    					<th>是否轮播</th>
	    					<th class="text-center" colspan="3">操作</th>
	    					<th>备注</th>
	    				</tr>
	    				
	    				<c:forEach items="${newsList }" var="news">
	    				
	    					<tr>
	    						<td>${news.title }</td>
	    						<td>${news.time }</td>
	    						<td>
	    							<c:if test="${news.isShow =='0'}">否</c:if>
	    							<c:if test="${news.isShow =='1'}">是</c:if>
	    						</td>
	    						<td class="text-center">
	    							<a href="console/newsDelete.action?newsid=${news.newsid }">
	    								<button type="button" class="btn btn-danger deleteNews">
	    									删除
	    								</button>
	    							</a>
	    						</td>
	    						<td class="text-center">
	    							<a href="console/newsUpdate?newsid=${news.newsid }">
		    							<button  type="button" class="btn btn-info">
											更新
		    							</button>
	    							</a>
	    						</td>
	    						<td class="text-center">
	    							<c:if test="${news.isShow=='1'}">
	    								<a href="console/carouselUpdate.action?newsid=${news.newsid }&isShow=0">
	    									<button type="button" class="btn closeShow">
	    										关闭轮播
	    									</button>
	    								</a>
	    							</c:if>
	    							<c:if test="${news.isShow=='0'}">
	    								<a href="console/carouselUpdate.action?newsid=${news.newsid }&isShow=1">
	    									<button type="button" class="btn openShow">
	    										设为轮播
	    									</button>
	    								</a>
	    							</c:if>
	    						</td>
	    						<td>
	    							<input type="hidden" id="newsid" value="${news.newsid}"/>
	    						</td>
	    					</tr>
	    				
	    				</c:forEach>

	    			</table>
	    					
	    				
	    		</div>	
	    			
	    	
	    	</div>
    
    	</div>
    		
    </body>  
    
</html>  
      			