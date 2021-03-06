<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>jQuery 이벤트</title>
</head>
<body>
	<input type="button" id="btn-minus" value="-" class="btn"/>
	<input type="text" id="size" value="12"/>
	<input type="button" id="btn-plus" value="+" class="btn"/>
	<div id="contentsArea" style="font-size: 12px;">
		안녕하세요. 반갑습니다.
	</div>


	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script type="text/javascript">
		/* 
			예제) 플러스 마이너스 버튼 클릭 시 size 안에 text도 변경되고 contentsArea 안의 텍스트가 해당 사이즈로 변경되게 스크립트를 만들어보세요.
			추가로 size안의 내용도 변경 시 contentsArea안의 사이즈 변경
			isNan() =  숫자일때 false, 숫자가 아닌값이 포함되면 true
			숫자가 아니면 '숫자로 입력해주세요.' 경고문 출력
		*/
		$('.btn').bind('click', function() {
			var id = $(this).attr('id');
			var size = parseInt($('#size').val());
			
			if(id == 'btn-minus') {
				size--;
			}
			else {
				size++;
			}
			$('#contentsArea').css('font-size', size);
			$('#size').attr('value', size);
		});
			
		$('#size').bind('change', function() {
			var size = parseInt($('#size').val());
		
			if(!isNaN(size)) {
				$('#contentsArea').css('font-size', size);
				$('#size').attr('value', size);
			}
			else {
				alert('숫자로 입력하세요.');
				$('#contentsArea').css('font-size', 12);
				$('#size').attr('value', 12);
			}
		});
	</script>
</body>
</html>