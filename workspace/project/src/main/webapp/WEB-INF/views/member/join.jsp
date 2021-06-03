<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
<%@ include file="/WEB-INF/views/inc/menu.jsp" %>
		
<div class="join-box">
	<h1>회원가입</h1>
	
	<form action='<c:url value="/member/joinInsert.do" />' name="frm">
		<div class="join-form">
			<ul>
				<li>
					<label for="">아이디&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="javascript:checkId();">중복확인</a>
					</label>
					<input type="text" name="id" placeholder="아이디">
				</li>
				<li>
					<label for="">비밀번호</label>
					<input type="password" name="password" placeholder="비밀번호">
				</li>
				<li>
					<label for="">비밀번호 확인</label>
					<input type="password" placeholder="비밀번호 확인">
				</li>
				<li>
					<label for="">이름</label>
					<input type="text" name="name" placeholder="이름">
				</li>
				<li>
					<label for="">연락처</label>
					<input type="text" name="phone" placeholder="연락처">
				</li>
				<li>
					<label for="">생년월일</label>
					<input type="text" name="birth" placeholder="생년월일 ex)19950806">
				</li>
				<li class="gender">
					<label for="">성별</label>
					<span>
						<label for="">남</label>
						<input type="radio" name="gender" value="남">
					</span>
					<span>
						<label for="">여</label>
						<input type="radio" name="gender" value="여">
					</span>
				</li>
				<li>
					<label for="">직업</label>
					<select name="job" id="">
						<option value="학생">학생</option>
						<option value="회사원">회사원</option>
						<option value="기타">기타</option>
					</select>
				</li>
				<li class="address">
					<label for="">주소</label>
					<span class="zipcode">
						<input type="text"><button>검색</button>
					</span>
					<span>
						<input type="text" name="address" placeholder="기본 주소">
					</span>
					<span>
						<input type="text" name="address" placeholder="상세 주소">
					</span>
				</li>
			</ul>
		</div> <!-- join-form -->
		
		<div class="join-btn">
			<a href="<c:url value='/member/login.do' />">이전</a>
			<a href="#none" onclick="document.frm.submit();" >가입완료</a>
		</div>
	</form>
</div>

<script type="text/javascript">
	var msg = '<c:out value="${msg}" />';
	
	if(msg != '')
		alert(msg);
	
	// 아이디 중복 조회
	function checkId() {
		var id = document.frm.id.value;
		
		$.ajax({
			type : 'POST',
			url : '<c:url value="/member/checkId.do"/>',
			dataType : 'JSON',
			data : {"id" : id},
			success : function(data) {
				console.log(data);
				// 위 log가 문자열 형태로 나오는 경우 아래 수행
/* 				var jsonData = JSON.parse(data);

				if(jsonData.duplicate == "true") {
					alert('사용 중인 아이디입니다.');
				} */
				if(data.duplicate == "true") {
					alert('사용 중인 아이디입니다.');
				}
				else {
					alert('사용 가능한 아이디입니다.');
				}
			},
			error : function(jqXHR, textStatus, errorThrown) {
				console.log(textStatus);
			}
		});
	}
</script>
<!-- 하단 푸터 불러오기 -->
<%@ include file="/WEB-INF/views/inc/footer.jsp" %>