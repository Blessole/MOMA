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

</script>
</head>
<body>
<!-- 검색바 -->
<div class="search_container">
	<input type="text" name="srch" placeholder="검색어를 입력해주세요">
	<img class="search" id="search" alt="검색" src="/moma/img/icon/search.png" onclick="location.href='searchAction.so'" width="50px"></img>
</div>
<div class="container_wide">
	<section class="content_main">
		<!-- 영화 -->
		<ul class="content_tab">
			<li class="title" id="tab1" onclick="location.href='movieMain.so'">영화</li>
			<div class="content_list">
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