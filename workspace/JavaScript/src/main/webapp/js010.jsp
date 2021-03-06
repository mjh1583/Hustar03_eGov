<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>animation</title>
</head>
<body>
	<div>
		<input type="text" id="pageX" value="" placeholder="x 좌표"/>
		<input type="text" id="pageY" value="" placeholder="y 좌표"/>
	</div>
	
	<div style="width: 1000px; height: 800px; border: 1px solid #ccc;" id="contentsArea">
		<div id="div1" style="width: 100px; height: 100px; background-color: yellow; position: absolute; top: 50px; left: 50px;"></div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script type="text/javascript">
		$('#contentsArea').bind('click', function() {
			console.log(event);
			
			$('#pageX').val(event.pageX);
			$('#pageY').val(event.pageY);
		});
		
		/* 
			예제) 마우스 커서를 찍으면 그 방향으로 네모박스가 이동되도록 구현해보세요.
		*/
		
		$('#contentsArea').bind('click', function() {
			var x = event.pageX;
			var y = event.pageY;
			
			$('#div1').attr('top', x);
			$('#div1').attr('left', y);
			
			$('#div1').animate({marginLeft: x - 50 + 'px'}, 100, 'linear');
			$('#div1').animate({marginTop: y - 50 + 'px'}, 100, 'linear');

		});
	</script>
</body>
</html>