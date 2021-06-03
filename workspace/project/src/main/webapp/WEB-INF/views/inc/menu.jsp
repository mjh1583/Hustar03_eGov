<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<body>
	<!-- 컨텐츠 시작 -->
	<div class="contents">
		<!-- 로고, 메뉴 -->
		<div class="header">
			<div class="header-box">
				<h1><a href="<c:url value='/index.do' />"><img src="${pageContext.request.contextPath}/img/whale.png" alt="">animals</a></h1>
	
				<div class="tnb"> <!-- top navigate bar -->
					<ul>
						<li><a href="<c:url value='/member/login.do' />">로그인</a></li>
						<li><a href="<c:url value='/member/join.do' />">회원가입</a></li>
						<li><a href="<c:url value='/admin/set.do' />">관리자</a></li>
						<!-- <li><a href="#none">로그아웃</a></li>
						<li><a href="#none">정보수정</a></li> -->
					</ul>
				</div> <!-- top navigate bar -->
	
				<div class="gnb"> <!-- general navigate bar -->
					<ul>
						<li><a href="<c:url value='/index.do' />">홈</a></li>
						<li><a href="<c:url value='/page/intro.do' />">소개</a></li>
						<li><a href="<c:url value='/bbs/notice_list.do' />">공유하기</a></li>
						<li><a href="<c:url value='/booking/list.do' />">예약하기</a></li>
						<li><a href="<c:url value='/member/mypage.do' />">예약확인</a></li>
					</ul>	
				</div> <!-- general navigate bar -->
	
			</div> <!-- header-box -->
		</div> <!-- header -->		
		<!-- 내용 출력 -->