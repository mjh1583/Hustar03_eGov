<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>경고문, 페이지 이동</title>
</head>
<body>
	<script type="text/javascript">
		function fn_message(msg) {
			alert(msg);
		}
		
		//fn_message("안녕하세요.");
		
		function fn_message2(msg1, msg2) {
			//confirm은 DB에서 데이터를 삭제하거나 할때 다시 질문하는 용도로 자주 사용
			var result = confirm("처음 오신건가요?");
			
			if(result) {
				alert(msg1);
			}
			else {
				alert(msg2);
			}
		}
		
		//fn_message2("처음 뵙겠습니다.", "간만이군요.");
		
		function fn_message3() {
			//prompt는 사용자에게 입력을 받음
			var msg = prompt("이름을 입력해주세요.");
			
			if(msg) {
				alert("당신의 이름은 " + msg + " 입니다.");
			}
		}
		
		//fn_message3();
		
		function fn_link(url) {
			location.href = url;
		}
		
		//fn_link("https://www.naver.com");
		
		/* 
			예제) prompt에서 '이동하실 URL을 입력하세요.' 메세지와 함께 url을 입력받아 예를 클릭시 URL로 이동하는 스크립트를 작성해보세요.
		*/
		
		function example() {	
			var url = prompt('이동하실 URL을 입력하세요.');
			
			var result = confirm("입력하신 URL로 이동하시겠습니까?");
			
			if(result) {
				location.href = url;
			}
			else {
				
			}
		}
			
		example();
	</script>
</body>
</html>