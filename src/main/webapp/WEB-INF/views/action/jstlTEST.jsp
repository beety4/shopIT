<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

                	<!-- 
                		<-- %@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                	    <c:forEach var="value" items="${list}">
                		<c:set var="fullstar" value="${(int)value.getRate()}" />
                		<c:set var="halfstar" value="${(float)(value.getRate() - fullstar)}" />
                	
                		<div class="col mb-5">
                        <div class="card h-100">
                	
                		<c:if test="${value.getSaleprice() != 0}" var="isSaleprice">
                			<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                		</c:if>
                	
                        <img class="card-img-top" src="${value.getMainImg()}" alt="..." />
                        <div class="card-body p-4">
                        <div class="text-center">
                        <h5 class="fw-bolder">${value.getTitle()}</h5>
                	
                		<c:if test="${value.getRate() != 0}">
                			<div class="d-flex justify-content-center small text-warning mb-2">
                			<c:forEach var="star" begin="1" end="${fullstar}">
                				<div class="bi-star-fill"></div>
                			</c:forEach>
                			<c:if test="${(fullstar != 5) && (halfstar <= 0.9)}">
	                			<div class="bi-star-half"></div>
                			</c:if>
                			<a style="color:black;">(${value.getRate()})</a>
                			</div>
                		</c:if>
                	
                		<c:if test="${isSaleprice}">
                			<span class="text-muted text-decoration-line-through">\${value.getSaleprice()}</span>
                			\${value.getPrice()}
                		</c:if>
                		<c:if test="${!isSaleprice}">
                			\${value.getPrice()}
                	</c:if>
                	    </div>
                        </div>

                       	<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">상세보기</a></div>
                        </div>
                        </div>
                   		</div>

                	</c:forEach>
	 				-->
                

</body>
</html>