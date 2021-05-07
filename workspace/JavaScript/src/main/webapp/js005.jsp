<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>이벤트 - JQuery</title>
</head>
<body>
	<div>
		<input type="text" id="txt" class="cls_txt" name="txt" placeholder="입력란..."/>
		<input type="text" id="txt2" class="cls_txt" name="txt2" placeholder="입력란2..."/>
		<input type="text" id="txt3" class="cls_txt" name="txt3" placeholder="입력란3..."/>
		<input type="button" value="입력체크" onclick="fn_check();"/>
		<input type="button" value="값 출력" onclick="fn_print();"/>
	</div>
	
	<div>
		<div id="contentsArea">
			콘텐츠 영역입니다.		
		</div>
		<input type="button" value="변경" onclick="fn_change();"/>
		<input type="button" value="추가" onclick="fn_add();"/>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
	<script type="text/javascript">
		function fn_check() {
			//$('#txt').val("testtest!!!");
			//$('.cls_txt').val("클래스 테스트 입니다.");	
			//$('input').val("태그네임 selector");	
			//$('input[name="txt"]').val("txt입니다.");
			
			//alert($('#txt').attr('type'));
			$('#txt').attr('type', 'button');
			$('#txt').val('입력체크2');
			$('#txt').attr('onclick', 'fn_check2();');
			
			$('#txt2').attr('onclick', 'fn_check2();');
		}
		
		function fn_check2() {
			alert('버튼으로 변경되었습니다.');
		}
		
		function fn_change() {
			$('#contentsArea').html('<a href="https://naver.com">' + $('#contentsArea').html() + '네이버</a>');
		}
		
		function fn_add() {
			$('#contentsArea').append("추가된 내용입니다.");
		}
		
		function fn_print() {
			var cnt = 0;
			$('.cls_txt').each(function() {
				if($(this).attr("id") == "txt3") {
					alert("값이 바꼈네요.");
					$(this).attr("id", "txt4");	
				}
			});
		}
		
		//페이지가 모두 로딩된 후에 함수를 사용할 수 있음 => 안정성 있게 함수 사용
		$(document).ready(function() {
			fn_print();
		});
	</script>
</body>
</html>