<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
<%@ include file="/WEB-INF/views/inc/menu.jsp" %>
		
<div class="booking">
	<h2>예약하기</h2>

	<div class="search-box">
		<div>
			<input type="text">
			<button>검색</button>
		</div>
	</div> <!-- search-box -->

	<div class="booking-wrap">
		<ul>
			<!-- if -->
			<li data-aos="fade-up" data-aos-delay="100">
				<div class="booking-box">
					<div class="thum">
						<a href="<c:url value='/booking/view.do' />?location=장소명1"><img src="../img/beluga.jpg" alt=""></a>
					</div>
					<div class="info">
						<a href="<c:url value='/booking/view.do' />?location=장소명1"><h3>장소명1</h3></a>
						<p>장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명</p>
						<span>2021-05-03</span>
					</div>
				</div> <!-- booking-box -->
			</li>
			<li data-aos="fade-up" data-aos-delay="200">
				<div class="booking-box">
					<div class="thum">
						<a href="<c:url value='/booking/view.do' />?location=장소명2"><img src="../img/cat.jpg" alt=""></a>
					</div>
					<div class="info">
						<a href="<c:url value='/booking/view.do' />?location=장소명2"><h3>장소명2</h3></a>
						<p>장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명</p>
						<span>2021-05-03</span>
					</div>
				</div> <!-- booking-box -->
			</li>
			<li data-aos="fade-up" data-aos-delay="300">
				<div class="booking-box">
					<div class="thum">
						<a href="<c:url value='/booking/view.do' />?location=장소명3"><img src="../img/haedal.jpg" alt=""></a>
					</div>
					<div class="info">
						<a href="<c:url value='/booking/view.do' />?location=장소명3"><h3>장소명3</h3></a>
						<p>장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명 장소 설명</p>
						<span>2021-05-03</span>
					</div>
				</div> <!-- booking-box -->
			</li>
			<!-- if end -->
		</ul>
	</div> <!-- booking-wrap -->
</div> <!-- booking -->

<!-- 하단 푸터 불러오기 -->
<%@ include file="/WEB-INF/views/inc/footer.jsp" %>