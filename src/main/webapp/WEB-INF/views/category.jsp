<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.demo.dto.ProductDTO" %>
<%@include file ="header.jsp" %>
    
		<%
			ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
			list = (ArrayList<ProductDTO>)request.getAttribute("list");
		
			String category = "X";
			try {
				category = (String)request.getAttribute("category");
			} catch(Exception e) {
				category = "ERROR";
			}
		%>
  
  
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder"><%=category %></h1>
                    <p class="lead fw-normal text-white-50 mb-0">Enjoy Shopping</p>
                </div>
            </div>
        </header>
        
        
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
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
