<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("../../css/content/contentView.css");</style>
<c:set var="id" value='${sessionScope.id}'></c:set>
<c:set var="mno" value='${sessionScope.mno}'></c:set>
<script type="text/javascript">

	$(function() {
		// input range rate 조절
		$('input[type="range"]').on('change mousemove', function() {
			var val = ($(this).val() - $(this).attr('min')) / ($(this).attr('max') - $(this).attr('min'));

		    $(this).css('background-image',
		                '-webkit-gradient(linear, left top, right top, '
		                + 'color-stop(' + val + ', #ff5f06), '
		                + 'color-stop(' + val + ', #e4e4e4)'
		                + ')'
           	);
		    // span에 등록한 별점(range value) 넣기
		    $('#input_span').text($(this).val());
		});
		
		// scroll top
		$('.scroll_top').on('click', function(e) {
			e.preventDefault();
			$('html, body').animate({scrollTop: 0}, 200);
		});
		
		// scroll top button show/hide
		$(window).scroll(function() {
			if ($(this).scrollTop() > 300) {
				$('.scroll_top').fadeIn(500);
			} else {
				$('.scroll_top').fadeOut('slow');
			}
		});
		
	});
	
	//session check
	function sChk(name) {
		var chk = "${empty id}";
		if (chk=="true") {
			var con = confirm("로그인이 필요합니다.");
			if (con) {				
				location.href="/moma/views/member/loginForm.bb";
			}
		} else {
			// 예매 체크
			if (name == 'reserve') {
				location.href="reserveForm.so?cno=${content.cno}";
			}
		}
	}
	
	// 좋아요 제어
	function likes() {
		if (${empty id}) {
			var con = confirm("로그인이 필요합니다.");
			if (con) {				
				location.href="/moma/views/member/loginForm.bb";
			}
		} else {
			$.post("contentLikesUpdate.do", "cno=${content.cno}", function(data) {
				$('.likes svg g').css('fill', data);
			});
		}
	}
	
	// 리뷰 페이징 스크롤 높이
	document.addEventListener("DOMContentLoaded", function() { // html load 이후
		if ("${pageNum}" > 1) {			
			window.scrollTo(0, $('.scrollTop').position().top);
		}
	});
	
</script>
</head>
<body>
	<div class="container_middle content_view_container">
		<h2 class="cname">${content.cname }</h2>
		<h5 class="sort">
			<c:choose> 
			<c:when test="${content.sort eq 'm' }"> 영화 / 드라마 > 영화 </c:when> 
			<c:otherwise> 영화 / 드라마 > 드라마 </c:otherwise> </c:choose>
		</h5>
		
		<!-- 상단 정보 -->
		<div class="content_view_top">
			<img src="../../img/poster/${content.poster }" alt="포스터">
			<div class="text_area">
				<!-- 평균 별점 -->
				<div class="star_avg">★★★★★︎ &nbsp;<span class="text">${star_rate }</span></div>
				<table class="bottom">
					<tr>
						<th>등급</th>
						<td>${content.clevel }세 이상</td>
					</tr>
					<tr>
						<th>관람 시간 / 회차 수</th>
						<td>${content.hours }</td>
					</tr>
					<tr>
						<th>장르</th>
						<td>${content.genre }</td>
					</tr>
					<tr>
						<th>개봉일 / 방영일</th>
						<td>${content.start_date }</td>
					</tr>
					<tr>
						<th>감독</th>
						<td>${content.director }</td>
					</tr>
					<tr>
						<th>출연진</th>
						<td>${content.actor }</td>
					</tr>
				</table>
					<div class="bottom_box">
					<c:if test="${content.reserve=='Y' }">
						<button class="btn" onclick="sChk('reserve')">예매하기</button>
					</c:if>
					<button class="btn2" onclick="location.href='${content.netflix }'"><img alt="netflix" src="../../img/icon/netflix.png"></button>
					<button class="btn2" onclick="location.href='${content.watcha }'"><img alt="watcha" src="../../img/icon/watcha.png"></button>
					<button class="btn2" onclick="location.href='${content.tving }'"><img alt="tving" src="../../img/icon/tving.png"></button>
				</div>
			</div>
		</div>
		<div class="content_view_bottom">
		<!-- 리뷰 리스트 : start -->
		<h4 class="sub_title pd_bottom">리뷰 <span>${rv_content }</span></h4>
		<!-- 평균 별점 -->
		<div class="star_avg">★★★★★ &nbsp;<span class="text">${star_rate }</span> </div>
		<ul class="review_list_box">
		    <c:forEach var="review" items="${list }">
		        <li>
		            <form action="reviewAction.do?cno=${content.cno }&rvno=${review.rvno }" method="post">
		                <div class="profile">
		                    <p class="nickname">${review.nickname }</p>
		                    <p class="rv_date">${review.rv_date }</p>
		                </div>
		                <p class="detail_txt review">
		                    ${review.rv_content }							
		                </p>
		            </form>
		        </li>
		    </c:forEach>
		</ul>
		<!-- 리뷰 리스트 : end -->
		
		<!-- paging -->
		<div class="paging">
		    <div class="items">
		        <div class="prev_btn">
		            <c:if test="${pageNum > 1}">
		                <button class="prev" onclick="location.href='contentView.do?cno=${content.cno }&pageNum=${currentPage - 1}'">
		                    <img alt="이전" src="../../img/icon/left (1).png">
		                </button>
		            </c:if>
		        </div>
		        <span class="page_num">${pageNum}</span>
		        <span>/</span>
		        <span class="page_num">${totalPage}</span>
		        <div class="next_btn">
		            <c:if test="${currentPage < totalPage}">
		                <button class="next" onclick="location.href='contentView.do?cno=${content.cno }&pageNum=${currentPage + 1}'">
		                    <img alt="다음" src="../../img/icon/right.png">
		                </button>
		            </c:if>
		        </div> <!-- next_btn -->
		    </div> <!-- number -->
		</div> <!-- paging -->

        <!-- 리뷰 등록 -->
        <form action="reviewAction.do?cno=${content.cno }" method="post">
        	<input type="hidden" name="rv_date" value="${review.rv_date }">
            <h4 class="sub_title">리뷰와 별점 등록</h4>
            <textarea name="rv_content" placeholder="감상평을 작성해 주세요." required="required" onclick="sChk()"></textarea>
            <p class="detail_txt pd_bottom">별점을 선택해 주세요.</p>
            <!-- 별점 등록 -->
            <div class="star_avg rate">
                <input type="range" name="star_rate" min="0" max="10" step="1" value="0" required="required">
                <span class="text" id="input_span">0</span>
            </div>
            <div class="submit_box">
                <input type="submit" class="btn" value="등록하기">
            </div>
        </form>
    </div>
   </div>
<div class="scroll_top"><div class="arrow"></div></div>
</body>
</html>