<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/views/sessionChk.jsp"%>
<style type="text/css">@import url("/moma/css/myPage/common_my.css");</style>
<script type="text/javascript">
	
</script></head><body>

	 <div class="container_middle">
		<!-- myMainMenu -->
		<jsp:include page="myMainMenu.jsp"></jsp:include>
		
 	 <form action="myReviewUpdateAction.bb?rvno=${review.rvno}" method="post">
  
            <h4 class="sub_title">리뷰 수정</h4>
            
            <div class="content">
				<ul>
					<li class=likes>
						<a href="/moma/views/content/contentView.do?cno=${review.cno}" class="cursor">
							<img src ="/img/poster/${review.cno}.jpg" style =" no-repeat center; background-size: cover;">
							<div class="txt_likes">
								 ${content.cname }
							</div>
						</a>
					</li>
				</ul>
			</div>
            
            <textarea name="rv_content" placeholder=${review.rv_content } required onclick="sessionChk()"></textarea>
            <p class="detail_txt pd_bottom">별점을 선택해 주세요.</p>
            <!-- 별점 등록 -->
            <div class="star_rate">
               <input type="range" name="star_rate" min="0" max="10" step="1" value="0" required="required">  <!-- oninput="amount.value=rangeInput.value" -->
               <span class="text" id="input_span">0</span>
            </div>
            <div class="submit_box">
               <input type="submit" class="btn" value="수정하기">
               <input type="button" class="btn btn_stroke reset" onclick="history.go(-1)" value="취소">
            </div>
  		</form>
	</div>

</body>
</html>