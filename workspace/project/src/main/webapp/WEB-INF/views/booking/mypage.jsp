<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
<%@ include file="/WEB-INF/views/inc/menu.jsp" %>

<form method="post" name="frm" action="<c:url value='/booking/mypage.do' />" >
	<div class="mypage-wrap">
		<h2>예약확인</h2>
	
		<div class="search-box">
			<div>
				<input type="text" name="searchKeyword">
				<button onclick="javascript:document.frm.submit();fn_requestList(1);">검색</button>
				<input type="hidden" value="${session.name}">
			</div>
		</div> <!-- search-box -->
	
		<div class="mypage-box" data-aos="flip-left" data-aos-delay="100">
			<ul class="th">
				<li>
					<div class="no">번호</div>
					<div class="subject">장소명</div>
					<div class="bookingDate">예약일</div>
					<div class="state">상태</div>
					<div class="date">등록일</div>
					<div class="name">예약자</div>
					<c:if test="${session.auth eq 'adm'}">
						<div class="adminMenu">관리자 메뉴</div>
					</c:if>
				</li>
			</ul>
			<ul class="td">
				<c:forEach var="bookingVO" items="${bookingVOList}" varStatus="status">
					<li data-aos="fade-up" data-aos-delay="100" data-aos-duration="500">
						<div class="no"><c:out value="${paginationInfo.totalRecordCount - ((paginationInfo.currentPageNo - 1) * paginationInfo.recordCountPerPage + status.index)}"/></div>
						<div class="subject"><a href="<c:url value='/booking/view.do' />"><c:out value="${bookingVO.location}"/></a></div>
						<div class="bookingDate"><c:out value="${bookingVO.bookingDate}"/></div>
						<div class="state">
							<c:choose>
								<c:when test="${bookingVO.status == '1'}">
									<span class="accept">승인</span>
								</c:when>
								<c:when test="${bookingVO.status == '2'}">
									<span class="wait">대기</span>
								</c:when>
								<c:when test="${bookingVO.status == '3'}">
									<span class="cancel">취소</span>
								</c:when>
								<c:when test="${bookingVO.status == '4'}">
									<span class="deny">반려</span>
								</c:when>
							</c:choose>
						</div>
						<div class="date"><fmt:formatDate value="${bookingVO.date}" pattern="yyyy-MM-dd"/></div>
						<div class="name"><c:out value="${bookingVO.name}"/></div>
						<c:if test="${session.auth eq 'adm'}">
							<div class="adminMenu">
								<a href="javascript:manage(${bookingVO.seq}, '1');">[승인]</a>
								<a href="javascript:manage(${bookingVO.seq}, '2');">[대기]</a>
								<a href="javascript:manage(${bookingVO.seq}, '3');">[취소] </a>
								<a href="javascript:manage(${bookingVO.seq}, '4');">[반려]</a>
							</div>
						</c:if>
					</li>
				</c:forEach>
			</ul>
		</div> <!-- mypage-box -->
		
		<div class="paging">
			<div>
				<ul>
					<ui:pagination paginationInfo="${paginationInfo}" type="myImage" jsFunction="fn_requestList"/>
					<!-- 페이지 번호를 넘겨줌 -->
					<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
				</ul>
			</div>
		</div> <!-- paging -->
	</div> <!-- mypage-wrap -->
</form>
<script type="text/javascript">
	var statusText = new Map([
		['1', '승인'],
		['2', '대기'],
		['3', '취소'],
		['4', '반려']
	]);
	
	function manage(seq, status) {
		if(confirm(statusText.get(status) + ' 상태로 바꾸시겠습니까?') == true) {
			$.ajax ({
				type : "post",
				url : "<c:url value='/booking/modify_status.do'/>",
				dataType : 'JSON',
				data : {'seq' : seq, 'status' : status},
				success : function (data) {
					if(data.success == "true") {
						location.reload();
					}
					else {
						alert("상태 변경을 실패했습니다.");
					}
				},
				error: function(jqXHR, textStatus, errorThrown) {
					console.log(textStatus);
				}
			});
		}
	}
	
	function fn_requestList(pageNo) {
		console.log(pageNo);
		document.frm.pageIndex.value = pageNo;
		document.frm.submit();
	}
</script>
<!-- 하단 푸터 불러오기 -->
<%@ include file="/WEB-INF/views/inc/footer.jsp" %>