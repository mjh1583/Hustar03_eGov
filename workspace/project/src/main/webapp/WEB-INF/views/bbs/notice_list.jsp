<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
<%@ include file="/WEB-INF/views/inc/menu.jsp" %>
		
<div class="snb-wrap">
	<div>
		<ul>
			<li class="on"><a href="<c:url value='/bbs/notice_list.do' />"><span>공지사항</span></a></li>
			<li><a href="./free_list.html"><span>자유게시판</span></a></li>
			<li><a href="./gallery_list.html"><span>갤러리</span></a></li>
		</ul>
	</div>
</div>

<form action="<c:url value='/bbs/notice_list.do'/>" method="get" name="frm">
	<div class="notice-wrap">
		<div class="search-box">
			<div>
				<input type="text" name="searchKeyword" value="${searchVO.searchKeyword}">
				<button onclick="fn_requestList(1);">검색</button>
			</div>
		</div> <!-- search-box -->
		
		<div class="notice-box" data-aos="flip-left" data-aos-delay="100">
			<ul class="th">
				<li>
					<div class="no">번호</div>
					<div class="title">제목</div>
					<div class="writer">글쓴이</div>
					<div class="date">등록일</div>
				</li>
			</ul>
			<c:forEach var="noticeVO" items="${noticeVOList}" varStatus="status">
				<ul class="td">
					<li data-aos="fade-up" data-aos-delay="200">
						<div class="no"><c:out value="${paginationInfo.totalRecordCount - ((paginationInfo.currentPageNo - 1) * paginationInfo.recordCountPerPage + status.index)}"/></div>
						<div class="title"><a href="./notice_view.html"><c:out value="${noticeVO.subject}" /></a></div>
						<div class="writer"><c:out value="${noticeVO.writer}" /></div>
						<div class="date"><c:out value="${noticeVO.date}" /></div>
					</li>
				</ul>
			</c:forEach>
		</div> <!-- notice-box -->
		
		<div class="write-btn-box">
			<a href="./notice_write.html">글쓰기</a>
		</div>
	
		<div class="paging">
			<div>
				<ul>
					<ui:pagination paginationInfo="${paginationInfo}" type="myImage" jsFunction="fn_requestList"/>
					<!-- 페이지 번호를 넘겨줌 -->
					<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
				</ul>
			</div>
		</div> <!-- paging -->
	</div> <!-- notice-wrap -->
</form>

<script type="text/javascript">
	function fn_requestList(pageNo) {
		console.log(pageNo);
		document.frm.pageIndex.value = pageNo;
		document.frm.submit();
	}
</script>

<!-- 하단 푸터 불러오기 -->
<%@ include file="/WEB-INF/views/inc/footer.jsp" %>