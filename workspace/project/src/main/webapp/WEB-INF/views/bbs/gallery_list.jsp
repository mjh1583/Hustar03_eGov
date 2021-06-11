<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
<%@ include file="/WEB-INF/views/inc/menu.jsp" %>
<%@ include file="/WEB-INF/views/bbs/gallery_submenu.jsp" %>

<div class="gallery-wrap">
	<div class="search-box">
		<div>
			<input type="text">
			<button>검색</button>
		</div>
	</div> <!-- search-box -->
	<div class="gallery-box">
		<ul data-aos="flip-right" data-aos-delay="100">
			<c:forEach var="galleryVO" items="${galleryVOList}" varStatus="status">
				<li data-aos="fade-up" data-aos-delay="100">
					<div>
						<div class="thum">
							<a href="<c:url value='/bbs/gallery_view.do' />?seq=${galleryVO.seq}"><img src="<c:url value='/bbs/gallery_image.do' />?seq=${galleryVO.seq}"></a>
						</div>
						<div class="info">
							<h3><a href="<c:url value='/bbs/gallery_view.do' />?seq=${galleryVO.seq}"><c:out value="${galleryVO.subject}" /></a></h3>
							<p><c:out value="${galleryVO.contents}" /></p>
							<span><fmt:formatDate value="${galleryVO.date}" pattern="yyyy-MM-dd" /></span>
						</div>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div> <!-- gallery-box -->
	
	<div class="write-btn-box">
		<a href="<c:url value='/bbs/gallery_write.do' />">글쓰기</a>
	</div>

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
</div> <!-- gallery-wrap -->
<!-- 하단 푸터 불러오기 -->
<%@ include file="/WEB-INF/views/inc/footer.jsp" %>