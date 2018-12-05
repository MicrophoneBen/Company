<%@ page contentType="text/html;charset=utf-8" language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>

 <!--Main Slider-->
<section class="main-slider" data-start-height="820" data-slide-overlay="yes">

    <div class="tp-banner-container">
        <div class="tp-banner">
            <ul>
            	
            	<c:forEach items="${carousel}" var="news">
            	
            		<li data-transition="fade" data-slotamount="1" data-masterspeed="1000" data-thumb="${news.imgAddr}"  data-saveperformance="off"  data-title="${news.title }">
                    <img src="${news.imgAddr }"  alt="#"  data-bgposition="center top" data-bgfit="cover" data-bgrepeat="no-repeat">

                        <div class="tp-caption sft sfb tp-resizeme"
                        data-x="center" data-hoffset="0"
                        data-y="center" data-voffset="-60"
                        data-speed="1500"
                        data-start="0"
                        data-easing="easeOutExpo"
                        data-splitin="none"
                        data-splitout="none"
                        data-elementdelay="0.01"
                        data-endelementdelay="0.3"
                        data-endspeed="1200"
                        data-endeasing="Power4.easeIn">
                            <div class="text"></div>
                        </div>
                        
                        <div class="tp-caption sft sfb tp-resizeme text-center"
                        data-x="center" data-hoffset="0"
                        data-y="center" data-voffset="20"
                        data-speed="1500"
                        data-start="500"
                        data-easing="easeOutExpo"
                        data-splitin="none"
                        data-splitout="none"
                        data-elementdelay="0.01"
                        data-endelementdelay="0.3"
                        data-endspeed="1200"
                        data-endeasing="Power4.easeIn">
                            <h2>${news.title }</h2>
                        </div>
    
                        <div class="tp-caption sft sfb tp-resizeme"
                        data-x="center" data-hoffset="0"
                        data-y="center" data-voffset="110"
                        data-speed="1500"
                        data-start="1000"
                        data-easing="easeOutExpo"
                        data-splitin="none"
                        data-splitout="none"
                        data-elementdelay="0.01"
                        data-endelementdelay="0.3"
                        data-endspeed="1200"
                        data-endeasing="Power4.easeIn">
                            <div class="btn-box"><a href="news?newsid=${news.newsid}" class="theme-btn btn-style-one">阅读全文</a></div>
                        </div>

                    </li>
                    
            	</c:forEach>

            </ul>
            <div class="tp-bannertimer"></div>
        </div>
    </div>
</section>

