<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
<%@ include file="/WEB-INF/views/inc/menu.jsp" %>
<%@ include file="/WEB-INF/views/bbs/submenu.jsp" %>
<div class="notice-view-wrap">
	<div class="notice-box">
		<div class="view">
			<h2><c:out value="${notice.subject}" /></h2>
			
			<div class="view-hd">
				<span>등록일 : <fmt:formatDate value="${notice.date}" pattern="yyyy-MM-dd"/></span>
				<p>작성자 : <b><c:out value="${notice.writer}" /></b></p>
			</div>

			<div class="view-content">
				<pre><c:out value="${notice.contents}" /></pre>
			</div>

			<div class="view-file">
				<a href="<c:url value='/bbs/notice_downloadFile.do' />?seq=${notice.seq}"><i class="fa fa-download" aria-hidden="true"></i>${notice.oriFilename}</a>
				<!-- <a href="#none"><i class="fa fa-download" aria-hidden="true"></i> 첨부파일 다운로드.jpg</a> -->
			</div>
		</div> <!-- view -->
	</div> <!-- notice-box -->
	
	<div class="write-btn-box">
		<a href="<c:url value='/bbs/notice_list.do' />">목록으로</a>
		<a href="<c:url value='/bbs/notice_modify.do' />?seq=${notice.seq}">수정</a>
		<a href="#" onclick="javascript:confirmDelete();">삭제</a>
	</div>
</div> <!-- notice-view-wrap -->

<script type="text/javascript">
	function confirmDelete() {
		if(confirm('삭제하시겠습니까?') == true) {
			location.href = '<c:url value="/bbs/notice_delete.do?seq=${notice.seq}"/>';
		}
	}
</script>
<!-- 하단 푸터 불러오기 -->
<%@ include file="/WEB-INF/views/inc/footer.jsp" %>