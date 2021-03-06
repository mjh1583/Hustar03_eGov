<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
<%@ include file="/WEB-INF/views/inc/menu.jsp" %>

<div class="booking-view">
	<form method="post" name="frm" action="<c:url value='/booking/booking.do'/>" />
		<div class="booking-box">
			<h2><c:out value='${location}'/> 예약하기 상세보기</h2>
			<input type="hidden" value="${location}" name="location" >
			
			<div class="calendar-wrap" data-aos="flip-up" data-aos-delay="100">
				<div class="view-photo" data-aos="fade-up" data-aos-delay="200">
					<!-- 배너 -->
					<div class="view-banner">
						<!-- Swiper -->
						<div class="swiper-container">
							<div class="swiper-wrapper">
								<div class="swiper-slide"><img src="../img/haedal2.jpg"></div>
								<div class="swiper-slide"><img src="../img/cat.jpg"></div>
								<div class="swiper-slide"><img src="../img/dog.jpg"></div>
								<div class="swiper-slide"><img src="../img/sudal.jpg"></div>
								<div class="swiper-slide"><img src="../img/haedal.jpg"></div>
								<div class="swiper-slide"><img src="../img/squirrel.jpg"></div>
								<div class="swiper-slide"><img src="../img/beluga.jpg"></div>
							</div>
							<!-- Add Arrows -->
							<div class="swiper-button-next"></div>
							<div class="swiper-button-prev"></div>
							<!-- Add Pagination -->
							<div class="swiper-pagination"></div>
						</div>
					</div>
				</div> <!-- view-photo -->
	
				<div class="calendar-box" data-aos="fade-up" data-aos-delay="300">
					<!-- 달력 -->
					<div class="cal-hd">
						<span class="before"><a href="#none">이전달</a></span>
						<span class="month">2021.05</span>
						<span class="after"><a href="#none">다음달</a></span>
					</div>
	
					<div class="cal-bd">
						<ul class="style01">
							<li><a href="#none"><span class="day">일</span></a></li>
							<li><a href="#none"><span class="day">월</span></a></li>
							<li><a href="#none"><span class="day">화</span></a></li>
							<li><a href="#none"><span class="day">수</span></a></li>
							<li><a href="#none"><span class="day">목</span></a></li>
							<li><a href="#none"><span class="day">금</span></a></li>
							<li><a href="#none"><span class="day">토</span></a></li>
						</ul>
						<ul>
							<li class="off"><a href="#none"><span class="off">25</span></a></li>
							<li class="off"><a href="#none"><span class="off">26</span></a></li>
							<li class="off"><a href="#none"><span class="off">27</span></a></li>
							<li class="off"><a href="#none"><span class="off">28</span></a></li>
							<li class="off"><a href="#none"><span class="off">29</span></a></li>
							<li class="off"><a href="#none"><span class="off">30</span></a></li>
							<li class="on"><a href="#none"><span class="off">1</span></a></li>
						</ul>
						<ul>
							<li class="on"><a href="#none"><span class="off">2</span></a></li>
							<li class="on"><a href="#none"><span class="off">3</span></a></li>
							<li class="on"><a href="#none"><span>4</span></a></li>
							<li class="on"><a href="#none"><span>5</span></a></li>
							<li class="on"><a href="#none"><span>6</span></a></li>
							<li class="on"><a href="#none"><span>7</span></a></li>
							<li class="on"><a href="#none"><span>8</span></a></li>
						</ul>
						<ul>
							<li class="on"><a href="#none"><span>9</span></a></li>
							<li class="on"><a href="#none"><span>10</span></a></li>
							<li class="on"><a href="#none"><span>11</span></a></li>
							<li class="on"><a href="#none"><span>12</span></a></li>
							<li class="on"><a href="#none"><span>13</span></a></li>
							<li class="on"><a href="#none"><span>14</span></a></li>
							<li class="on"><a href="#none"><span>15</span></a></li>
						</ul>
						<ul>
							<li class="on"><a href="#none"><span>16</span></a></li>
							<li class="on"><a href="#none"><span>17</span></a></li>
							<li class="on"><a href="#none"><span>18</span></a></li>
							<li class="on"><a href="#none"><span>19</span></a></li>
							<li class="on"><a href="#none"><span>20</span></a></li>
							<li class="on"><a href="#none"><span>21</span></a></li>
							<li class="on"><a href="#none"><span>22</span></a></li>
						</ul>
						<ul>
							<li class="on"><a href="#none"><span>23</span></a></li>
							<li class="on"><a href="#none"><span>24</span></a></li>
							<li class="on"><a href="#none"><span>25</span></a></li>
							<li class="on"><a href="#none"><span>26</span></a></li>
							<li class="on"><a href="#none"><span>27</span></a></li>
							<li class="on"><a href="#none"><span>28</span></a></li>
							<li class="on"><a href="#none"><span>29</span></a></li>
						</ul>
						<ul>
							<li><a href="#none"><span>30</span></a></li>
							<li class="on"><a href="#none"><span>31</span></a></li>
							<li class="off"><a href="#none"><span class="off">1</span></a></li>
							<li class="off"><a href="#none"><span class="off">2</span></a></li>
							<li class="off"><a href="#none"><span class="off">3</span></a></li>
							<li class="off"><a href="#none"><span class="off">4</span></a></li>
							<li class="off"><a href="#none"><span class="off">5</span></a></li>
						</ul>
					</div> <!-- cal-bd -->	
				</div> <!-- calendar-box -->
	
				<div class="btn-box" data-aos="fade-up" data-aos-delay="300">
					<a href="<c:url value='/booking/list.do' />">이전</a>
					<input type="text" name="booking_date" size="8" id="booking_date"> <!-- 예약 날짜 -->
					<a href="#none" onclick="document.frm.submit();">예약하기</a>
				</div> <!-- btn-box -->
	
				<div class="detail" data-aos="fade-up" data-aos-delay="400">
					<div class="text">
						<p>상세설명입니다.</p>
					</div>
				</div> <!-- detail -->
			</div> <!-- calendar-wrap -->
		</div> <!-- booking-box -->
	</form>
</div> <!-- booking-view -->
<script>
$(".calendar-box .on").click(function() {
	console.log("select = " + $(this).text());
	
	$(".calendar-box .on").removeClass("selected");
	$(this).addClass("selected");
	
	var year = "2021";
	var month = "05";
	var day = $(this).text() < 10 ? "0" + $(this).text() : $(this).text(); //날짜가 한자리 수면 두 글자로 만들어 줌
	console.log(year +"-"+ month +"-"+ day);
	console.log("2021-05-" + $(this).text()); //이전 결과
	
	$("#booking_date").val(year +"-"+ month +"-"+ day);
});
</script>
<%@ include file="/WEB-INF/views/inc/footer.jsp" %>