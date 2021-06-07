<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
<%@ include file="/WEB-INF/views/inc/menu.jsp" %>
		
<div class="login-box">
	<h1>로그인</h1>
	<form method="post" name="frm" action="<c:url value='/member/actionLogin.do'/>">
		<div class="login">
			<ul>
				<li>
					<input type="text" name="id" placeholder="  ID">
				</li>
				<li>
					<input type="password" name="password" placeholder="  PW">
				</li>
				<li>
					<!-- <a href="#none" onclick="actionLogin();">로그인</a> -->
					<a href="#none" onclick="actionLoginAsync();">로그인</a>
				</li>
			</ul>
		</div>
		<div class="login-btn">
			<a href="../member/join.html">회원가입</a>
		</div>
	</form>
</div>

<script type="text/javascript">
	var msg = '<c:out value="${msg}" />';
	
	if(msg != '')
		alert(msg);
	
	function actionLogin() {
		var frm = document.frm;
		
		if(frm.id.value == "") {
			alert("ID가 비어있습니다.");
			frm.id.focus();
		}
		else if(frm.password.value == "") {
			alert("Passsword가 비어있습니다.");
			frm.password.focus();
		}
		else {
			frm.submit();
		}
	}
	
	function actionLoginAsync() {
		var frm = document.frm;
		
		var id = document.frm.id.value;
		var password = document.frm.password.value;
		
		$.ajax({
			type : 'POST',
			url : '<c:url value="/member/actionLoginAsync.do"/>',
			dataType : 'JSON',
			data : {"id" : id, "password" : password},
			success : function(data) {
				if(id == "") {
					alert("ID가 비어있습니다.");
					id.focus();
				}
				else if(password == "") {
					alert("Passsword가 비어있습니다.");
					password.focus();
				}
				else {
					if(data.login == "true") {
						location.href = "<c:url value='/index.do' />";
					}
					else {
						alert("로그인에 실패하였습니다.");
						frm.password.focus();
					}
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