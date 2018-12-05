<%@ page contentType="text/html;charset=utf-8" language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>

	<!--Services Section-->
    <section class="services-section">
    	<div class="auto-container">
        	<!--Sec Title-->
        	<div class="sec-title">
            	<h2>产品及服务</h2>
                <div class="text">原创技术成就美好未来</div>
            </div>
            
            <div class="outer-box" style="background-image: url(images/background/dotted-map.png);">

                <div class="row clearfix">
                
                    <!--Left Column-->
                    <div class="left-column col-md-5 col-sm-6 col-xs-12 pull-left">
                    
                        <!--Service Block One-->
                        <div class="service-block-one">
                            <div class="inner-box">
                                <div class="icon-box">
                                    <span class="icon flaticon-shield"></span>
                                </div>
                                <h3>智能视频</h3>
                                <div class="text">
                                    <c:forEach items="${intelligentVideo}" var="service">
                                        <br/><a href="service?id=${service.id }">${service.servicename }</a>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        
                        <!--Service Block One-->
                        <div class="service-block-one">
                            <div class="inner-box">
                                <div class="icon-box">
                                    <span class="icon flaticon-shield"></span>
                                </div>
                                <h3>移动互联网</h3>
                                <div class="text">
                                    <c:forEach items="${internet}" var="service">
                                        <br/><a href="service?id=${service.id }">${service.servicename }</a>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                       
                    </div>
                    
                    <!--Right Column-->
                    <div class="right-column col-md-5 col-sm-6 col-xs-12 pull-right">

                        <!--Service Block One-->
                        <div class="service-block-two">
                            <div class="inner-box">
                                <div class="icon-box">
                                    <span class="icon flaticon-shield"></span>
                                </div>
                                <h3>身份验证</h3>
                                <div class="text">
                                    <c:forEach items="${authentication}" var="service">
                                        <br/><a href="service?id=${service.id }">${service.servicename }</a>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        
                        <!--Service Block One-->
                        <div class="service-block-two">
                            <div class="inner-box">
                                <div class="icon-box">
                                    <span class="icon flaticon-shield"></span>
                                </div>
                                <h3>其他</h3>
                                <div class="text">
                                    <c:forEach items="${other}" var="service">
                                        <br/><a href="service?id=${service.id }">${service.servicename }</a>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
        
                    </div>
                    
                    <!--Image Column-->
                    <div class="image-column col-md-2 col-sm-12 col-xs-12">
                        <figure class="image-box wow fadeInUp" data-wow-delay="0ms" data-wow-duration="1500ms">
                            <img src="#" alt="" />
                        </figure>
                    </div>
                    
                 </div>
            </div>
            
        </div>
    </section>
    <!--End Services Section-->