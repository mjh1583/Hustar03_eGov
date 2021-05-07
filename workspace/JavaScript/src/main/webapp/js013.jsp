<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ajax</title>
</head>
<body>
	<div>
		<input type="button" id="btn1" class="btn" value="tab1">
		<input type="button" id="btn2" class="btn" value="tab2">
		<input type="button" id="btn3" class="btn" value="tab3">
	</div>
	<div id="contentsArea1" class="contentsArea">
		
	</div>
	
	<div id="contentsArea2" class="contentsArea">
		
	</div>
	
	<div id="contentsArea3" class="contentsArea"s>
		
	</div>
	
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script type="text/javascript">
		/*
			예제) 페이지 로딩시 해당 탭의 페이지를 contentsArea 안에 넣고, 1번째 페이지만 보이도록 만들어 보세요.
			탭을 클릭하면 해당탭의 내용만 보여지게 하세요.
			탭별로 jsp013_1.jsp, jsp013_2.jsp, jsp013_3.jsp 파일을 만들어서 사용
		*/
		$("#btn1").bind("click", function() {
			fn_getPage("./js013_1.jsp", "1");
		});
		
		$("#btn2").bind("click", function() {
			fn_getPage("./js013_2.jsp", "2");
		});
		
		$("#btn3").bind("click", function() {
			fn_getPage("./js013_3.jsp", "3");
		});
		
		function fn_getPage(url, num) {
			$.ajax({
				url : url,
				type : "get",		
				dataType : "html",				
				success : function(data) {
					$("#contentsArea" + num).html(data);
					tabView(num);
				},
				error : function() {
					alert("오류가 발생하였습니다.");
				}
			});
		}
		
		function tab_view(num) {
			$(".contentsArea").hide();
			$("#contentsArea" + num).show();
		}
		
		$(document).ready(function() {
			fn_getPage("./js013_1.jsp", "1");
		});
		
	</script>
</body>
</html>