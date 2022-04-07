<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function showCon(id) {
		location.href = id + ".bb";
	}
</script></head><body>
	<div class="menu">
		<ul>
			<li class="profile_txt">
				<h2>${member.nickname}님,<br>안녕하세요.</h2>
			</li>
			<!-- 메뉴 영역 -->
			<li class="category">
				<ul>
					<li id="myLikeList" onclick="showCon(this.id)">
						<span class="dot"></span><img src="../../img/myPage_image/myLikes.png">My Likes
						<%-- <span class="point-color">${bmTotal}</span> 좋아요총갯수 보여줄까말까~~ --%>
					</li>
					<li id="myReserveList" onclick="showCon(this.id)">
						<span class="dot"></span><img src="../../img/myPage_image/reservation.png">Reservation
					</li>
					<li id="myReviewList" onclick="showCon(this.id)">
						<span class="dot"></span><img src="../../img/myPage_image/myReview.png">My Review
					</li>
					<li id="updateForm" onclick="showCon(this.id)">
						<span class="dot"></span><img src="../../img/myPage_image/myInfo.png">My Info
					</li>
				</ul>
			</li>
		</ul>
	</div>
</body>
</html>