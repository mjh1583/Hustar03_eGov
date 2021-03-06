<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>제어문(if, for, while, switch case, do while)</title>
</head>
<body>
	<script type="text/javascript">
		function fn_sample1() {
			var money = prompt("지갑에 있는 돈을 알려주세요.");
			
			if(money > 5000) {
				alert('엄청 부자시네요.');
			}
			else if(money > 3000) {
				alert('조금 부자시네요.');
			}
		}
		
		//fn_sample1();
		
		function fn_sample2() {
			for(var i = 1; i <= 10; i++) {
				document.write(i + "<br/>");
			}
		}
		
		//fn_sample2();
		
		function fn_sample3() {	
			for(var i = 1; i <= 10; i++) {
				
				if(i == 4) {
					continue;
				}
				
				if(i == 8) {
					break;
				}
				
				document.write(i + "<br/>");
			}
		}
		
		//fn_sample3();
		
		/*
			예제) 구구단을 출력해보세요. (2단 ~ 9단까지), 각 단 사이에는 한줄씩 비워주세요.
		*/
		
		function example() {
			for(var i = 2; i < 10; i++) {
				document.write(i + "단<br/>");
				for(var j = 1; j < 10; j++) {
					document.write(i + " x " + j + " = " + i * j + "<br/>");
				}
				document.write("<br/>");
			}
		}
			
		//example();
		
	
		/* 
			예제) prompt를 활용해 입력받은 단수의 구구단을 출력해 주세요. 
		*/
		
		function example2() {
			var num = prompt("출력할 구구단의 단을 입력하세요.");
			
			document.write(num + "단<br/>");
			
			for(var i = 1; i < 10; i++) {
				document.write(num + " x " + i + " = " + num * i + "<br/>");
			}
		}
		
		//example2();
		
		function sample4(grade) {
			switch(grade) {
				case 1:
					alert("1학년이시네요.");
					break;
				case 2:
					alert("2학년이시네요.");
					break;
				default:
					alert("모르겠어요.");
					break;
			}
		}
		
		//sample4(2);
		
		/* 
			예제) '네이버, 다음, 구글 중 즐겨쓰는 포털사이트는?' prompt에서 값을 입력받아 해당되는 사이트로 이동시켜 주세요. 
		*/
		
		function example3() {
			var portal = prompt("네이버, 다음, 구글 중 즐겨쓰는 포털사이트는?");
			
			switch(portal) {
				case 'naver', '네이버':
					location.href = "https://www.naver.com";
					break;
				case 'daum', '다음':
					location.href = "https://www.daum.net";
					break;
				case 'google', '구글':
					location.href = "https://www.google.com";
					break;
				default:
					alert("잘못된 입력입니다.");
					break;
			}
		}
		
		//example3();
		
		function sample5() {
			var i = 1;
			
			while(i <= 10) {
				document.write(i + "<br/>");
				i++;
			}
		}
		
		sample5();
	</script>
</body>
</html>