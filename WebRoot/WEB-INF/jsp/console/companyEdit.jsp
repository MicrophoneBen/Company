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
        <title>console-EditCompany</title>  
         
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
	    			<!-- 更新  -->
	    			
	    				<div class="row">
		    				<div class="col-md-12">
		    					<h1 class="page-head-line">资料更新</h1>
		    				</div>
		    			</div>
		    				
		    			<div class="row">
		    				<div class="col-md-12">
		    					<!-- 更新表格 -->
		    					<form id="companyEditForm" method="post" action="console/companyUpdate.action"  enctype="multipart/form-data">
		    						<div>
		    							<input type="hidden" name="id" value="${company.id }" />
		    						</div>
		    						
				     				<div>
				              			<label for="companyName"><strong>公司名字</strong></label>
				                		<input type="text" class="form-control" id="companyName" name="companyName" value="${company.companyName }" required>
				            		</div>
				            		
				            		<div>
				              			<label for="address"><strong>公司地址</strong></label>
				                		<input type="text" class="form-control" id="address" name="address" value="${company.address }" required>
				            		</div>
					      			
					      			<div>
				              			<label for="email"><strong>公司邮箱</strong></label>
				                		<input type="text" class="form-control" id="email" name="email" value="${company.email }" required>
				            		</div>
				            		
				            		<div>
				              			<label for="telephone"><strong>公司电话</strong></label>
				                		<input type="text" class="form-control" id="telephone" name="telephone" value="${company.telephone}" required>
				            		</div>
				            		<div>
				            			<label for="logo"><strong>公司图标</strong></label>
				            			<input type="file" class="form-control" id="logo" name="logo" />
				            		</div>
					      			<hr/>
					      			<div>
						      			<textarea name="content" id="myEditor">
						      				${company.content}
						      			</textarea> 
						      			  
						      			 <!-- 实例化编辑器 --> 
						       			<script type="text/javascript">
						       				//实例化编辑器  
						           			var editor = UE.getEditor('myEditor');
						       			</script>
					       			</div>
					       			<hr/>
					       			<!-- 按钮 -->
					       			<div class="text-right">
					       				<input class="form-control" id="submitBtn" type="button" value="更新"/>
					       			</div>
					       					
				        		</form>
		    					
		    				</div>
		    			</div>
	    			
	    			
	    			
	    		</div>
	    	</div>
    
    	</div>
    		
    </body>  
    
</html>  
      			
<script>

	$("#submitBtn").on("click",function(){
		$("#companyEditForm").ajaxSubmit({
			success:function(data){
				alert(data);
				location.href='console/home';
			},
			error:function(){alert("请求错误");}
			
		});
	});
	
</script>