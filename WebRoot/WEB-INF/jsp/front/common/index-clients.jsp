<%@ page contentType="text/html;charset=utf-8" language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>

    <!--Testimonial Section-->
    <section class="testimonial-section">
        <div class="auto-container">
            <!--Sec Title-->
            <div class="sec-title">
                <h2>客户案例</h2>
            </div>
            <!--Sec Title-->
            
            <!--Three Item Carousel-->
            <div class="three-item-carousel">
              <c:forEach items="${clients}" var="client">
                <!--Testimonial Block One-->
                <div class="testimonial-block-one">
                    <div class="inner-box">
                        <div class="quote-icon"><span class="icon flaticon-left-quote"></span></div>
                        <div class="text">${company.companyName}这家公司实在太棒了!</div>
                        <!--Author Info-->
                        <div class="author-info">
                            <div class="author-image">
                                <img src="${client.clientLogoAddr}" alt="" />
                            </div>
                            <h3></h3>
                            <div class="designation">${client.clientName}</div>
                            <!--Rating-->
                            <div class="rating">
                                <span class="fa fa-star"></span>
                                <span class="fa fa-star"></span>
                                <span class="fa fa-star"></span>
                                <span class="fa fa-star"></span>
                                <span class="fa fa-star"></span>
                            </div>
                        </div>
                    </div>
                </div> 
              </c:forEach>
            </div>
            
        </div>
        
    </section>
    <!--End Testimonial Section-->