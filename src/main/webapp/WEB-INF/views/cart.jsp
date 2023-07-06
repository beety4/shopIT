<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.demo.dto.CartDTO" %>
<%@include file ="header.jsp" %>

		<%
			if(session.getAttribute("sID") == null){
				PrintWriter s = response.getWriter();
				s.println("<script>");
				s.println("alert('로그인이 필요한 서비스입니다!');");
				s.println("location.href='sign';");
				s.println("</script>");
				s.close();
				return;
			}
		
			ArrayList<CartDTO> list = new ArrayList<CartDTO>();
			list = (ArrayList<CartDTO>)request.getAttribute("list");
		
		
		%>

 		<br><br>

        <div class="d-flex container px-4 px-lg-5" id="wrapper">
            <!-- Sidebar-->
            <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="list-group list-group-flush">
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="showup('menu1');" href="#!">장바구니</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="showup('menu2');" href="#!">주문</a>
                </div>
            </div>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
            
         
         		<!-- Login  -->
                <div class="container-fluid" id="menu1" style="display:block;width:1000px;">
                    <h1 class="mt-4">장바구니</h1>
                    <br>
                    
                    
                    <table class="table" style="text-align: center; border: 1px solid #dddddd; width: 100%;">
					<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center; width: 5%;">사진</th>
						<th style="background-color: #eeeeee; text-align: center; width: 5%;">번호</th>
						<th style="background-color: #eeeeee; text-align: center; width: 25%;">상품명(링크)</th>
						<th style="background-color: #eeeeee; text-align: center; width: 8%;">가격</th>
						<th style="background-color: #eeeeee; text-align: center; width: 8%;">할인가</th>
						<th style="background-color: #eeeeee; text-align: center; width: 7%;">개수</th>
						<th style="background-color: #eeeeee; text-align: center; width: 10%;">삭제</th>
					</tr>
					</thead>
					<tbody style="vertical-align:middle;">
                    
                    <%
                    	for(int i=0; i<list.size(); i++) {
                    		int num = list.get(i).getNum();
                    %>
                    	<tr>
						<td><img src="<%=list.get(i).getMainImg() %>" width="100px" height="100px"></td>
						<td><%=num %></td>
						<td><div style="cursor:pointer;" onclick="location.href='readBoard?num=<%=num %>'"><%=list.get(i).getTitle() %></div></td>
						<%
							if(list.get(i).getSaleprice() != 0) {
						%>
							<td><span class="text-muted text-decoration-line-through">\<%=list.get(i).getPrice() %></span></td>
							<td>\<%=list.get(i).getSaleprice() %></td>
						<%
							} else {
						%>
							<td>\<%=list.get(i).getPrice() %></td>
							<td>0</td>
						<%
							}
						%>
	
						<td><%=list.get(i).getCount() %></td>
						<td>
							<form action="cartDelete" method="post" name="cartDelete">
								<input type="text" name="num" value="<%=num %>" style="display:none;">
								<button type="submit" class="btn btn-outline-secondary">삭제</button>
							</form>
						</td>
						</tr>
					<%
                    	}
					%>
                    </table>
                    	



                </div>
                
                
                
                <!-- Register  -->
                <div class="container-fluid" id="menu2" style="display:none;">
                    <h1 class="mt-4">주문</h1>
                    	<br>
						<form>
							<a>주문하시겠습니까?</a>
							<button type="submit">예</button>
							<button type="submit">아니요</button>
						</form>

                    
                </div>
            </div>
        </div>
        
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <script src="js/display.js"></script>
        <script src="js/validate.js"></script>
    </body>
</html>
