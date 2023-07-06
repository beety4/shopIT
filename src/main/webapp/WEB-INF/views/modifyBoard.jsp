<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.demo.dto.ProductDTO" %>
<%@ page import="com.example.demo.dto.UserDTO" %>
<%@include file ="header.jsp" %>
    	
    	<%
    		if(sID == null) {
    			PrintWriter s = response.getWriter();
    			s.println("<script>");
    			s.println("alert('로그인이 필요한 서비스 입니다!!');");
    			s.println("location.href='/';");
    			s.println("</script>");
    			s.close();
    			return;
    		}
			
			ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
			list = (ArrayList<ProductDTO>)request.getAttribute("list");
    		
			UserDTO userinfo = new UserDTO();
			userinfo = (UserDTO)request.getAttribute("userinfo");
			
			ProductDTO p = new ProductDTO();
			p = (ProductDTO)request.getAttribute("p");
			String cat = p.getCategory();
    	
    	%>

 
 		<br><br>

        <div class="d-flex container px-4 px-lg-5" id="wrapper">
            <!-- Sidebar-->
            <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="list-group list-group-flush">
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="showup('menu1');" href="#!">내정보</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="showup('menu2');" href="#!">정보 수정</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="showup('menu3');" href="#!">상품 등록</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="showup('menu4');" href="#!">상품 수정/삭제</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="showup('menu5');" href="#!">회원탈퇴</a>
                </div>
            </div>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
            
         
         		<!-- My Profile  -->
                <div class="container-fluid" id="menu1" style="display:none;">
                    <h1 class="mt-4">내정보</h1>
                    <div style="border-radius: 70%; overflow: hidden; border:1px solid black;width:100px;height:100px;">
                    <img src="<%=userinfo.getImg() %>" style="object-fit: cover;width:100%;height:100%;">
                    </div>
					<br>
					
					<a>ID : <%=userinfo.getId() %></a><br>
					<a>Name : <%=userinfo.getName() %></a><br>
					<a>Address : <%=userinfo.getAddress() %></a><br>
					<a>Phone : <%=userinfo.getPhone() %></a><br>
					<a>Gender : <%=userinfo.getGender() %></a><br>
					<a>Email : <%=userinfo.getEmail() %></a><br>
					<a>LastLogin : <%=userinfo.getLastlogin() %></a>

                    
                </div>
                
                <!-- Edit Profile  -->
                <div class="container-fluid" id="menu2" style="display:none;">
                    <h1 class="mt-4">정보 수정</h1>
                    <form action="editUser" method="post" name="editUser" enctype="multipart/form-data">
                    	<table>
                    		<tr>
                    			<td>ID: </td>
                    			<td><input type="text" id="id" name="id" readonly="readonly" value="<%=userinfo.getId() %>" style="background-color: #e2e2e2;"></td>
                    		</tr><tr>
                    			<td>Name :</td>
                    			<td><input type="text" id="name" name="name" value="<%=userinfo.getName() %>"></td>
                    		</tr><tr>
                    			<td>Password :</td>
                    			<td><input type="password" id="pw" name="pw" maxlength=15></td>
                    		</tr><tr>
                    			<td>Password Check :</td>
                    			<td><input type="password" id="pwc" name="pwc" maxlength=15></td>
                    		</tr><tr>
                    			<td>기존 주소</td>
                    			<td><input type="text" value="<%=userinfo.getAddress() %>" readonly="readonly" style="background-color: #e2e2e2;width:450px;"></td>
                    		</tr><tr>
                    			<td>Address :</td>
                    			<td><input type="text" id="addr1" name="addr1" placeholder="우편번호" readonly="readonly"></td>
                    			<td><input type="button" value="주소찾기" onclick="address_api();"></td>
                    		</tr><tr>
                    			<td></td>
                    			<td><input type="text" id="addr2" name="addr2" placeholder="도로명 주소" readonly="readonly" style="width:450px;"></td>
                    		</tr><tr>
                    			<td></td>
                    			<td><input type="text" id="addr3" name="addr3" placeholder="상세주소">
                    				<input type="texT" id="address" name="address" style="display:none"></td>
                    		</tr><tr>
                    			<td>Phone :</td>
                    			<td><input type="text" id="phone" name="phone" maxlength=11 placeholder="'-'없이 입력해주세요" value="<%=userinfo.getPhone() %>"></td>
                    		</tr><tr>
                    			<td>Gender :</td>
                    			<td><input type="radio" name="gender" value="M" <%=userinfo.getGender().equals("M") ? "checked" : "" %>>남자
                    				<input type="radio" name="gender" value="F" <%=userinfo.getGender().equals("F") ? "checked" : "" %>>여자</td>
                    		</tr><tr>
                    			<td>Email :</td>
                    			<td><input type="text" id="email" name="email" value="<%=userinfo.getEmail() %>" style="background-color: #e2e2e2;"></td>
                    		</tr><tr>
                    			<td>프로필사진 : </td>
                    			<td><input type="file" id="file" name="file"></td>
                    		</tr>
                    	</table>
                    	<input type="button" value="정보 수정" onclick="checkValue();">
                    </form> 
                </div>
                
                
                <!-- Change auth  -->
                <div class="container-fluid" id="menu3" style="display:none;">
                    <h1 class="mt-4">상품 등록</h1>
                    <form action="writeBoard" method="post" name="writeBoard" enctype="multipart/form-data">
                    	<input type="text" value="<%=sID %>" id="sID" name="sID" style="display:none;">
                    	<input type="text" value="<%=uID %>" id="uID" name="uID" style="display:none;">
                    	<table class="table" style="text-align: center; border: 1px solid #dddddd;">
						<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">새 상품 등록</th>
						</tr>
						<tbody>
						<tr>
							<td><input type="text" placeholder="제목" name="title" id="title" maxlength="100" style="width:920px;"></td>
						</tr>
						<tr>
							<td><textarea placeholder="내용" name="content" id="content" maxlength="1024" style="width:920px; height: 200px;"></textarea></td>
						</tr>
						<tr>
							<td><a style="float:left;">상품 이미지 : &nbsp;</a> <input type="file" value="사진" name="file" id="file" style="float:left;"></td>
						</tr>
						<tr>
							<td style="float:left;">
							<a>카테고리 : </a>
							<select name="category">
								<option value="CPU" selected="selected">CPU</option>
								<option value="MEMORY">MEMORY</option>
								<option value="HDD">HDD</option>
								<option value="SDD">SDD</option>
								<option value="MAINBOARD">MAINBOARD</option>
								<option value="GPU">GPU</option>
							</select>
							</td>
						</tr>
						<tr>
							<td style="float:left;">
								가격 : <input type="text" id="price" name="price"> 할인가격 : <input type="text" id="saleprice" name="saleprice" placeholder="할인 없을 시 미입력">
							</td>
						</tr>
						</tbody>
						</table>
						<button onclick="writeBoard();" style="float:right;">업로드</button>
                    </form>
                </div>
                
                
                
                <!-- Login log  -->
                <div class="container-fluid" id="menu4" style="display:none;width:1000px;">
                    <h1 class="mt-4">상품 수정/삭제</h1>
 					<table class="table" style="text-align: center; border: 1px solid #dddddd; width: 100%;">
					<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center; width: 7%;">번호</th>
						<th style="background-color: #eeeeee; text-align: center; width: 35%;">제목(내용보기)</th>
						<th style="background-color: #eeeeee; text-align: center; width: 10%;">카테고리</th>
						<th style="background-color: #eeeeee; text-align: center; width: 10%;">할인여부</th>
						<th style="background-color: #eeeeee; text-align: center; width: 19%;">작성일</th>
						<th style="background-color: #eeeeee; text-align: center; width: 9%;">수정</th>
						<th style="background-color: #eeeeee; text-align: center; width: 10%;">삭제</th>
					</tr>
					</thead>
					<tbody>
                    
                    <%
                    	for(int i=0; i<list.size(); i++) {
                    		int num = list.get(i).getNum();
                    %>
                    	<tr>
						<td><%=num %></td>
						<td><div style="cursor:pointer;" onclick="location.href='readBoard?num=<%=num %>'"><%=list.get(i).getTitle() %></div></td>
						<td><%=list.get(i).getCategory() %></td>
						<%
							if(list.get(i).getSaleprice() != 0) {
						%>
							<td>할인</td>
						<%
							}else {
						%>
							<td></td>
						<%
							}
						%>
						<td><%=list.get(i).getDate() %></td>
						<td>
							<form action="modifyBoard" method="post" name="modifyBoard">
								<input type="text" name="id" value="<%=sID %>" style="display:none;">
								<input type="text" name="num" value="<%=num %> %>" style="display:none;">
								<button type="submit" class="btn btn-outline-secondary">수정</button>
							</form>
						</td>
						<td>
							<form action="deleteBoard" method="post" name="deleteBoard">
								<input type="text" name="id" value="<%=sID %>" style="display:none;">
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


				<!-- Login log  -->
                <div class="container-fluid" id="menu5" style="display:none;">
                    <h1 class="mt-4">회원 탈퇴</h1>
                    <a style="color: red;">정말로 탈퇴하시겠습니까?</a>
                    <a style="color: red;">모든 정보가 삭제됩니다!!</a>
                    
                    <input type="button" value="YES">
                    <input type="button" value="NO">
                    
                </div>
                
                
                
                <div class="container-fluid" id="menu5" style="display:block;">
                    <h1 class="mt-4">상품 수정</h1>
						<form action="modifyBoard" method="post" name="modifyBoard" enctype="multipart/form-data">
                    	<input type="text" value="<%=sID %>" id="sID" name="sID" style="display:none;">
                    	<input type="text" value="<%=uID %>" id="uID" name="uID" style="display:none;">
                    	<input type="text" value="<%=p.getNum() %>" id="num" name="num" style="display:none;">
                    	<table class="table" style="text-align: center; border: 1px solid #dddddd;">
						<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">상품 수정</th>
						</tr>
						<tbody>
						<tr>
							<td><input type="text" placeholder="제목" name="title" id="title" maxlength="100" style="width:920px;" value="<%=p.getTitle() %>"></td>
						</tr>
						<tr>
							<td><textarea placeholder="내용" name="content" id="content" maxlength="1024" style="width:920px; height: 200px;"><%=p.getContent() %></textarea></td>
						</tr>
						<tr>
							<td><a style="float:left;">상품 이미지 : &nbsp;</a> <input type="file" name="file" id="file" style="float:left;"></td>
						</tr>
						<tr>
							<td style="float:left;">
							<a>카테고리 : </a>
							<select name="category">
								<option value="CPU" <%=cat.equals("CPU")?"selected='selected'":"" %>>CPU</option>
								<option value="MEMORY" <%=cat.equals("MEMORY")?"selected='selected'":"" %>>MEMORY</option>
								<option value="HDD" <%=cat.equals("HDD")?"selected='selected'":"" %>>HDD</option>
								<option value="SDD" <%=cat.equals("SDD")?"selected='selected'":"" %>>SDD</option>
								<option value="MAINBOARD" <%=cat.equals("MAINBOARD")?"selected='selected'":"" %>>MAINBOARD</option>
								<option value="GPU" <%=cat.equals("GPU")?"selected='selected'":"" %>>GPU</option>
							</select>
							</td>
						</tr>
						<tr>
							<td style="float:left;">
								가격 : <input type="text" id="price" name="price" value="<%=p.getPrice() %>"> 할인가격 : <input type="text" value="<%=p.getSaleprice() %>" id="saleprice" name="saleprice" placeholder="할인 없을 시 미입력">
							</td>
						</tr>
						</tbody>
						</table>
						<button type="submit" style="float:right;">수정</button>
                    </form>
						
						
						
						
                    
                </div>
                


            </div>
        </div>
        
        
        
        
        
        
        
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <script src="js/manage_validate.js"></script>
        <script src="js/display.js"></script>
        <script src="js/address.js"></script>
    </body>
</html>
