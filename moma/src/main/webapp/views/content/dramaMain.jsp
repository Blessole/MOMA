<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <style type="text/css">@import url("../../css/content/momaMain.css");</style> -->
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
		})

		// filter modal close
		$('.close, .dim_box, .btn').on('click', function() {
			$('.filter_modal').hide();
			$('html body').css('overflow', 'auto');
		})

		// tag active : tag
		$('input[name="tag"]').on('change', function() {
			if ($(this).is(":checked")) {
				$(this).siblings("label").addClass('active');
			} else {
				$(this).siblings("label").removeClass('active');
			}
		})
	})
	
</script>
</head>
<body>
	<div class="container_wide">
	<div class="title">드라마</div>
		<section class="content_main">
			<div class="button_box">
				<a class="filter"><img alt="필터" src="../../img/icon/filter.png"><span>필터</span></a>
			</div>
			<div class="content_list">
			<p>${content.cname }</p>   <!--  일부러 뭐든 찍어보라고 넣어놓은거! -->
			<img style="background: url(/moma/img/poster/${content.poster }) no-repeat center; background-size: cover;">
				<ul>
					<!-- 전체 조회 -->
					<c:if test="${empty listTag }">
						<c:forEach var="content" items="${list }">
							<c:if test="c">
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
					<!-- 태그별 조회 -->
					<c:if test="${not empty listTag }">
						<c:forEach var="content" items="${listTag }">
							<c:if test="${content.sort == '드라마' }">
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
							<button class="first" onclick="location.href='momaMain.so?pageNum=${startPage - 1}'">
								<img alt="이전" src="../../img/icon/left (1).png">
							</button> 
						</c:if>
						<c:if test="${pageNum > 1}">
							<button class="prev" onclick="location.href='momaMain.so?pageNum=${currentPage - 1}'">
								<img alt="이전" src="../../img/icon/left.png">
							</button>
						</c:if>
					</div>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<span id="page${i}" class="page_num" onclick="location.href='momaMain.so?pageNum=${i}'">${i}</span>
					</c:forEach>
					<div class="next_btn">
						<c:if test="${currentPage < totalPage}">
							<button class="next" onclick="location.href='momaMain.so?pageNum=${currentPage + 1}'">
								<img alt="다음" src="../../img/icon/right (1).png">
							</button>
						</c:if>
						<c:if test="${endPage < totalPage}">
							<button class=last onclick="location.href='momaMain.so?pageNum=${endPage + 1}'">
								<img alt="다음" src="../../img/icon/right.png">
							</button> 
						</c:if>
					</div> <!-- next_btn -->
				</div> <!-- number -->
			</div> <!-- paging -->
		</section>
	</div>

	<!-- modal -->
	<form class="filter_modal" action="dramaMain.so" method="post">
		<div class="dim_box"></div>
		<div class="modal_content">
			<img class="close" src="../../img/icon/close.png"></img>
			<div class="content_inner">
				<!-- left -->
				<div class="block">
					<p class="modal_title">태그</p>
					<div class="tag_box">
						<!-- tag -->
						<div class="label_box">
							<label class="tag" for="t1">로맨스</label>
							<input type="checkbox" name="tag" id="t1" value="로맨스">
						</div>
						<div class="label_box">
							<label class="tag" for="t2">SF</label>
							<input type="checkbox" name="tag" id="t2" value="SF">
						</div>
						<div class="label_box">
							<label class="tag" for="t3">범죄</label>
							<input type="checkbox" name="tag" id="t3" value="범죄">
						</div>
						<div class="label_box">
							<label class="tag" for="t4">공포</label>
							<input type="checkbox" name="tag" id="t4" value="공포">
						</div>
						<div class="label_box">
							<label class="tag" for="t5">코미디</label>
							<input type="checkbox" name="tag" id="t5" value="코미디">
						</div>
						<div class="label_box">
							<label class="tag" for="t6">스릴러</label>
							<input type="checkbox" name="tag" id="t6" value="스릴러">
						</div>
						<div class="label_box">
							<label class="tag" for="t7">액션</label>
							<input type="checkbox" name="tag" id="t7" value="액션">
						</div>
						<div class="label_box">
							<label class="tag" for="t8">드라마</label>
							<input type="checkbox" name="tag" id="t8" value="드라마">
						</div>
						<div class="label_box">
							<label class="tag" for="t9">판타지</label>
							<input type="checkbox" name="tag" id="t9" value="판타지">
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