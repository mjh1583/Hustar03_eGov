<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
<%@ include file="/WEB-INF/views/inc/menu.jsp" %>
		
<div class="mypage-wrap">
	<h2>예약확인</h2>

	<div class="search-box">
		<div>
			<input type="text">
			<button>검색</button>
		</div>
	</div> <!-- search-box -->

	<div class="mypage-box" data-aos="flip-left" data-aos-delay="100">
		<ul class="th">
			<li>
				<div class="no">번호</div>
				<div class="subject">장소명</div>
				<div class="state">상태</div>
				<div class="date">등록일</div>
				<div class="name">예약일</div>
			</li>
		</ul>
		<ul class="td">
			<li data-aos="fade-up" data-aos-delay="100" data-aos-duration="500">
				<div class="no">4</div>
				<div class="subject"><a href="<c:url value='/booking/view.do' />">경북대학교 대강당</a></div>
				<div class="state"><span class="deny">반려</span></div>
				<div class="date">2021-04-21</div>
				<div class="name">2021-04-23</div>
			</li>
			<li data-aos="fade-up" data-aos-delay="200" data-aos-duration="500">
				<div class="no">3</div>
				<div class="subject"><a href="<c:url value='/booking/view.do' />">휴스타 강의실</a></div>
				<div class="state"><span class="cancel">취소</span></div>
				<div class="date">2021-04-20</div>
				<div class="name">2021-04-24</div>
			</li>
			<li data-aos="fade-up" data-aos-delay="300" data-aos-duration="500">
				<div class="no">2</div>
				<div class="subject"><a href="<c:url value='/booking/view.do' />">라한 호텔</a></div>
				<div class="state"><span class="wait">승인대기</span></div>
				<div class="date">2021-04-19</div>
				<div class="name">2021-04-25</div>
			</li>
			<li data-aos="fade-up" data-aos-delay="400" data-aos-duration="500">
				<div class="no">1</div>
				<div class="subject"><a href="<c:url value='/booking/view.do' />">수성 호텔</a></div>
				<div class="state"><span class="accept">승인</span></div>
				<div class="date">2021-04-18</div>
				<div class="name">2021-04-26</div>
			</li>
		</ul>
	</div> <!-- mypage-box -->
	
	<div class="paging">
		<div>
			<ul>
				<li><a href="#none">처음으로</a></li>
				<li><a href="#none">이전</a></li>
				<li class="on"><a href="#none">1</a></li>
				<li><a href="#none">2</a></li>
				<li><a href="#none">3</a></li>
				<li><a href="#none">다음</a></li>
				<li><a href="#none">마지막</a></li>
			</ul>
		</div>
	</div> <!-- paging -->
</div> <!-- mypage-wrap -->

<!-- 하단 푸터 불러오기 -->
<%@ include file="/WEB-INF/views/inc/footer.jsp" %>