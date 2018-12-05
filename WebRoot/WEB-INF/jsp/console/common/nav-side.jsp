<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<nav class="navbar-default navbar-side" role="navigation">
	<div class="sidebar-collapse">
		<ul class="nav" id="main-menu">
			
			<!-- user information -->
			<li>
				<div class="user-img-div">
					<img src="console-assets/img/user.png" class="img-thumbnail"/>
					
					<div class="inner-text">
						<small>上次登陆时间:一分钟之前</small>
						<br/>
						<small>上次登陆ip:127.0.0.1</small>
					</div>
				</div>
			</li>
			
			<li>
				<a class="active-menu"><i class="fa fa-dashboard "></i>管理目录</a>
            </li>
            
            <li>
            	<a><i class="fa fa-desktop "></i>新闻<span class="fa arrow"></span></a>
            	<ul class="nav nav-second-level">
            		<li>
                    	<a href="console/newsManage"><i class="fa fa-toggle-on"></i>新闻管理</a>
                    </li>
                    <li>
                    	<a href="console/newsRelease"><i class="fa fa-edit "></i>新闻发布</a>
                    </li>
            	</ul>
            </li>
            
            <li>
            	<a><i class="fa fa-yelp "></i>产品及服务<span class="fa arrow"></span></a>
            	<ul class="nav nav-second-level">
            		<li>
            			<a href="console/serviceManage"><i class="fa fa-flash "></i>产品管理</a>
            		</li>
            		<li>
            			<a href="console/serviceRelease"><i class="fa fa-flash "></i>产品发布</a>
            		</li>
            	</ul>
            </li>
            
            
			<li>
            	<a ><i class="fa fa-desktop "></i>核心技术<span class="fa arrow"></span></a>
            	<ul class="nav nav-second-level">
            		<li>
                    	<a href="console/coreManage"><i class="fa fa-toggle-on"></i>技术管理</a>
                    </li>
                    <li>
                    	<a href="console/coreRelease"><i class="fa fa-edit "></i>技术发布</a>
                    </li>
            	</ul>
            </li>
            
            <li>
            	<a><i class="fa fa-yelp "></i>客户案例<span class="fa arrow"></span></a>
            	<ul class="nav nav-second-level">
            		<li>
            			<a href="console/caseManage"><i class="fa fa-flash "></i>客户管理</a>
            		</li>
            		<li>
            			<a href="console/caseRelease"><i class="fa fa-flash "></i>客户发布</a>
            		</li>
            	</ul>
            </li>
            
            <li>
            	<a><i class="fa fa-desktop "></i>公司资料<span class="fa arrow"></span></a>
            	<ul class="nav nav-second-level">
            		<li>
                    	<a href="console/companyUpdate"><i class="fa fa-toggle-on"></i>资料更新</a>
                    </li>
            	</ul>
			</li>
			
		</ul>
	</div>
</nav>