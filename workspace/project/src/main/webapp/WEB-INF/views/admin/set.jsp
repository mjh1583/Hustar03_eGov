<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
<%@ include file="/WEB-INF/views/inc/menu.jsp" %>
		
		<!-- 관리자 메뉴 -->
	<div class="adm-menu">
		<ul>
			<li class="on"><a href="./set.html">환경설정</a></li>
			<li><a href="./board.html">게시판 관리</a></li>
			<li><a href="./member.html">회원 관리</a></li>
			<li><a href="./popup.html">팝업 관리</a></li>
			<li><a href="./banner.html">배너 관리</a></li>
			<li><a href="./booking.html">장소 관리</a></li>
		</ul>
	</div>

	<!-- 관리자 환경설정 박스 -->
	<div class="admin-set">
		<h1>환경설정</h1>
		<div class="join-form">
			<ul>
				<li>
					<label for="">사이트명</label>
					<input type="text" placeholder="아이디">
				</li>
				<li>
					<label for="">대표자</label>
					<input type="text" placeholder="대표자">
				</li>
				<li>
					<label for="">이메일</label>
					<input type="text" placeholder="이메일">
				</li>
				<li>
					<label for="">연락처</label>
					<input type="text" placeholder="연락처">
				</li>
				<li class="address">
					<label for="">주소</label>
					<span class="zipcode">
						<input type="text"><button>검색</button>
					</span>
					<span>
						<input type="text" placeholder="기본 주소">
					</span>
					<span>
						<input type="text" placeholder="상세 주소">
					</span>
				</li>
			</ul>
		</div>
		<div class="join-btn">
			<a href="#none">저장</a>
		</div>
	</div>

<!-- 하단 푸터 불러오기 -->
<%@ include file="/WEB-INF/views/inc/footer.jsp" %>