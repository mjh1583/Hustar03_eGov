<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>계산기</title>
</head>
<body>
	<table>
		<tr>
			<td colspan="4">
				<input type="text" id="monitor">
			</td>
		</tr>
		<tr>
			<td><input type="button" value="7" class="btn"></td>
			<td><input type="button" value="8" class="btn"></td>
			<td><input type="button" value="9" class="btn"></td>
			<td><input type="button" value="+" class="btn"></td>
		</tr>
		<tr>
			<td><input type="button" value="4" class="btn"></td>
			<td><input type="button" value="5" class="btn"></td>
			<td><input type="button" value="6" class="btn"></td>
			<td><input type="button" value="-" class="btn"></td>
		</tr>
		<tr>
			<td><input type="button" value="1" class="btn"></td>
			<td><input type="button" value="2" class="btn"></td>
			<td><input type="button" value="3" class="btn"></td>
			<td><input type="button" value="*" class="btn"></td>
		</tr>
		<tr>
			<td><input type="button" value="0" class="btn"></td>
			<td><input type="button" value="C" class="btn"></td>
			<td><input type="button" value="=" class="btn"></td>
			<td><input type="button" value="/" class="btn"></td>
		</tr>
	</table>
	
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script type="text/javascript">
		/*
			예제) 계산기를 만들어보세요.
		*/
		var nums = new Array(); //숫자를 담을 배열
		var contents = "";  //숫자를 담은 배열 nums를 하나의 매끄러운 문장으로 바꿔서 담은 문자열
			
		$(document).ready(function() {
			
		});
		
		$(".btn").bind("click", function() {
			var input = $(this).val();  //클릭한 버튼의 value를 가져와서 저장
			
			if(input == "C") {  //C를 클릭하면 배열을 모두 비워버림
				nums = [];
				contents = "";
				$("#monitor").val(nums);
			}
			else if(input == "=") { //contents에 담긴 값들을 모두 계산하여 monitor에 출력
				contents = toSting(nums);
				nums = [];
				$("#monitor").val(eval(contents));
			}
			else { //C와 =을 제외한 모든 버튼의 값들을 배열에 추가
				var before = nums[nums.length - 1];
			
				if(input == "+" || input == "-" || input == "*" || input == "/") { //연산자가 두번 연속으로 올 수는 없음
					if(before == "+" || before == "-" || before == "*" || before == "/") {
						alert("연산자는 연속으로 입력할 수 없습니다.");
					}
					else if(nums.length == 0) {
						alert("처음에 연산자를 입력할 수 없습니다.");
					}
					else {
						show(input);
					}
				}
				else {
					show(input);
				}
			}
		});
		
		function toSting(nums) {
			var sentence = "" 
			nums.forEach(function(item, index, array) {
				sentence += item;
			});
			
			return sentence;
		}
		
		function show(input) {
			nums.push(input);
			contents = toSting(nums);
			$("#monitor").val(contents);
		}
		
	</script>
</body>
</html>