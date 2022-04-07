<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("../../css/content/momaMain.css");</style>
<script type="text/javascript">
		$(function() {
		// 페이징 현재페이지 설정
		$('#page'+${currentPage}).css({
			"color" : "var(--point-color)",
			"font-weight" : "600"
		});
		
		// filter modal open
		$('.filter').on('click', function() {
			$('.filter_modal').show();
			$('html body').css('overflow', 'hidden');
		});

		// filter modal close
		$('.close, .dim_box, .btn').on('click', function() {
			$('.filter_modal').hide();
			$('html body').css('overflow', 'auto');
		});

		// tag active : tag
		$('input[name="genre"]').on('change', function() {
			if ($(this).is(":checked")) {
				$(this).siblings("label").addClass('active');
			} else {
				$(this).siblings("label").removeClass('active');
			}
		});
	})
	
</script>
</head>
<body>
	<div class="container_wide">
		<section class="content_main">
			<div class="button_box">
				<a class="filter"><img alt="필터" src="../../img/icon/filter.png"> <span>필터</span>
				</a>
			</div>
			<div class="content_list">
			<img style="background: url(/moma/img/poster/${content.poster }) no-repeat center; background-size: cover;">
				<ul>
					
						<c:forEach var="content" items="${list }">
							
								<li>
									<a href="contentView.do?cno=${content.cno }">
										<img style="background: url(/moma/img/poster/${content.poster }) no-repeat center; background-size: cover;">
										<div class="text_area">
											<p class="content_list_title">${content.cname }</p>
										</div>
									</a>
								</li>
							
						</c:forEach>
				
					<!-- 태그별 조회 -->
					<c:if test="${not empty listGenre }">
						<c:forEach var="content" items="${listGenre }">
							<c:if test="${content.sort == 'M' }">
								<li>
									<a href="contentView.do?cno=${content.cno }"> 
										<img style="background: url(/moma/img/poster/${content.poster }) no-repeat center; background-size: cover;">
										<div class="text_area">
											<p class="content_list_title">${content.cname }</p>
										</div>
									</a>
								</li>
							</c:if>
						</c:forEach>
					</c:if>
				</ul>
			</div>

			<!-- paging -->
			<div class="paging">
				<div class="items">
					<div class="prev_btn">
						<c:if test="${startPage > PAGE_PER_BLOCK}">
							<button class="first" onclick="location.href='movieMain.so?pageNum=${startPage - 1}'">
								<img alt="이전" src="../../img/icon/left (1).png">
							</button> 
						</c:if>
						<c:if test="${pageNum > 1}">
							<button class="prev" onclick="location.href='movieMain.so?pageNum=${currentPage - 1}'">
								<img alt="이전" src="../../img/icon/left.png">
							</button>
						</c:if>
					</div>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<span id="page${i}" class="page_num" onclick="location.href='movieMain.so?pageNum=${i}'">${i}</span>
					</c:forEach>
					<div class="next_btn">
						<c:if test="${currentPage < totalPage}">
							<button class="next" onclick="location.href='movieMain.so?pageNum=${currentPage + 1}'">
								<img alt="다음" src="../../img/icon/right (1).png">
							</button>
						</c:if>
						<c:if test="${endPage < totalPage}">
							<button class=last onclick="location.href='movieMain.so?pageNum=${endPage + 1}'">
								<img alt="다음" src="../../img/icon/right.png">
							</button> 
						</c:if>
					</div> <!-- next_btn -->
				</div> <!-- number -->
			</div> <!-- paging -->
		</section>
	</div>

	<!-- modal -->
	<form class="filter_modal" action="movieMain.so" method="post">
		<div class="dim_box"></div>
		<div class="modal_content">
			<img class="close" src="../../img/icon/close.png"></img>
			<div class="content_inner">
				<!-- left -->
				<div class="block">
					<p class="modal_title">태그</p>
					<div class="genre_box">
						<!-- Genre tag -->
						<div class="label_box">
							<input type="checkbox" name="genre" id="t1" value="로맨스">
							<label class="genre" for="t1">로맨스</label>
						</div>
						<div class="label_box">
							<input type="checkbox" name="genre" id="t1" value="로맨스">
							<label class="genre" for="t2">SF</label>
						</div>
						<div class="label_box">
							<input type="checkbox" name="genre" id="t3" value="범죄">
							<label class="genre" for="t3">범죄</label>
						</div>
						<div class="label_box">
							<input type="checkbox" name="genre" id="t4" value="공포">
							<label class="genre" for="t4">공포</label>
						</div>
						<div class="label_box">
							<input type="checkbox" name="genre" id="t5" value="코미디">
							<label class="genre" for="t5">코미디</label>
						</div>
						<div class="label_box">
							<input type="checkbox" name="genre" id="t6" value="스릴러">
							<label class="genre" for="t6">스릴러</label>
						</div>
						<div class="label_box">
							<input type="checkbox" name="genre" id="t7" value="액션">
							<label class="genre" for="t7">액션</label>
						</div>
						<div class="label_box">
							<input type="checkbox" name="genre" id="t8" value="드라마">
							<label class="genre" for="t8">드라마</label>
						</div>
						<div class="label_box">
							<input type="checkbox" name="genre" id="t9" value="판타지">
							<label class="genre" for="t9">판타지</label>
						</div>
						<div class="label_box">
							<input type="checkbox" name="genre" id="t10" value="다큐멘터리">
							<label class="genre" for="t10">다큐멘터리</label>
						</div>
					</div>
				</div>
			</div>
			<div class="btn_box">
				<input class="btn" type="submit" value="확인">
			</div>
		</div>
	</form>
</body>
</html>