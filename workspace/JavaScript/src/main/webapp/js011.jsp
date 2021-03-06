<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>animation</title>
</head>
<body>
	<div style="width: 1000px; height: 500px; border: 1px solid;" id="contentsArea">
		<div id="div1" style="width: 100px; height: 100px; background-color: yellow; position: absolute; top: 50px; left: 50px;"></div>
	</div>
	
	<input type="button" id="btn1" value="시작"/>
	<br>
	<textarea id="xy" style="width: 1000px; height: 300px"></textarea>
	
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script type="text/javascript">
		/* 
			contentsArea에 마우스를 찍으면 textArea에 좌표가 입력되고 (여러개 찍을 수 있도록), 시작 버튼을 누르면 해당 위치로 이동이 가능하도록 구현하세요.
		*/
		var list = new Array();
		var inverse_list = new Array();
		
		$('#contentsArea').bind('click', function() {		
			var x = event.pageX;
			var y = event.pageY;
			
			var xy = new Array();
			
			xy[0] = x;
			xy[1] = y;
			
			list.push(xy);
			
			$('#xy').append("x = " + x + ", y = " + y + "\n");
		});
		
		$('#btn1').bind('click', function() {
			if(list.length >= 2) {
				for(var i = list.length - 2; i >= 0; i--) {
					inverse_list.push(list[i]);	
				}
			}
			inverse_list.push(new Array(50, 50));
			
			list.forEach(function(item, index, array) {			
				var x = item[0];
				var y = item[1];
				
				$('#div1').animate({top: y + 'px', left: x + 'px'}, 100, 'linear');
			})
			
			inverse_list.forEach(function(item, index, array) {			
				var x = item[0];
				var y = item[1];
				
				$('#div1').animate({top: y + 'px', left: x + 'px'}, 100, 'linear');
			})
			
			list = [];
			inverse_list = [];
			$('#xy').empty();
		});
	</script>
</body>
</html>