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
	    			<c:if test="${serviceAction=='serviceRelease'}">
	    				<div class="row">
		    			  <div class="col-md-12">
		    			    <h1 class="page-head-line">产品发布--必须每一项都填写（包括上传文件）</h1>
		    			  </div>
		    			</div>
		    				
		    			<div class="row">
		    			  <div class="col-md-12">
		    			  	
		    			  	<form id="serviceEditForm" action="console/serviceRelease.action" method="post" enctype="multipart/form-data">
		    			  		
		    			  		<div>
		    			  		  <label for="name"><strong>产品名称</strong></label>
				                  <input type="text" class="form-control" id="name" name="servicename" placeholder="请输入产品名称" required>
		    			  		</div>
		    			  		
		    			  		<div>
		    			  		  <label for="describe"><strong>产品描述</strong></label>
				                  <textarea id="describe" name="servicedescribe" class="form-control" rows="5" cols="15" required></textarea>
		    			  		</div>
		    			  		
		    			  		<div>
		    			  		  <label for="type"><strong>产品类型</strong></label>
				                  <select id="type" name="type" class="form-control" required>
				                  	<option value="intelligentVideo">智能视频</option>
				                  	<option value="authentication">身份验证</option>
				                  	<option value="internet">移动互联网</option>
				                  	<option value="other">其他</option>
				                  </select>
		    			  		</div>
		    			  		
		    			  		<div>
		    			  		  <label for="adv1"><strong>产品优势一</strong></label>
				                  <input type="text" class="form-control" id="adv1" name="adv1" placeholder="请输入产品优势(简短)"  required>
		    			  		</div>
		    			  		
		    			  		<div>
		    			  			<label for="img1"><strong>产品图片一</strong></label>
		    			  			<input type="file" id="img1" name="img1" required/>
		    			  		</div>
		    			  		
		    			  		<div>
		    			  		  <label for="adv2"><strong>产品优势二</strong></label>
				                  <input type="text" class="form-control" id="adv2" name="adv2" placeholder="请输入产品优势(简短)" required>
		    			  		</div>
		    			  		
		    			  		<div>
		    			  			<label for="img2"><strong>产品图片二</strong></label>
		    			  			<input type="file" id="img2" name="img2" required/>
		    			  		</div>
		    			  		
		    			  		<div>
		    			  		  <label for="adv3"><strong>产品优势三</strong></label>
				                  <input type="text" class="form-control" id="adv3" name="adv3" placeholder="请输入产品优势(简短)" required>
		    			  		</div>
		    			  		
		    			  		<div>
		    			  			<label for="img3"><strong>产品图片三</strong></label>
		    			  			<input type="file" id="img3" name="img3" required/>
		    			  		</div>
		    			  		
		    			  		<hr/>
		    			  		<div>
		    			  			<input class="form-control" id="submitBtn" type="button" value="发布"/>
		    			  		</div>
		    			  		
		    			  		
		    			  	</form>
		    			  	
		    			  </div>
		    			</div>
		    			
	    			</c:if>
	    			
	    			<!-- 更新新闻  -->
	    			<c:if test="${serviceAction=='serviceUpdate'}">
	    				<div class="row">
		    			  <div class="col-md-12">
		    			    <h1 class="page-head-line">产品更新--文件可不上传</h1>
		    			  </div>
		    			</div>
		    				
		    			<div class="row">
		    			  <div class="col-md-12">
		    			  	
		    			  	<form id="serviceEditForm" action="console/serviceUpdate.action" method="post" enctype="multipart/form-data">
		    			  		<input type="hidden" name="id" value="${service.id }"/>
		    			  		<div>
		    			  		  <label for="name"><strong>产品名称</strong></label>
				                  <input type="text" class="form-control" id="name" name="servicename"  value="${service.servicename}" required>
		    			  		</div>
		    			  		
		    			  		<div>
		    			  		  <label for="describe"><strong>产品描述</strong></label>
				                  <textarea id="describe" name="servicedescribe" class="form-control" rows="5" cols="15"  required></textarea>
		    			  		</div>
		    			  		
		    			  		<div>
		    			  		  <label for="type"><strong>产品类型</strong></label>
				                  <select id="type" name="type" class="form-control" required>
				                  	<option value="intelligentVideo">智能视频</option>
				                  	<option value="authentication">身份验证</option>
				                  	<option value="internet">移动互联网</option>
				                  	<option value="other">其他</option>
				                  </select>
		    			  		</div>
		    			  		
		    			  		<div>
		    			  		  <label for="adv1"><strong>产品优势一</strong></label>
				                  <input type="text" class="form-control" id="adv1" name="adv1" value="${service.adv1 }" required/>
		    			  		</div>
		    			  		
		    			  		<div>
		    			  			<label for="img1"><strong>产品图片一</strong></label>
		    			  			<input type="file" id="img1" name="img1" required/>
		    			  		</div>
		    			  		
		    			  		<div>
		    			  		  <label for="adv2"><strong>产品优势二</strong></label>
				                  <input type="text" class="form-control" id="adv2" name="adv2" value="${service.adv1 }" required/>
		    			  		</div>
		    			  		
		    			  		<div>
		    			  			<label for="img2"><strong>产品图片二</strong></label>
		    			  			<input type="file" id="img2" name="img2" />
		    			  		</div>
		    			  		
		    			  		<div>
		    			  		  <label for="adv3"><strong>产品优势三</strong></label>
				                  <input type="text" class="form-control" id="adv3" name="adv3" value="${service.adv1 }" required />
		    			  		</div>
		    			  		
		    			  		<div>
		    			  			<label for="img3"><strong>产品图片三</strong></label>
		    			  			<input type="file" id="img3" name="img3" />
		    			  		</div>
		    			  		
		    			  		<hr/>
		    			  		<div>
		    			  			<input class="form-control" id="submitBtn" type="button" value="更新"/>
		    			  		</div>
		    			  		
		    			  		
		    			  	</form>
		    			  	
		    			  	<script type="text/javascript">
		    			  			$("#describe").val("${service.servicedescribe }");
									$("#type option[value='${service.type}']").attr("selected",true);
		    			  	</script>
		    			  	
		    			  </div>
		    			</div>
		    			
	    			</c:if>
	    			
	    		</div>
	    	</div>
    
    	</div>
    		
    </body>  
    
</html>  
      			
<script>

	$("#submitBtn").on("click",function(){
		$("#serviceEditForm").ajaxSubmit({
			success:function(data){
				alert(data);
				location.href='console/serviceManage';
			},
			error:function(){alert("请求错误");}
			
		});
	});
	
</script>