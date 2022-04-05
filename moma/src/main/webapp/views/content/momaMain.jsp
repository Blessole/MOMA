<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("../../css/content/momaMain.css");</style>
<script type="text/javascript">
	$(function() {
		var auto = true;
		var pause = 7000;
		var $this = $('.slider');
		
		var slidesCont = $this.children('.slides-container');
		var slides = slidesCont.children('.slide');
		var arrowsCont = $this.children('.arrows');
		var prevSlide = arrowsCont.children('.prev');
		var nextSlide = arrowsCont.children('.next');
		
		var slidesCount = slides.length;
		var currentSlide = slides.first();
		var currentSlideIndex = 1;
		var autoPlay = null;
		
		slides.not(':first').css('display', 'none');
		currentSlide.addClass('active');
		
		function fadeNext(){
			currentSlide.removeClass('active').fadeOut(700);
			
			if(currentSlideIndex == slidesCount){
				currentSlide = slides.first();
				currentSlide.delay(500).addClass('active').fadeIn(700);
				currentSlideIndex=1;
			} else {
				currentSlideIndex++;
				currentSlide = currentSlide.next();
				currentSlide.delay(500).addClass('active').fadeIn(700);
			}
		}
		function fadePrev(){
			currentSlide.removeClass('active').fadeOut(700);
			if (curentSlideIndex ==1){
				currentSlide=slides.last();
				currentSlide.delay(500).addClass('active').fadeIn();
				currentSlideIndex=slidesCount;
			} else {
				currentSlideIndex--;
				currentSlide = currentSlide.prev();
				currentSlide.delay(500).addClass('active').fadeIn(700);
			}
		}
		function AutoPlay(){
			clearInterval(autoPlay);
			if(auto == true) autoPlay = setInterval(function(){fadeNext()},pause);
		}
		$(nextSlide).click(function(e){
			e.preventDefault();
			fadeNext();
			AutoPlay();
		});
		$(prevSlide).click(function(e){
			e.preventDefault();
			fadePrev();
			AutoPlay();
		});
		AutoPlay();
	});
</script>
</head>
<body>
<!-- 검색바 -->
<div class="container_wide">
	<div class="search_container">
		<input class="search" type="text" name="srch" placeholder="검색어를 입력해주세요">
		<img class="search" id="search" alt="검색" src="/moma/img/icon/search.png" onclick="location.href='searchAction.so'" width="30px"></img>
	</div>
	
	<div class="slider">
		<div class="slides-container">
			<div class="slide" onclick="location.href='boardMain.ha'">
				<img alt="Slider img 1" src="/moma/img/board_image/1.JPG">
				<div class="centered">열대야에 어울리는 시원한 여름 힐링 영화<br>'맘마미아'</div>
			</div>
			<div class="slide" onclick="location.href='boardMain.ha'">
				<img alt="Slider img 2" src="/moma/img/board_image/2.jpg">
				<div class="centered">'요노스케 이야기'<br>평범했지만 웃음이 나오는 이야기</div>
			</div>
			<div class="slide" onclick="location.href='boardMain.ha'">
			<img alt="Slider img 3" src="/moma/img/board_image/3.jpg">
				<div class="centered">8살 소녀가 받아들인 이별이야기<br>'역으로 가는 길을 알려줘'</div>
			</div>
		</div>
		
		<div class="arrows">
			<a class="prev" href="#"><img class="left" alt="" src="/moma/img/icon/left.png"></a>
			<a class="next" href="#"><img class="right" alt="" src="/moma/img/icon/right (1).png"></a>
		</div>
	</div>

	<section class="content_main">
		<!-- 영화 -->
		<ul class="content_tab">
			<li class="title" id="tab1" onclick="location.href='movieMain.so'">영화</li>
			<div class="content_list">
			${content.cname }
				<ul>
					<c:forEach var="content" items="${list }">
						<c:if test="${content.sort == '영화' }">
							<li>
								<a href="contentView.jm?cno=${content.cno }">
									<img style="background: url(/moma/img/poster/${content.poster }) no-repeat center; background-size: cover;">
									<div class="text_area">
										<p class="content_list_title">${content.cname }</p>
									</div>
								</a>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</div>	
		</ul>
		<!-- 드라마 -->
		<ul class="content_tab">
			<li class="title" id="tab2" onclick="location.href='dramaMain.so'">드라마</li>
			<div class="content_list">
				<ul>
					<c:forEach var="content" items="${list }">
						<c:if test="${content.sort == '드라마' }">
							<li>
								<a href="contentView.jm?cno=${content.cno }">
									<img style="background: url(/moma/img/poster/${content.poster }) no-repeat center; background-size: cover;">
									<div class="text_area">
										<p class="content_list_title">${content.cname }</p>
									</div>
								</a>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</ul>
	</section>
</div>
</body>
</html>