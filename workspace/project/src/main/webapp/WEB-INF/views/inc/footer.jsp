<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
		<!-- 하단 정보 -->
		<div class="footer">
			<div>
				<div class="f-logo">
					<h1><a href="./main.html"><img src="${pageContext.request.contextPath}/img/whale.png" alt="">animals</a></h1>
				</div>
				
				<div class="f-copy">
					<p>copyright(c) animals. All rights reserved.</p>
				</div>		
			</div>
		</div> <!-- footer -->
	</div> <!-- contents -->
	<!-- 컨텐츠 끝 -->

	<!-- 스크롤 js -->
	<script>
		AOS.init();
	</script>
	
	<!-- 배너 js -->
	<script>
		var swiper = new Swiper('.swiper-container', {
				spaceBetween: 30,
				loop: true,
				slidesPerView: 3,
				centeredSlides: true,
				autoplay: {
					delay: 2500,
					disableOnInteraction: false,
				},
				pagination: {
					el: '.swiper-pagination',
					clickable: true,
				},
				navigation: {
					nextEl: '.swiper-button-next',
					prevEl: '.swiper-button-prev',
			},
		});
	</script>

	<!-- 카운트업 js -->
	<script>
		$('.counter').counterUp({
			delay: 10,
			time: 1500
		});
	</script>

	<!-- autofix js -->
	<script>
		$(document).ready( function() {
			$(".header").autofix_anything()
		});
	</script>	
	
	<!-- fullpage 불러오기 -->
	<script type="text/javascript">
	    var myFullpage = new fullpage('#fullpage', {
	        anchors: ['firstPage', 'secondPage', '3rdPage', '4page'],
	        //sectionsColor: ['#C63D0F', '#1BBC9B', '#7E8F7C', '#66e4f5'],
	        scrollBar: true
	    });
	</script>	
	</body>
</html>