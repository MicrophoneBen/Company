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
        <title>console-EditCore</title>  
             
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
	    		
	    			<!-- 发布核心  -->
	    			<c:if test="${coreAction=='coreRelease'}">
	    				<div class="row">
		    			  <div class="col-md-12">
		    			    <h1 class="page-head-line">核心发布--必须每一项都填写（包括上传文件）</h1>
		    			  </div>
		    			</div>
		    				
		    			<div class="row">
		    			  <div class="col-md-12">
		    			  	
		    			  	<form id="coreEditForm" action="console/coreRelease.action" method="post" enctype="multipart/form-data">
		    			  		
		    			  		<div>
		    			  		  <label for="name"><strong>核心技术名称</strong></label>
				                  <input type="text" class="form-control" id="name" name="corename" placeholder="请输入核心技术名称" required>
		    			  		</div>
		    			  		
		    			  		<div>
		    			  		  <label for="keyword1"><strong>关键词一</strong></label>
				                  <input type="text" class="form-control" id="keyword1" name="keyword1" placeholder="请输入关键词" required>
		    			  		</div>
		    			  		
		    			  		<div>
		    			  		  <label for="describe1"><strong>关键词一的描述</strong></label>
				                  <textarea id="describe1" name="describe1" class="form-control" rows="5" cols="15" required></textarea>
		    			  		</div>
		    			  		
		    			  		<div>
		    			  			<label for="img1"><strong>产品图片一</strong></label>
		    			  			<input type="file" id="img1" name="img1" required/>
		    			  		</div>
		    			  		
		    			  		<div>
		    			  		  <label for="keyword2"><strong>关键词二</strong></label>
				                  <input type="text" class="form-control" id="keyword2" name="keyword2" placeholder="请输入关键词" required>
		    			  		</div>
		    			  		
		    			  		<div>
		    			  		  <label for="describe2"><strong>关键词二的描述</strong></label>
				                  <textarea id="describe2" name="describe2" class="form-control" rows="5" cols="15" required></textarea>
		    			  		</div>
		    			  		
		    			  		<div>
		    			  			<label for="img2"><strong>产品图片一</strong></label>
		    			  			<input type="file" id="img2" name="img2" required/>
		    			  		</div>
		    			  		
		    			  		<hr/>
		    			  		<div>
		    			  			<input class="form-control" id="submitBtn" type="button" value="发布"/>
		    			  		</div>
		    			  		
		    			  		
		    			  	</form>
		    			  	
		    			  </div>
		    			</div>
		    			
	    			</c:if>
	    			
	    			<!-- 更新核心  -->
	    			<c:if test="${coreAction=='coreUpdate'}">
	    				<div class="row">
		    			  <div class="col-md-12">
		    			    <h1 class="page-head-line">核心更新--可不上传文件</h1>
		    			  </div>
		    			</div>
		    				
		    			<div class="row">
		    			  <div class="col-md-12">
		    			  	
		    			  	<form id="coreEditForm" action="console/coreUpdate.action" method="post" enctype="multipart/form-data">
		    			  		
		    			  		<div>
		    			  		  <label for="id"><strong>编号</strong></label>
				                  <input type="hidden" class="form-control" id="id" name="id" value="${core.id}" />
		    			  		</div>
		    			  		
		    			  		<div>
		    			  		  <label for="name"><strong>核心技术名称</strong></label>
				                  <input type="text" class="form-control" id="name" name="corename" value="${core.corename}" required>
		    			  		</div>
		    			  		
		    			  		<div>
		    			  		  <label for="keyword1"><strong>关键词一</strong></label>
				                  <input type="text" class="form-control" id="keyword1" name="keyword1" value="${core.keyword1 }" required>
		    			  		</div>
		    			  		
		    			  		<div>
		    			  		  <label for="describe1"><strong>关键词一的描述</strong></label>
				                  <textarea id="describe1" name="describe1" class="form-control" rows="5" cols="15" required></textarea>
		    			  		</div>
		    			  		
		    			  		<div>
		    			  			<label for="img1"><strong>产品图片一</strong></label>
		    			  			<input type="file" id="img1" name="img1" />
		    			  		</div>
		    			  		
		    			  		<div>
		    			  		  <label for="keyword2"><strong>关键词二</strong></label>
				                  <input type="text" class="form-control" id="keyword2" name="keyword2" value="${core.keyword2 }" required>
		    			  		</div>
		    			  		
		    			  		<div>
		    			  		  <label for="describe2"><strong>关键词二的描述</strong></label>
				                  <textarea id="describe2" name="describe2" class="form-control" rows="5" cols="15" required></textarea>
		    			  		</div>
		    			  		
		    			  		<div>
		    			  			<label for="img2"><strong>产品图片一</strong></label>
		    			  			<input type="file" id="img2" name="img2" />
		    			  		</div>
		    			  		
		    			  		<hr/>
		    			  		<div>
		    			  			<input class="form-control" id="submitBtn" type="button" value="更新"/>
		    			  		</div>
		    			  		
		    			  		
		    			  	</form>
		    			  	
		    			  </div>
		    			</div>
		    			
		    			<script type="text/javascript">
		    				$("#describe1").val("${core.describe1}");
	 						$("#describe2").val("${core.describe2}");
		    			</script>
		    			
	    			</c:if>
	    			
	    		</div>
	    	</div>
    
    	</div>
    		
    </body>  
    
</html>  
      			
<script>

	$("#submitBtn").on("click",function(){
		$("#coreEditForm").ajaxSubmit({
			success:function(data){
				alert(data);
				location.href='console/coreManage';
			},
			error:function(){alert("请求错误");}
			
		});
	});
	 
</script>