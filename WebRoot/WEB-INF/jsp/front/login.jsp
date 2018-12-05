<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>登陆</title>
    
	<link href="assets/css/bootstrap.css" rel="stylesheet" />
	<script type="text/javascript" src="assets/js/my.js"></script>
	
  </head>
  
  <body>
  	
  	<div class="container">
        <div class="row text-center " style="padding-top:100px;">
            <div class="col-md-12">
                <h1>管理后台登陆</h1>
            </div>
        </div>

         <div class="row">   
            <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">        
                <div class="panel-body">

                    <form role="form" onsubmit="return false" id="loginForm" method="post">
                        <hr />
						<!-- 用户名 -->
                        <div class="form-group input-group">
                            <span class="input-group-addon"><i class="fa fa-tag"  ></i></span>
                            <input type="text" name="username" class="form-control" placeholder="输入你的用户名" />
                        </div>
                        <!-- 密码 -->
                        <div class="form-group input-group">
                            <span class="input-group-addon"><i class="fa fa-lock"  ></i></span>
                            <input type="password" name="password" class="form-control"  placeholder="输入你的密码" />
                        </div>
                        <!-- 验证码 -->
                        <div class="row form-group input-group">
                        	<div class="col-sm-7">
                        		<input class="form-control" type="text" id="verifyCode" name="verifyCode" maxlength="4" placeholder="请输入验证码" required>
                        	</div>
                            
                            <div class="col-sm-5">
                                <img src="getVerifyCode.action" id="codeImage"  onClick="getVerifyCode()"/>
                            </div>
                        </div>
                         
                        <hr />
                        
                        <!-- submit-->
            			<button class="btn-lg btn-primary btn-block" onclick="login()">登陆</button>
                        
                        <a href="index.jsp">返回官网</a> 

                    </form>

                </div>         
            </div>         
        </div>
    </div>
 	
  </body>
</html>


	
