<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <title>console-ReleaseNews</title>  
         
         
        <!-- ueditor配置文件 -->  
        <script type="text/javascript" src="ueditor/ueditor.config.js"></script>  
        <!-- 编辑器源码文件 -->  
        <script type="text/javascript" src="ueditor/ueditor.all.js"></script>  
        <!-- 语言包文件(建议手动加载语言包，避免在ie下，因为加载语言失败导致编辑器加载失败) -->  
        <script type="text/javascript" src="ueditor/lang/zh-cn/zh-cn.js"></script>

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
	    		
	    			<!-- 发布新闻  -->
	    			<c:if test="${newsAction=='newsRelease'}">
	    				<div class="row">
		    				<div class="col-md-12">
		    					<h1 class="page-head-line">新闻发布</h1>
		    				</div>
		    			</div>
		    				
		    			<div class="row">
		    				<div class="col-md-12">
		    					<!-- 发布新闻表格 -->
		    					<form id="newsEditForm" onsubmit="return false">
		    						<div>
		    							<input type="hidden" name="newsAction" value="newsRelease" />
		    						</div>
		    						<!-- 新闻标题 -->
				     				<div>
				              			<label for="title"><strong>标题</strong></label>
				                		<input type="text" class="form-control" id="title" name="title" placeholder="请输入新闻标题" required>
				            		</div>
				            		
				            		<!-- 是否轮播 -->
				            		<div>
				            			<span><strong>是否设置为轮播:</strong></span>
				            			
				            			<input type="radio"  id="isShow_true" name="isShow" value="1"/>
				            			<label for="isShow_true">是</label>
				            			
				            			<input type="radio"  id="isShow_false" name="isShow" value="0" checked/>
				            			<label for="isShow_false">否</label>
				            			
				            		</div>
				            		
					      			 <hr/>
					      			 
					      			<textarea name="content" id="myEditor"></textarea> 
					      			  
					      			 <!-- 实例化编辑器 --> 
					       			<script type="text/javascript">
					       				//实例化编辑器  
					           			var editor = UE.getEditor('myEditor');
					       			</script>
					       			
					       			<hr/>
					       			<!-- 按钮 -->
					       			<div class="text-right">
					       				<button class="btn btn-default btn-danger" onclick="clearEditor()">清空输入</button>
					       				<button class="btn btn-default btn-info" onclick="newsEdit()">提交</button>
					       			</div>
					       					
				        		</form>
		    					
		    				</div>
		    			</div>
	    			</c:if>
	    			
	    			
	    			<!-- 更新新闻  -->
	    			<c:if test="${newsAction=='newsUpdate'}">
	    				<div class="row">
		    				<div class="col-md-12">
		    					<h1 class="page-head-line">新闻更新</h1>
		    				</div>
		    			</div>
		    				
		    			<div class="row">
		    				<div class="col-md-12">
		    					<!-- 更新新闻表格 -->
		    					<form id="newsEditForm" onsubmit="return false">
		    						<div>
		    							<input type="hidden" name="newsAction" value="newsUpdate" />
		    						</div>
		    						<!-- 编号 -->
		    						<div>
		    							<label>新闻编号</label>
		    							<input type="text" class="form-control" name="newsid" value="${news.newsid}" disabled="disabled"/>
		    						</div>
		    						<!-- 标题 -->
				     				<div>
				              			<label for="title"><strong>标题</strong></label>
				                		<input type="text" class="form-control" id="title" name="title" value="${news.title }" required>
				            		</div>
				            		
				            		<!-- 是否轮播 -->
				            		<div>
				            			<span><strong>是否设置为轮播:</strong></span>
				            			
				            			<input type="radio"  id="isShow_true" name="isShow" value="1"/>
				            			<label for="isShow_true">是</label>
				            			
				            			<input type="radio"  id="isShow_false" name="isShow" value="0"/>
				            			<label for="isShow_false">否</label>
				            			
				            			<script type="text/javascript">
				            				if(${news.isShow}==1)
				            					document.getElementById("isShow_true").checked = true;
				            				else
				            					document.getElementById("isShow_false").checked = true;
				            			</script>
				            			
				            		</div>
				            		
					      			 <hr/>
					      			 
					      			<textarea name="content" id="myEditor">
					      				${news.content }
					      			</textarea> 
					      			  
					      			 <!-- 实例化编辑器 --> 
					       			<script type="text/javascript">
					       				//实例化编辑器  
					           			var editor = UE.getEditor('myEditor');
					       			</script>
					       			
					       			<hr/>
					       			<!-- 按钮 -->
					       			<div class="text-right">
					       				<button class="btn btn-default btn-danger" onclick="clearEditor()">清空输入</button>
					       				<button class="btn btn-default btn-info" onclick="newsEdit()">更新</button>
					       			</div>
					       					
				        		</form>
		    					
		    				</div>
		    			</div>
	    			</c:if>
	    			
	    			
	    		</div>
	    	</div>
    
    	</div>
    		
    </body>  
    
</html>  
      			
<script>

	function clearEditor()
	{
		UE.getEditor('myEditor').setContent('',false);
	}
	
</script>