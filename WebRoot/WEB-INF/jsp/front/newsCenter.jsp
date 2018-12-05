<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0">
	<title>新闻中心</title>
	<jsp:include page="common/link.jsp" />
</head>

<body>
	
	<div class="page-wrapper">
		<jsp:include page="common/index-header.jsp" />
		
		<section class="news-section">
	        <div class="auto-container">
	            <!--Sec Title-->
	            <div class="sec-title">
	                <h2>新闻中心</h2>
	                <div class="text">每一个新动态都是我们向前的新脚步</div>
	            </div>
	            <!--Sec Title-->
	            
	            <div class="row clearfix">
	              <c:forEach items="${newsList}" var="news">
	                <!--News Block-->
	                <div class="news-block col-md-4 col-sm-6 col-xs-12">
	                    <div class="inner-box wow fadeInUp" data-wow-delay="0ms" data-wow-duration="1500ms">
	                        <div class="image-box">
	                            <a href="news?newsid=${news.newsid}"><img style="width:100%;height:280px" src="${news.imgAddr}" alt="#" /></a>
	                            <!--overlay box-->
	                            <ul class="post-meta clearfix">
	                                <li><div class="inner"><a><span class="icon flaticon-favorite"></span><br>9999+ Likes</a></div></li>
	                                <li><div class="inner"><a><span class="icon flaticon-speech-bubble"></span><br>9999+ Comments</a></div></li>
	                                <li><div class="inner"><a><span class="icon flaticon-share"></span><br>Shares</a></div></li>
	                            </ul>
	                        </div>
	                        <div class="lower-content">
	                            <ul class="posted">
	                                <li><span class="icon flaticon-calendar"></span>${news.time}</li>
	                                <li><span class="icon flaticon-user-1"></span> By Admin</li>
	                            </ul>
	                            <h3><a href="news?newsid=${news.newsid}">${news.title}</a></h3>
	                            <div class="text"></div>
	                        </div>
	                    </div>
	                </div>
	                <!--End News Block-->
	             </c:forEach>
	            </div>
	        </div>
	    </section>
	    <!--News Section-->
		
		<jsp:include page="common/footer.jsp" />
	</div>
	
	<jsp:include page="common/script.jsp" />
	
</body>
</html>
