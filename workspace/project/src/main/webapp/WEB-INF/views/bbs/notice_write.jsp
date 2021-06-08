<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
<%@ include file="/WEB-INF/views/inc/menu.jsp" %>
<%@ include file="/WEB-INF/views/bbs/submenu.jsp" %>

<div class="notice-write-wrap">
	<form action="<c:url value='/bbs/notice_write_action.do' />" method="post" name="frm" enctype="multipart/form-data">
		<c:if test="${mode == 'modify'}">
			<input type="hidden" name="seq" value="${noticeVO.seq}">
		</c:if>
		<input type="hidden" name="mode" value="${mode}">
		
		<div class="notice-write-box">
			<h1>공지사항 글쓰기</h1>
				
			<div class="write-form">
				<ul>
					<li>
						<label for="">제목</label>
						<input type="text" name="subject" value="<c:out value='${noticeVO.subject}'/>" placeholder="제목을 입력하세요">
					</li>
					<li>
						<label for="">내용</label>
						<textarea name="contents" id="" placeholder="내용을 입력하세요"><c:out value='${noticeVO.contents}'/></textarea>
					</li>
					<c:if test="${empty noticeVO.filename}">
						<li>
							<label for="">첨부파일 #01</label>
							<input type="file" name="uploadFile">
						</li>
					</c:if>
					<c:if test="${not empty noticeVO.filename}">
						<li>
							<label for="">${noticeVO.oriFilename} <a href="#" onclick="javascript:confirmDeleteFile();">[삭제]</a></label>
						</li>
					</c:if>
					<!-- <li>
						<label for="">첨부파일 #02</label>
						<input type="file">
					</li> -->
					<li class="check-box">
						<label for="">공지 선택</label>
						<div class="checkbox">
							<input type="checkbox" id="check-notice"> 
							<label for="check-notice" class="check-text">선택시 공지사항</label>
						</div>
					</li>
				</ul>
			</div> <!-- write-form -->
		</div> <!-- notice-write-box -->
		
		<div class="write-btn-box">
			<a href="<c:url value='/bbs/notice_list.do' />">이전</a>
			<a href="#" onclick="javascript:document.frm.submit();">저장</a>
		</div>
	</form>
</div> <!-- notice-write-wrap -->

<script type="text/javascript">
	function confirmDeleteFile() {
		if(confirm("삭제하시겠습니까?") == true) {
			$.ajax({
				type : "POST",
				url : "<c:url value='/bbs/notice_deleteFile.do' />",
				dataType : "JSON",
				data : {"seq" : ${noticeVO.seq}},
				success : function(data) {
					if(data.success == "true") {
						location.reload();
					}
					else {
						alert("파일 삭제가 실패했습니다.");
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log(textStatus);
				}
			});
		}
	}
</script>

<!-- 하단 푸터 불러오기 -->
<%@ include file="/WEB-INF/views/inc/footer.jsp" %>