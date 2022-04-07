<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <%@ include file="../sessionChk.jsp" %>  -->
<!-- <link rel="stylesheet" type="text/css" href="../../css/myPage/myCommon.css"> -->
<script type="text/javascript">
	function showCon(id) {
		location.href = id + ".bb";
	}
</script>
<!-- 프로필, 메뉴 -->
<div class="menu">
	<ul>
		<li class="profile_txt">
			<h2>${member.nickname}님, 안녕하세요.</h2>
		</li>
		<!-- 메뉴 영역 -->
		<li class="category">
			<ul>
				<li id="myLikeList" onclick="showCon(this.id)">
					<span class="dot"></span><img src="/moma/img/myPage_image/myLikes.png" height="100">My Likes
					<%-- <span class="point-color">${bmTotal}</span> 좋아요총갯수 보여줄까말까~~ --%>
				</li>
				<li id="myReserveList" onclick="showCon(this.id)">
					<span class="dot"></span><img src="/moma/img/myPage_image/reservation.png" height="100">Reservation
				</li>
				<li id="myReviewList" onclick="showCon(this.id)">
					<span class="dot"></span><img src="/moma/img/myPage_image/myReview.png" height="100">My Review
				</li>
				<li id="updateForm" onclick="showCon(this.id)">
					<span class="dot"></span><img src="/moma/img/myPage_image/myInfo.png" height="100">My Info
				</li>
			</ul>
		</li>
	</ul>
</div>
