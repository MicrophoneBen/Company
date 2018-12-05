<%@ page contentType="text/html;charset=utf-8" language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>

    <!--最新新闻 -->
    <section class="news-section">
        <div class="auto-container">
            <!--Sec Title-->
            <div class="sec-title">
                <h2>最新新闻</h2>
                <div class="text">每一个新动态都是我们向前的新脚步</div>
            </div>
            <!--Sec Title-->
            
            <div class="row clearfix">
              <c:forEach items="${latestNews}" var="news">
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