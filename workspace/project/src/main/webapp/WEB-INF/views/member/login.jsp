<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
<%@ include file="/WEB-INF/views/inc/menu.jsp" %>
		
<div class="login-box">
	<h1>로그인</h1>
	<div class="login">
		<ul>
			<li>
				<input type="text" placeholder="  ID">
			</li>
			<li>
				<input type="password" placeholder="  PW">
			</li>
			<li>
				<a href="#none">로그인</a>
			</li>
		</ul>
	</div>
	<div class="login-btn">
		<a href="../member/join.html">회원가입</a>
	</div>
</div>

<!-- 하단 푸터 불러오기 -->
<%@ include file="/WEB-INF/views/inc/footer.jsp" %>