<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>이벤트</title>
</head>
<body>
	<div>
		<input type="text" id="txt" name="txt" value="" placeholder="입력란..." onkeyup="fn_press();" />
		<input type="button" value="입력체크" onclick="fn_check();" />
	</div>
	
	<script type="text/javascript">
		function fn_check() {
			if(document.getElementById('txt').value == "") {
				alert("입력란에 입력해주세요.");
			}
			else {
				alert("저장되었습니다.");
			}
		}
		
		function fn_press() {
			alert(document.getElementById('txt').value);
		}
	</script>
</body>
</html>