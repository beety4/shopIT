<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.demo.dto.ProductDTO" %>
<%@include file ="header.jsp" %>

		<%
			ProductDTO data = new ProductDTO();
			data = (ProductDTO)request.getAttribute("data");
			
			ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
			list = (ArrayList<ProductDTO>)request.getAttribute("list");
			
		%>
        
        
        <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="<%=data.getMainImg() %>" alt="..." /></div>
                    <div class="col-md-6">
                        <div class="small mb-1"><%=data.getDate().substring(0,10) %> / 작성자 : <%=data.getName() %></div>
                        <h1 class="display-5 fw-bolder"><%=data.getTitle() %></h1>
                        <div class="fs-5 mb-5">
                        	<%
                        		if(data.getSaleprice() != 0) {
                        	%>
                            <span class="text-decoration-line-through">\<%=data.getPrice() %></span>
                            <span>\<%=data.getSaleprice() %></span>
                            <%
                        		} else {
                            %>
                            <span>\<%=data.getPrice() %></span>
                            <%
                        		}
                            %>
                        </div>
                        <p class="lead"><%=data.getContent() %></p>
                        <div class="d-flex">
                        	<form action="cartADD" id="cartADD" method="post">
                        	<input type="text" id="num" name="num" value="<%=data.getNum() %>" style="display:none;">
                            <input class="form-control text-center me-3" id="count" name="count" type="number" value="1" style="max-width: 4rem" />
                            <button class="btn btn-outline-dark flex-shrink-0" type="submit">
                                <i class="bi-cart-fill me-1"></i>
                                Add to cart
                            </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Related items section-->
        
        
        
        <section class="py-5 bg-light">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="fw-bolder mb-4">Related products</h2>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                
                     
                	<%
                		for(int i=0; i<list.size(); i++) {
                			int saleprice = list.get(i).getSaleprice();
                			int fullstar = (int)list.get(i).getRate();
                			float halfstar = list.get(i).getRate() - fullstar;
                			int emptystar = 5 - fullstar - (halfstar > 0 ? 1 : 0);
                			
                	%>
                		<div class="col mb-5">
                        <div class="card h-100">
                        	<%
                        		if(saleprice != 0) {
                        	%>
                        	<!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <%
                        		}
                            %>
                            <!-- Product image-->
                            <img class="card-img-top" src="<%=list.get(i).getMainImg() %>" alt="..." width="450px;" height="250px;"/>
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder"><%=list.get(i).getTitle() %></h5>
                                    
                                  	<%
                                  		if(list.get(i).getRate() != 0) {
                                  	%>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                    	<%
                                    		for(int j=0; j<fullstar; j++) {
                                    	%>
                                        <div class="bi-star-fill"></div>
                                        <%
                                    		}
                                    		if((fullstar != 5) && (halfstar > 0)) {
                                        %>
                                        <div class="bi-star-half"></div>
                                        <%
                                    		}
                                    		for(int k=0; k<emptystar; k++) {
                                        %>
                                        <div class="bi-star"></div>
                                        <%
                                    		}
                                        %>
                                        <a style="color:black;">(<%=list.get(i).getRate() %>)</a>
                                    </div>
                                    <%
                                  		} else {
                                  			%>
                                 				<br>
                                  			<%
                                  		}
                                    	if(saleprice != 0) {
                                    %>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">\<%=list.get(i).getPrice() %></span>
									\<%=saleprice%>
									<%
                                    	} else {
									%>
									\<%=list.get(i).getPrice() %>
									<%
                                    	}
									%>
									
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                <a class="btn btn-outline-dark mt-auto" href="readBoard?num=<%=list.get(i).getNum() %>">상세보기</a>
                                </div>
                            </div>
                        </div>
                   		</div>
                   	<%
                		}
                   	%>

                    
                </div>
                
            </div>
        </section>
        
        
        
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; shopIT 2023</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
    