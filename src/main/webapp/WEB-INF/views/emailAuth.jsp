<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="header.jsp" %>
    	
 
 		<br><br>

        <div class="d-flex container px-4 px-lg-5" id="wrapper">
            <!-- Sidebar-->
            <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="list-group list-group-flush">
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="showup('menu1');" href="#!">로그인</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="showup('menu2');" href="#!">회원가입</a>
                </div>
            </div>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
            
         
         		<!-- Login  -->
                <div class="container-fluid" id="menu1" style="display:none;">
                    <h1 class="mt-4">로그인</h1>
                    	<br>
                    	<form action="login" method="post">
                    		<table>
                    			<tr>
                    				<td>ID :</td>
                    				<td><input type="text" id="lid" name="lid" maxlength=15></td>
                    				<td rowspan="2">&nbsp;<input type="submit" value="Login" style="height:60px;"></td>
                    			</tr><tr>
                    				<td>Password :</td>
                    				<td><input type="password" id="lpw" name="lpw" maxlength=15></td>
                    			</tr>
                    		</table>
                    	</form>
                </div>


                
                <!-- Register  -->
                <div class="container-fluid" id="menu2" style="display:none;">
                    <h1 class="mt-4">회원가입</h1>
                    	<br>
                    	<form action="register" method="post" name="register" enctype="multipart/form-data">
                    		<table>
                    			<tr>
                    				<td>ID: </td>
                    				<td><input type="text" id="id" name="id" maxlength=15 placeholder="ID"></td>
                    			</tr><tr>
                    				<td>Name :</td>
                    				<td><input type="text" id="name" name="name" maxlength=8 placeholder="Nickname"></td>
                    			</tr><tr>
                    				<td>Password :</td>
                    				<td><input type="password" id="pw" name="pw" maxlength=15></td>
                    			</tr><tr>
                    				<td>Password Check :</td>
                    				<td><input type="password" id="pwc" name="pwc" maxlength=15></td>
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
                    				<td><input type="text" id="phone" name="phone" maxlength=11 placeholder="'-'없이 입력해주세요"></td>
                    			</tr><tr>
                    				<td>Gender :</td>
                    				<td><input type="radio" name="gender" value="M">남자
                    					<input type="radio" name="gender" value="F">여자</td>
                    			</tr><tr>
                    				<td>Email :</td>
                    				<td><input type="text" id="email" name="email" maxlength=30 placeholder="Your-email@email.com"></td>
                    			</tr>
                    			<tr>
                    				<td>프로필사진 : </td>
                    				<td><input type="file" id="file" name="file"></td>
                    			</tr>
                    		</table>
                    		<input type="button" value="Register" onclick="registercheck();">
                    	</form>
                </div>
                
             
                
                <!-- Email Auth  -->
                <div class="container-fluid" id="menu3" style="display:block;">
                    <h1 class="mt-4">이메일 인증</h1>
                    	<br>
                    	<form action="emailAuth" method="post" name="emailForm">
                    		<input type="text" name="email" readonly="readonly" value="${email}" style="background-color: #e2e2e2;">
                    		<input type="submit" value="인증 코드 전송">
                    	</form>
                    	
                    	<div id="info" style="display:none;color:red;">
                    		<div style="color:red;">인증 메일이 전송되었습니다!</div>
                    		<div style="color:red;" id="timer"></div>
                    	</div>
                    	
                    	<form action="emailCheck" method="post" name="emailCheck">
                    		<input type="text" id="emailC" name="email" value="${email}" style="display:none;">
                    		<input type="text" id="isinfo" name="isinfo" value="${info}" style="display:none;">
                    		<input type="text" id="authKey" name="authKey" value="${authKey}" style="display:none;">
                    		<input type="text" id="inputKey" name="inputKey" maxlength=5 placeholder="5자리 인증코드">
                    		<input type="button" value="인증" onclick="emailCHK();">
                    	</form>

                </div>
                


            </div>
        </div>
        
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <script src="js/display.js"></script>
        <script src="js/emailAuth.js"></script>
        <script src="js/address.js"></script>
    </body>
</html>
