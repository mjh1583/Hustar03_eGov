<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
<%@ include file="/WEB-INF/views/inc/menu.jsp" %>
<%@ include file="/WEB-INF/views/bbs/gallery_submenu.jsp" %>
<!-- 상단 헤더 불러오기 -->

<div class="gallery-view-wrap">
	<div class="gallery-box">
		<div class="view">
			<h2><c:out value="${galleryVO.subject}"/></h2>
			
			<div class="view-hd">
				<span>등록일 : <fmt:formatDate value="${galleryVO.date}" pattern="yyyy-MM-dd"/></span>
				<p>작성자 : <b><c:out value="${galleryVO.writer}"/></b></p>
			</div>

			<div class="view-content">
				<c:out value="${galleryVO.contents}"/>
			</div>

			<div class="view-file">
				<c:if test="${not empty galleryVO.oriFilename}">
					<a href="#none"><i class="fa fa-download" aria-hidden="true"></i><img src="<c:url value='/bbs/gallery_image.do' />?seq=${galleryVO.seq}"></a>
				</c:if>
			</div>
		</div> <!-- view -->
	</div> <!-- gallery-box -->
	<div class="write-btn-box">
		<a href="#" onclick="confirmDelete();">삭제</a>
		<a href="<c:url value='/bbs/gallery_modify.do' />?seq=${galleryVO.seq}">수정</a>
		<a href="<c:url value='/bbs/gallery_list.do' />">목록으로</a>
	</div>
</div> <!-- gallery-view-wrap -->

<script type="text/javascript">
function confirmDelete(){
	if(confirm('삭제하시겠습니까?')==true){
		location.href = '<c:url value="/bbs/gallery_delete.do"/>?seq=${galleryVO.seq}';
	}
}
</script>
<!-- 하단 푸터 불러오기 -->
<%@ include file="/WEB-INF/views/inc/footer.jsp" %>