<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
<%@ include file="/WEB-INF/views/inc/menu.jsp" %>

	<!-- main-visual -->
	<div class="main-visual">
		<h2 data-aos="fade-up" data-aos-delay="100">혼자 보기 아깝다</h2>
		<p data-aos="fade-up" data-aos-delay="100">
			<!-- br은 줄바꿈 태그 -->
			<span data-aos="fade-up" data-aos-delay="200">귀여운 동물들을 보면서 혼자보기 아깝다는 생각을 하신 경험이 있으신가요?</span>
			<span data-aos="fade-up" data-aos-delay="300">여기서 실컷 자랑해봅시다.</span>
			<span data-aos="fade-up" data-aos-delay="1000">내가 보게.</span>
		</p>
	</div> <!-- main-visual -->
	
	<!-- <div class="test-visual">
		<div class="main-bg-box">
			<img src="./img/beluga.jpg" alt="">
		</div>
		<div class="main-txt">
			<h2 data-aos="fade-up" data-aos-delay="100">혼자 보기 아깝다</h2>
			<p data-aos="fade-up" data-aos-delay="300">
				<span data-aos="fade-up" data-aos-delay="300">혼자보기 아깝다는 생각을 해본적이 한번씩 있을겁니다.</span>
				<span data-aos="fade-up" data-aos-delay="500">여기서 실컷 자랑해봅시다.</span>
				<span data-aos="fade-up" data-aos-delay="1000">내가보게.</span>
			</p>
		</div>
	</div> -->
	
	<div class="numbers-wrap" data-aos="fade-up" data-aos-delay="100">
		<div class="numbers">
			<h2>2021 SNS 동물 계정</h2>
			<p>SNS에 동물 사진을 업로드하는 많은 사람들</p>

			<div class="num-data">
				<ul>
					<li  data-aos="fade-up" data-aos-delay="100">
						<p class="counter">1,000,000</p>
						<span>개</span><br><br>
						<img src="./img/dog.jpg" alt="">
					</li>
					<li data-aos="fade-up" data-aos-delay="200">
						<p class="counter">2,000,000</p>
						<span>고양이</span><br><br>
						<img src="./img/cat.jpg" alt="">
					</li>
					<li data-aos="fade-up" data-aos-delay="300">
						<p class="counter">3,000,000</p>
						<span>특이한 반려동물</span><br><br>
						<img src="./img/squirrel.jpg" alt="">
					</li>
					<li data-aos="fade-up" data-aos-delay="400">
						<p class="counter">5,000,000</p>
						<span>그 외</span><br><br>
						<img src="./img/sudal.jpg" alt="">
					</li>
				</ul>
			</div>
		</div> <!-- numbers -->
	</div> <!-- numbers-wrap -->
	
	<!-- 배너 -->
	<div class="slide-banner" data-aos="fade-up" data-aos-delay="100">
		<h2>Weakly Best</h2>
		<!-- Swiper -->
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<div class="swiper-slide"><img src="${pageContext.request.contextPath}/img/dog.jpg" alt=""></div>
				<div class="swiper-slide"><img src="${pageContext.request.contextPath}/img/cat.jpg" alt=""></div>
				<div class="swiper-slide"><img src="${pageContext.request.contextPath}/img/haedal.jpg" alt=""></div>
				<div class="swiper-slide"><img src="${pageContext.request.contextPath}/img/haedal2.jpg" alt=""></div>
				<div class="swiper-slide"><img src="${pageContext.request.contextPath}/img/squirrel.jpg" alt=""></div>
				<div class="swiper-slide"><img src="${pageContext.request.contextPath}/img/beluga.jpg" alt=""></div>
			</div>
			<!-- Add Pagination -->
			<div class="swiper-pagination"></div>
			<!-- Add Arrows -->
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
		</div>
	</div>
	
	<!-- 갤러리 -->
	<div class="main-gallery-wrap">
		<div class="m-g-box">
			<h2>Gallery</h2>

			<div class="main-gallery">
				<ul>
					<li data-aos="fade-up" data-aos-delay="100">
						<div>
							<div class="thum">
								<a href="#none">
									<img src="${pageContext.request.contextPath}/img/beluga.jpg" alt="">
								</a>
							</div>
							<div class="info">
								<a href="#none">
									<h3>벨루가</h3>
									<p>벨루가는 흰 돌고래</p>
									<span>
										<i class="fa fa-eye" aria-hidden="true"></i>
										<u>link</u>
									</span>
								</a>
							</div>
						</div>
					</li>
					<li data-aos="fade-up" data-aos-delay="200">
						<div>
							<div class="thum">
								<a href="#none">
									<img src="${pageContext.request.contextPath}/img/dog.jpg" alt="">
								</a>
							</div>
							<div class="info">
								<a href="#none">
									<h3>강아지</h3>
									<p>피리부는 강아지</p>
									<span>
										<i class="fa fa-eye" aria-hidden="true"></i>
										<u>link</u>
									</span>
								</a>
							</div>
						</div>
					</li>
					<li data-aos="fade-up" data-aos-delay="300">
						<div>
							<div class="thum">
								<a href="#none">
									<img src="${pageContext.request.contextPath}/img/cat.jpg" alt="">
								</a>
							</div>
							<div class="info">
								<a href="#none">
									<h3>고양이</h3>
									<p>행복하게 웃는 고양이</p>
									<span>
										<i class="fa fa-eye" aria-hidden="true"></i>
										<u>link</u>
									</span>
								</a>
							</div>
						</div>
					</li>
					<li data-aos="fade-up" data-aos-delay="400">
						<div>
							<div class="thum">
								<a href="#none">
									<img src="${pageContext.request.contextPath}/img/haedal.jpg" alt="">
								</a>
							</div>
							<div class="info">
								<a href="#none">
									<h3>해달</h3>
									<p>수달 아닙니다. 해달입니다.</p>
									<span>
										<i class="fa fa-eye" aria-hidden="true"></i>
										<u>link</u>
									</span>
								</a>
							</div>
						</div>
					</li>
					<li data-aos="fade-up" data-aos-delay="500">
						<div>
							<div class="thum">
								<a href="#none">
									<img src="${pageContext.request.contextPath}/img/haedal2.jpg" alt="">
								</a>
							</div>
							<div class="info">
								<a href="#none">
									<h3>하위</h3>
									<p>수달 아닙니다. 해달 입니다. 인사하는 해달입니다.</p>
									<span>
										<i class="fa fa-eye" aria-hidden="true"></i>
										<u>link</u>
									</span>
								</a>
							</div>
						</div>
					</li>
					<li data-aos="fade-up" data-aos-delay="600">
						<div>
							<div class="thum">
								<a href="#none">
									<img src="${pageContext.request.contextPath}/img/squirrel.jpg" alt="">
								</a>
							</div>
							<div class="info">
								<a href="#none">
									<h3>두둥등장</h3>
									<p>아이언맨 등장씬이 떠오르는 다람쥐</p>
									<span>
										<i class="fa fa-eye" aria-hidden="true"></i>
										<u>link</u>
									</span>
								</a>
							</div>
						</div>
					</li>
					
				</ul>
			</div> <!-- main-gallery -->
		</div> <!-- "m-g-box -->
	</div> <!-- main-gallery-wrap -->
</div> <!-- contents -->
<!-- 하단 푸터 불러오기 -->
<%@ include file="/WEB-INF/views/inc/footer.jsp" %>