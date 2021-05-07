<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>날짜, interval</title>
</head>
<body>
	<div id="interval">
		
	</div>
	
	<div id="clock">
		
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			//fn_interval();
			fn_clock();
		});
		
		var cnt = 0;
		
		function fn_interval() {
			var intver = setInterval(function() {
				cnt++;
				if(cnt == 10) {
					clearInterval(intver);
				}
				$("#interval").append("안녕하세요! <br/>");
			}, 1000);
		}
		
		function fn_clock() {
			var intver = setInterval(function() {
				fn_getDt();
			}, 1000);
		}
		
		function fn_getDt() {
			var dt = new Date();
			var hour = dt.getHours();
			var minute = dt.getMinutes();
			var second = dt.getSeconds();
			
			if(hour < 10)
				hour = "0" + hour;
			if(minute < 10)
				minute = "0" + minute;
			if(second < 10)
				second = "0" + second;
			
			$("#clock").html(hour + ":" + minute + ":" + second);
		}
	</script>
</body>
</html>