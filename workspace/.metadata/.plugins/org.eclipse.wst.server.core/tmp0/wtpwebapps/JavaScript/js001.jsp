<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>변수,함수 선언</title>
</head>
<body>
	<script type="text/javascript">
		var string = "나는 문자열입니다.";
		
		document.write(string);
		
		var number1 = "1000";
		var number2 = 500;
		
		document.write("<br/>");
		document.write(number1 + number2);
		document.write("<br/>");
		document.write(parseInt(number1) + number2);
		
		var number1 = 1000;
		var number2 = 500;
		
		document.write("<br/>");
		document.write(number1 + number2);
		
		var arr1 = new Array("1", "2", "3");
		
		var arr2 = new Array();
		arr2[0] = "1";
		arr2[1] = "2";
		arr2[2] = "3";
		
		console.log(number1);
		console.log(arr1);
		
		function fn_br() {
			document.write("<br/>");
		}
		
		function fn_message(msg1, msg2) {
			fn_br();
			fn_br();
			document.write(msg1);

			document.write("<br/>");
			document.write(msg2);
		}
		
		fn_message("메세지1 입니다.", "메세지2 입니다.");
		fn_message("메세지3 입니다.", "메세지4 입니다.");
		fn_message("메세지5 입니다.", "메세지6 입니다.");
		fn_message("메세지7 입니다.", "메세지8 입니다.");
	</script>
</body>
</html>