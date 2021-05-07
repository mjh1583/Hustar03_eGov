<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>jQuery 이벤트</title>
</head>
<body>
	<div style="width: 100px; height: 100px;" id="contentsArea">
		
	</div>
	<input type="button" class="btn" value="yellow" w="200px" h="300px" onclick="fn_change($(this));"/>
	<input type="button" class="btn" value="red" w="150px" h="200px" onclick="fn_change($(this));"/>
	<input type="button" class="btn" value="blue" w="500px" h="1000px" onclick="fn_change($(this));"/>
	
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script type="text/javascript">
		/*
			3가지 버튼을 클릭시 contentsArea를 해당 색상으로 변경하고 사이즈를 w,h에 설정된 값으로 변경하세요.
		*/
		function fn_change(obj) {
			$('#contentsArea').css('background-color', obj.val());
			$('#contentsArea').css('width', obj.attr('w'));
			$('#contentsArea').css('height', obj.attr('h'));
		}
		
		$(document).ready(function() {
			
		});
	</script>
</body>
</html>