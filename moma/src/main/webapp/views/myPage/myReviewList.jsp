<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/views/sessionChk.jsp"%>
<style type="text/css">@import url("/css/myPage/common_my.css");</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	// 페이징 현재페이지 설정
	$('#page'+${currentPage}).css({
		"color" : "var(--point-color)",
		"font-weight" : "600"
	});
</script></head><body>
	<div class="container_middle">
		<!-- myMainMenu -->
		<jsp:include page="myMainMenu.jsp"></jsp:include>
		
		<!-- 내용 -->
		<div class="content_list">
			<c:if test="${list.size() == 0}">
				<ul class="noItems">
					<li><span class="txt_title">작성한 리뷰가 없습니다.</span></li>
				</ul>
			</c:if>
			<c:if test="${list.size() != 0}">
			<h3>내가 쓴 리뷰</h3>
				<ul>
					<c:forEach var="myReview" items="${list}">
						<li class="rv">
							<a href="/content/ContentView.do?cno=${myReview.cno}">
								<img style="background: url(/img/poster/${myReview.cno}.jpg) no-repeat center; background-size: cover;">
							</a>
							<div class="txt_area_rv">
								<p class="txt_small">작성일 ${myReview.rv_date }</p>
								<a href="/views/content/ContentView.do?cno=${myReview.cno}" class="cursor">
									<span class="txt_title">${myReview.cname}</span>
									<span class="txt">${myReview.rv_content}</span>
									★별점★ ${myReview.star_rate } / 10
								</a>
					
								<!-- pre 태그 안에 있는 css 요소 삭제 -->
								<script type="text/javascript">
									$(".txt_pre").find("*").css({
										"all" : "unset",
										"color" : "#000"
									});
									$(".txt_pre").find("img").css("display","none");
									// 게시글 삭제
									function del() {
										var con = confirm("삭제 하시겠습니까?");
										if(con) {
											location.href="/views/myPage/myReviewDelete.bb?rvno=${myReview.rvno}";
										}
									}
								</script>
								
								<div class="txt_bottom">
									<div class="btn_area_rv">
										<a href="/views/myPage/myReviewUpdateForm.bb?rvno=${myReview.rvno}"  class="btn_rv">수정</a>
										<a onclick="del()" class="btn_rv">삭제</a>
									</div>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</c:if>
		</div>
			
		<!-- paging -->
		<div class="paging">
			<div class="items">
				<div class="prev_btn">
					<c:if test="${startPage > PAGE_PER_BLOCK}">
						<button class="first" onclick="location.href='myReviewList.bb?pageNum=${startPage - 1}'">
							<img alt="이전" src="/moma/icons/left.png">
							<img alt="이전" src="/moma/icons/left.png">
						</button> 
					</c:if>
					<c:if test="${pageNum > 1}">
						<button class="prev" onclick="location.href='myReviewList.bb?pageNum=${currentPage - 1}'">
							<img alt="이전" src="/moma/icons/left.png">
						</button>
					</c:if>
				</div>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<span id="page${i}" class="page_num" onclick="location.href='myReviewList.bb?pageNum=${i}'">${i}</span>
				</c:forEach>
				<div class="next_btn">
					<c:if test="${currentPage < totalPage}">
						<button class="next" onclick="location.href='myReviewList.bb?pageNum=${currentPage + 1}'">
							<img alt="다음" src="/moma/icons/right.png">
						</button>
					</c:if>
					<c:if test="${endPage < totalPage}">
						<button class=last onclick="location.href='myReviewList.bb?pageNum=${endPage + 1}'">
							<img alt="다음" src="/moma/icons/right.png">
							<img alt="다음" src="/moma/icons/right.png">
						</button> 
					</c:if>
				</div> <!-- next_btn -->
			</div> <!-- number -->
		</div> <!-- paging -->
	</div>
</body>
</html>