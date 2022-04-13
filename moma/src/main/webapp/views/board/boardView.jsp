<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="id" value='${sessionScope.id }'></c:set>
<c:set var="mno" value='${sessionScope.mno }'></c:set>
<link rel="stylesheet" type="text/css" href="../../css/board/boardView.css">
<script type="text/javascript">
$(document).ready(function () {
 	// 로드될 때 댓글 textarea 속성 세팅
	if (${empty id}) {
		$("textarea").attr("placeholder", "댓글을 작성하려면 로그인해 주세요");
		$("textarea").attr("readonly", true);
	} else {
		$("textarea").attr("placeholder", "댓글을 입력해주세요(주제와 무관한 댓글, 악플은 삭제될 수 있습니다)");
		$("textarea").attr("readonly", false);
	}
	// 댓글 더보기 버튼 클릭
	$(".more_btn").click(function() {
		if ($(this).siblings(".more_area").css("display") == "none") {
			$(".more_area").css("display", "none");
			$(".reply_update_frm").css("display", "none");
			$(this).siblings(".more_area").css("display", "block");
		} else {
			$(".more_area").css("display", "none");
		}
	});
	
	// 댓글 수정 폼 show
	$(".update_frm_show").click(function() {
		$(this).parents(".reply_list").find(".reply_update_frm").css("display", "block");
	});
	// 댓글 수정 폼 hide
	$(".update_frm_hide").click(function() {
		$(this).parents(".reply_list").find(".reply_update_frm").css("display", "none");
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
	//댓글 삭제
	function delComment(bcno){
		var con = confirm("삭제 하시겠습니까?");
		if(con){
			location.href="boardCmtDelete.ha?bno=${board.bno}&bcno=" + bcno;
		}
	}

</script></head>
<body>
<div class="container_middle">
<!-- 상단내용 썸네일,타이틀,조회수 -->
<div class="container_top">
	<img alt="썸네일" src="../../img/boardimg/${board.image}">
	<p class="blackBox"></p>
	<h2>${board.bname }</h2>
	<h5>조회수: ${board.bviews }</h5>
</div>

<!-- 메인내용 -->
<div class="contents">
	<!--  pre: 입력한 그대로 show -->
	<pre>${board.bo_content }</pre>
		<script type="text/javascript">
				$(".contents").find("*").css({
					"font-family" : "'Apple SD Gothic Neo', 'AppleSDGothicNeo'",
					"line-height" : "1.5em"
				});
				$(".contents").find("img").css("width", "100%");
	</script>
</div>


<!-- 하단내용 -->
<div class="container_bottom">
	<div class="container_bottom_left">
		<div class="return_box">
			<button onclick="location.href='boardMain.ha'">돌아가기</button>
</div></div></div>


<!-- 댓글 시작 -->

<!-- 전체 댓글 보여주기(삭제된 댓글 제외) -->
<div class="comments">
<h4>댓글 ${cmt_cnt}</h4>
<c:if test="${empty list }">
			<div>댓글이 없습니다</div>
		</c:if>
<c:if test="${not empty list }">
	<c:forEach var="boardcmt" items="${list }">
		<div class="cmt_list">
		<!-- 회원번호, 닉네임 -->
		<div class="cmt_top">
			<div>
				<!-- 댓글의 mno와 세션의 mno가 같으면 수정/삭제 가능 추가됨 -->
					<c:if test="${boardcmt.mno == mno}">
								<span class="updatebtn_area">			
									<span class="more_area">
										<span class="more_area_txt" onclick="delComment(${boardcmt.bcno})">삭제</span>
									</span>
								</span><!-- updatebtn_area 끝 -->
					 </c:if>
			</div>
		</div>
		
		<!-- 댓내용, 날짜 -->
				<p class="cmt_date">${boardcmt.nickname}</p><!--  /*닉네임 부분 안보여서 수정 해야함*/ -->
				<p class="cmt_date">${boardcmt.bc_date }</p>
				<pre class="cmt_con">${boardcmt.bc_content }</pre>
		</div>
	</c:forEach>
	</c:if>

	<!-- 댓글작성 -->
<form action="boardCmtWrite.ha?bno=${board.bno }" method="post" class="cmt_insert_frm">
	<pre><textarea name="bc_content"></textarea></pre>
			<div class="submit_box">
				<input type="submit" class="btn" value="등록하기">
			</div>
</form>	

</div>
<div class="scroll_top"><div class="arrow"></div></div>
</div>	
</body>
</html>