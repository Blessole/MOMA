<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%-- <%@ include file="../sessionChk.jsp" %> --%>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <style type="text/css">
	@import url("../../css/content/reserveForm.css");
</style> -->
<script type="text/javascript">
	$(function(){
		
	});
</script>
</head><body>
	<div class="container">
		<p class="title">예매하기</p>
		<form action="reserveResult.so?cno=${content.cno }&mno=${member.mno}" 
			method="post" name="frm" onsubmit="return submitNullChk()"></form>
			<div class="section">
				<p class="reserve_title">${content.cname }</p>
				<p class="option_title">
					<div class="reserve_date">예매일
						<input type="text" class="column" name="rsdate" placeholder="예매일 *" onfocus="(this.type='date')" required>
					</div><p>
					<div class="reserve_time">
						예매시간 선택<br>
						<input type="radio" name="rstime" value="10:00" checked="checked" id="t1"><label for="t1">10:00</label>
						<input type="radio" name="rstime" value="12:00" id="t2"><label for="t2">12:00</label>
						<input type="radio" name="rstime" value="14:00" id="t3"><label for="t3">14:00</label>
						<input type="radio" name="rstime" value="16:00" id="t4"><label for="t4">16:00</label>
						<input type="radio" name="rstime" value="18:00" id="t5"><label for="t5">18:00</label></td></tr>
					</div><p>
					<div class="reserve_cinema">
						영화관 선택
						<select name="cinema">
							<option value="CGV">CGV<option value="롯데시네마">롯데시네마<option value="메가박스">메가박스
						</select>
					</div>
					<div class="reserve_num">
						<p>수량</p>
						<div class="line_box minus">
							<div class="line"></div>
						</div>
						<span>0</span>
						<div class="line_box plus">
							<div class="line"><div class="line vertical"></div></div>
							<input type="hidden" name="cnt" class="input_hidden" value="0">
							<p class="fee_number" id = "fee1">0원</p>
						</div>
					</div>
					<div class="reserve_price">
						<p>가격</p>
						${reservation.price }*${rsnum}
					</div>
				</div>
			</div>
			<div class="section">
				<p class="option_title">예매자 정보</p>
				<table class="member_info">
					<tr><th>예매자</th><td>${member.mname }</td></tr>
					<tr><th>연락처</th><td>${member.phone }</td></tr>
					<tr><th>이메일</th><td>${member.email }</td></tr>
					<tr><th>예매내용</th><td>${content.cname }, 총 <span class="sum_count">0</span>매, <span class="total_price">0원</span></td></tr>
				</table>
			</div>
			<div class="section">
				<p class="option_title">결제 방식 선택</p>
				<div class="radio_box">
					<div>					
						<input type="radio" name="pay" id="p1" checked="checked">
						<label for="p1">카드결제</label>
					</div>
					<div>
						<input type="radio" name="pay" id="p2">
						<label for="p2">카카오페이</label>
					</div>
					<div>
						<input type="radio" name="pay" id="p3">
						<label for="p3">네이버페이</label>
					</div>
					<div>
						<input type="radio" name="pay" id="p4">
						<label for="p4">토스</label>
					</div>
					<div>
						<input type="radio" name="pay" id="p5">
						<label for="p5">페이팔(PayPal) 결제</label>
					</div>
				</div>
			</div>
</body>
</html>