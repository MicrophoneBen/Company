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
        <title>console-EditCase</title>  
        
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
	    		
	    			<!-- 发布案例  -->
	    			<c:if test="${caseAction=='caseRelease'}">
	    				<div class="row">
		    			  <div class="col-md-12">
		    			    <h1 class="page-head-line">案例发布--必须每一项都填写（包括上传文件）</h1>
		    			  </div>
		    			</div>
		    				
		    			<div class="row">
		    			  <div class="col-md-12">
		    			  	
		    			  	<form id="caseEditForm" action="console/caseRelease.action" method="post" enctype="multipart/form-data">
		    			  		
		    			  		<div>
		    			  		  <label for="clientName"><strong>客户名称</strong></label>
				                  <input type="text" class="form-control" id="clientName" name="clientName" placeholder="请输入客户名称" required>
		    			  		</div>		  	
		    			  		
		    			  		<div>
		    			  			<label for="clientLogo"><strong>上传客户图标</strong></label>
		    			  			<input type="file" id="clientLogo" name="clientLogo" required/>
		    			  		</div>
		    			  		
		    			  		<div>
		    			  		  <label for="caseDescribe"><strong>该案例的描述</strong></label>
				                  <textarea id="caseDescribe" name="caseDescribe" class="form-control" rows="5" cols="15" required></textarea>
		    			  		</div>
		    			  		
		    			  		<div>
		    			  			<label for="caseImg"><strong>上传案例图片</strong></label>
		    			  			<input type="file" id="caseImg" name="caseImg" required/>
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
	    			<c:if test="${caseAction=='caseUpdate'}">
	    				<div class="row">
		    			  <div class="col-md-12">
		    			    <h1 class="page-head-line">案例更新--可不上传文件</h1>
		    			  </div>
		    			</div>
		    				
		    			<div class="row">
		    			  <div class="col-md-12">
		    			  	
		    			  	<form id="caseEditForm" action="console/caseUpdate.action" method="post" enctype="multipart/form-data">
		    			  		
		    			  		<div>
		    			  		  <label for="id"><strong>编号</strong></label>
				                  <input type="hidden" class="form-control" id="id" name="id" value="${client.id}" />
		    			  		</div>
		    			  		
		    			  		<div>
		    			  		  <label for="clientName"><strong>客户名称</strong></label>
				                  <input type="text" class="form-control" id="clientName" name="clientName" value="${client.clientName}" required>
		    			  		</div>		  	
		    			  		
		    			  		<div>
		    			  			<label for="clientLogo"><strong>上传客户图标</strong></label>
		    			  			<input type="file" id="clientLogo" name="clientLogo" />
		    			  		</div>
		    			  		
		    			  		<div>
		    			  		  <label for="caseDescribe"><strong>该案例的描述</strong></label>
				                  <textarea id="caseDescribe" name="caseDescribe" class="form-control" rows="5" cols="15" ></textarea>
		    			  		</div>
		    			  		
		    			  		<div>
		    			  			<label for="caseImg"><strong>上传案例图片</strong></label>
		    			  			<input type="file" id="caseImg" name="caseImg" />
		    			  		</div>
		    			  		
		    			  		<hr/>
		    			  		<div>
		    			  			<input class="form-control" id="submitBtn" type="button" value="更新"/>
		    			  		</div>
		    			  		
		    			  		
		    			  	</form>
		    			  	
		    			  </div>
		    			</div>
		    			
		    			<script type="text/javascript">
		    				$("#caseDescribe").val("${client.caseDescribe}");
		    			</script>
		    			
	    			</c:if>
	    			
	    		</div>
	    	</div>
    
    	</div>
    		
    </body>  
    
</html>  
      			
<script>

	$("#submitBtn").on("click",function(){
		$("#caseEditForm").ajaxSubmit({
			success:function(data){
				alert(data);
				location.href='console/caseManage';
			},
			error:function(){alert("请求错误");}
			
		});
	});
	 
</script>