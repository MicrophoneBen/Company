<%@ page contentType="text/html;charset=utf-8" language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>

<!-- Preloader -->
<div class="preloader"></div>

<!-- Main Header-->
<header class="main-header">

	<div class="header-top">
   	<div class="auto-container clearfix">
       	<!--Top Left-->
       	<div class="top-left pull-left">
               <div class="social-links">
                   <a href="#"><span class="fa fa-facebook-f"></span></a>
                   <a href="#"><span class="fa fa-twitter"></span></a>
                   <a href="#"><span class="fa fa-linkedin"></span></a>
                   <a href="#"><span class="fa fa-instagram"></span></a>
                   <a href="#"><span class="fa fa-vimeo"></span></a>
               </div>
           </div>
           
           <!--Top Right-->
       	<div class="top-right pull-right">
          		<!--Links Nav-->
           	<ul class="links-nav">
                   <li><a href="#">Support</a></li>
                   <li><a href="#">English</a></li>
               </ul>
               
           </div>
       </div>
   </div>

	<!--Header-Upper-->
   <div class="header-upper">
   	<div class="auto-container">
       	<div class="clearfix">

           	<div class="pull-left logo-outer">
               	<div class="logo">
               		<a href="index">
               			<img src="${company.logoAddr}" alt="logo" title="${company.companyName}">
               		</a>
               	</div>
               </div>

               <div class="pull-right upper-right clearfix">

                   <!--Info Box-->
                   <div class="upper-column info-box">
                   	<div class="icon-box"><span class="flaticon-clock-2"></span></div>
                       	工作时间
                       <div class="light-text">周一 - 周日: 8.00am to 10.30pm</div>
                   </div>

                   <!--Info Box-->
                   <div class="upper-column info-box">
                   	<div class="icon-box"><span class="flaticon-technology-1"></span></div>
                       	联系电话
                       <div class="light-text">${company.telephone}</div>
                   </div>

                   <!--Info Box-->
                   <div class="upper-column info-box">
                   	<div class="icon-box"><span class="flaticon-envelope-3"></span></div>
                       	电子邮箱
                       <div class="light-text">${company.email}</div>
                   </div>

			</div>

           </div>
       </div>
   </div>

   <!--Header-Lower-->
   <div class="header-lower">

   	<div class="auto-container">
       	<div class="nav-outer clearfix">
               <!-- Main Menu -->
               <nav class="main-menu">
                   <div class="navbar-header">
                       <!-- Toggle Button -->
                       <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                           <span class="icon-bar"></span>
                           <span class="icon-bar"></span>
                           <span class="icon-bar"></span>
                       </button>
                   </div>

                   <div class="navbar-collapse collapse clearfix">
                       <ul class="navigation clearfix">

                           <li class="current">
                           	<a href="index">主页</a>
                           </li>

                           <li class="dropdown">
                           	<a>产品及服务</a>
                           	<ul>

                                   <li class="dropdown">
                                   	<a>智能视频</a>
                                   	<ul>
                                   	<c:forEach items="${intelligentVideo}" var="service">
                                   		<li>
                                   			<a href="service?id=${service.id}">${service.servicename}</a>
                                   		</li>
                                   	</c:forEach>
                                   	</ul>
                                   </li>

                                  <li class="dropdown">
                                   	<a>身份验证</a>
                                   	<ul>
                                   	<c:forEach items="${authentication}" var="service">
                                   		<li>
                                   			<a href="service?id=${service.id}">${service.servicename}</a>
                                   		</li>
                                   	</c:forEach>
                                   	</ul>
                                   </li>

                                   <li class="dropdown">
                                   	<a>移动互联网</a>
                                   	<ul>
                                   	<c:forEach items="${internet}" var="service">
                                   		<li>
                                   			<a href="service?id=${service.id}">${service.servicename}</a>
                                   		</li>
                                   	</c:forEach>
                                   	</ul>
                                   </li>

                                   <li class="dropdown">
                                   	<a>其他</a>
                                   	<ul>
                                   	<c:forEach items="${other}" var="service">
                                   		<li>
                                   			<a href="service?id=${service.id}">${service.servicename}</a>
                                   		</li>
                                   	</c:forEach>
                                   	</ul>
                                   </li>

                               </ul>
                           </li>

                           <li class="dropdown">
                           	<a>核心技术</a>
                               <ul>
                               	<c:forEach items="${cores}" var="core">
                                   	<li>
                                   		<a href="core?id=${core.id}">${core.corename}</a>
                                   	</li>
                                   </c:forEach>
                               </ul>
                           </li>
							
						   <li>
						   	<a href="clients">客户案例</a>
						   </li>
						   
						   <li>
						   	<a href="newsCenter">新闻中心</a>
						   </li>
						   
						   <li>
						   	<a href="about">关于我们</a>
						   </li>

                       </ul>
                   </div>
               </nav>
               <!-- Main Menu End-->

           	<div class="outer-btn"><a class="theme-btn consultation">${company.companyName}</a></div>
           	
           </div>
       </div>
   </div>

	<!--Sticky Header-->
   <div class="sticky-header">
   	<div class="auto-container clearfix">
       	<!--Logo-->
       	<div class="logo pull-left">
           	<a href="index" class="img-responsive"><img src="${company.logoAddr}" alt="Bristol"></a>
           </div>

           <!--Right Col-->
           <div class="right-col pull-right">
           	<!-- Main Menu -->
               <nav class="main-menu">
                   <div class="navbar-header">
                       <!-- Toggle Button -->
                       <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
                       </button>
                   </div>

                   <div class="navbar-collapse collapse clearfix">
                       <ul class="navigation clearfix">

                           <li class="current">
                           	<a href="index">主页</a>
                           </li>

                           <li class="dropdown">
                           	<a>产品及服务</a>
                           	<ul>

                                   <li class="dropdown">
                                   	<a>智能视频</a>
                                   	<ul>
                                   	<c:forEach items="${intelligentVideo}" var="service">
                                   		<li>
                                   			<a href="service?id=${service.id}">${service.servicename}</a>
                                   		</li>
                                   	</c:forEach>
                                   	</ul>
                                   </li>

                                  <li class="dropdown">
                                   	<a>身份验证</a>
                                   	<ul>
                                   	<c:forEach items="${authentication}" var="service">
                                   		<li>
                                   			<a href="service?id=${service.id}">${service.servicename}</a>
                                   		</li>
                                   	</c:forEach>
                                   	</ul>
                                   </li>

                                   <li class="dropdown">
                                   	<a>移动互联网</a>
                                   	<ul>
                                   	<c:forEach items="${internet}" var="service">
                                   		<li>
                                   			<a href="service?id=${service.id}">${service.servicename}</a>
                                   		</li>
                                   	</c:forEach>
                                   	</ul>
                                   </li>

                                   <li class="dropdown">
                                   	<a>其他</a>
                                   	<ul>
                                   	<c:forEach items="${other}" var="service">
                                   		<li>
                                   			<a href="service?id=${service.id}">${service.servicename}</a>
                                   		</li>
                                   	</c:forEach>
                                   	</ul>
                                   </li>

                               </ul>
                           </li>

                           <li class="dropdown">
                           	<a>核心技术</a>
                               <ul>
                               	<c:forEach items="${cores}" var="core">
                                   	<li>
                                   		<a href="core?id=${core.id}">${core.corename}</a>
                                   	</li>
                                   </c:forEach>
                               </ul>
                           </li>
							
						   <li>
						   	<a href="clients">客户案例</a>
						   </li>
						   
						   <li>
						   	<a href="newsCenter">新闻中心</a>
						   </li>
						   
						   <li>
						   	<a href="about">关于我们</a>
						   </li>

                       </ul>
                   </div>
               </nav><!-- Main Menu End-->
           </div>

       </div>
   </div>
   <!--End Sticky Header-->

</header>
<!--End Main Header -->
