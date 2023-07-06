<%@page import="ch.qos.logback.core.recovery.ResilientSyslogOutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
	<head>
    	<meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop IT - Everything you want</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
    
    <%
    	String sID = null;
    	String uID = null;
    	int count = 0;
    	String getsID = (String)request.getAttribute("sID");
    	String getuID = (String)request.getAttribute("uID");
    	String logout = (String)request.getAttribute("logout");
    	String img = (String)request.getAttribute("img");
    	
    	
    	try {
    		if(session.getAttribute("count") == null) {
    			if(request.getAttribute("count") == null) {
    				count = 0;
    			} else {
    				count = (int)request.getAttribute("count");
    				session.setAttribute("count", count);
    			}
    		} else {
    			if(request.getAttribute("count") == null) {
    				count = (int)session.getAttribute("count");	
    			} else {
    				count = (int)request.getAttribute("count");
    				session.setAttribute("count", count);
    			}
    			
    		}
    	} catch (Exception e) {
    		count = 1234;
    	}
  
    	

    	
    	if(getsID!=null) {
    		session.setAttribute("sID", getsID);
    		session.setAttribute("uID", getuID);
    		session.setAttribute("img", img);
    		sID = getsID;
    		uID = getuID;
    	} else {
    		sID = (String)session.getAttribute("sID");
    		uID = (String)session.getAttribute("uID");
    		img = (String)session.getAttribute("img");
    	}
    	
    	
    	if(logout != null) {
    		session.invalidate();
    		count = 0;
    		sID = null;
    		uID = null;
    		
    	}
    	
    %>
    
    
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="/">shopIT</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="/">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="about">About</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="all">All Items</a></li>
                                <li><a class="dropdown-item" href="popular">Popular Items</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="category?category=CPU">CPU</a></li>
                                <li><a class="dropdown-item" href="category?category=MEMORY">MEMORY</a></li>
                                <li><a class="dropdown-item" href="category?category=HDD">HDD</a></li>
                                <li><a class="dropdown-item" href="category?category=SSD">SSD</a></li>
                                <li><a class="dropdown-item" href="category?category=MAINBOARD">MAINBOARD</a></li>
                                <li><a class="dropdown-item" href="category?category=GPU">GPU</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <button class="btn btn-outline-dark" type="button" onclick="location.href='cart'">
                            <!-- <i class="bi-cart-fill me-1"></i> -->
                            <img src="assets/cart_img.png" style="width:18px;" />
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill"><%=count %></span>
                        </button>
                    </form>
                    &nbsp;
                    
                    <%
                    	if(sID != null) { %>
                    	<div style="width:26px;height:26px;border-radius: 70%; overflow: hidden; border:1px solid black">
                    	<img src="<%=img %>" style="object-fit: cover; width:100%; height:100%;">
                    	</div>
                    	<a><%=uID %>&nbsp;</a>
                    	<input type="button" id="edit" name="edit" value="프로필" onclick="location.href='manage?id=<%=sID %>';">
                    	<form action="logout" method="post">
                    		<input type="submit" value="로그아웃">
                    	</form>
                    	
                    	
                    <%
                    	} else { %>
                    	<a href="sign"><img width="35px" src="/assets/anon.png" /></a>
                    <%
                    	}
                    %>
                 
                    
                </div>
            </div>
        </nav>


