<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 상단 헤더 불러오기 -->
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="Generator" content="EditPlus">
		<meta name="Author" content="">
		<meta name="Keywords" content="">
		<meta name="Description" content="">

		<!-- 반응형(기기 해상도별) -->
		<meta name="viewport" content="width=divice-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=yes">

		<title>animals</title>
		
		<!-- 기본 스타일 css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

		<!-- jQuery -->
		<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
		
		<!-- 스와이퍼 -->
		<script src="${pageContext.request.contextPath}/js/swiper.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/js/swiper.min.css">
		
		<!-- 스크롤 애니메이션 -->
		<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
		<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

		<!-- fullpage -->
		<script src="${pageContext.request.contextPath}/js/fullpage.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/js/fullpage.min.css">

		<!-- 스크롤시 fixed -->
		<script src="${pageContext.request.contextPath}/js/autofix.js"></script>
	
		<!-- 카운트업 -->
		<script src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/jquery.counterup.min.js"></script>

		<script src="${pageContext.request.contextPath}/js/video.js"></script>
		<!--2. 비디오를 웹브라우저에 노출하기 위한 플러그인입니다. 비디오 재생 플레이어의 일종이라 생각하시면 됩니다.-->
		<script src="${pageContext.request.contextPath}/js/bigvideo.js"></script>
		<!--3. 비디오나 이미지를 풀사이즈로 넣는 플러그인입니다. -->
		<script src="${pageContext.request.contextPath}/js/imagesloaded.pkgd.min.js"></script>
		<!-- 4. 비디오가 아닌 이미지로 풀사이즈일 경우 bigvideo.js에서 이 파일을 호출하게 됩니다. -->
		
		<!-- 아이콘 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

		<!-- 모바일 -->
		<link rel="stylesheet" media="screen and (max-width: 480px)" href="${pageContext.request.contextPath}/css/480.css"> <!-- 해상도 480 이하는 480.css 적용 -->
		<!-- 태블릿 세로 -->
		<link rel="stylesheet" media="screen and (min-width: 481px) and (max-width: 720px)" href="${pageContext.request.contextPath}/css/720.css"> <!-- 해상도 481 이상 720 이하는 720.css 적용 -->
		<!-- 태블릿 가로 -->
		<link rel="stylesheet" media="screen and (min-width: 721px) and (max-width: 1024px)" href="${pageContext.request.contextPath}/css/1024.css">
		<!-- PC -->
		<link rel="stylesheet" media="screen and (min-width: 1025px)" href="${pageContext.request.contextPath}/css/pc.css"> <!-- 해상도 1025 이상은 pc.css 적용 -->
		
		<!-- 파비콘 -->
		<link rel="icon" href="${pageContext.request.contextPath}/img/whale.png">
	</head>

	