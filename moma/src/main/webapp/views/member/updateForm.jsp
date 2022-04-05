<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><%@ include file="../sessionChk.jsp" %>
<meta charset="UTF-8"><title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">

/* 별명 중복체크 */
function chkNickname(){
	if(!frm.nickname.value) {
		$('#err_nickname').html("별명을 입력하세요");
		frm.nickname.focus();
		return false;
	}
	$.post("confirmNickname.bb", "nickname="+frm.nickname.value, function(data){
	$('#err_nickname').html(data);
	});
}

/* 비밀번호 형식 체크 (4글자이상) -> 영문섞어서로 바꿔보기? */
function chkPass(){
	var pw = $("#password").val();
	if(pw.length<4) {
		$('#err_pass').html("비밀번호를 4자리이상 입력해주세요");
		frm.password.focus();
		frm.password.value="";
		return false;
	} else {
		$('#err_pass').html("");
	}
}

/* 비밀번호 확인 일치여부 체크 */
function chkPass2() {
	if (!frm.password2.value){
		$('#err_pass2').html("비밀번호 확인란을 입력하세요");
		return false;
	} if(frm.password2.value!=frm.password.value){
		$('#err_pass2').html("비밀번호가 일치하지 않습니다");
		frm.password2.focus();
		frm.password2.value="";
		return false;
	} else {
		$('#err_pass2').html("");
	}
}

/* 이메일 유효성 검사 */
function chkEmail(){
	var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	if(!frm.email.value) {
		$('#err_email').html("이메일을 입력하세요");
		frm.email.focus();
		return false; 
	} if(!reg_email.test(frm.email.value)){
			$('#err_email').html("올바른 이메일 형식이 아닙니다");
			frm.email.focus();
			return false;
	}else{
		$('#err_email').html("");
	}
}

/* 연락처 유효성 검사 */
function chkPhone(){
	var reg_phone = /^([0-9]){3}[-]([0-9]){4}[-]([0-9]){4}$/;
	if(!frm.phone.value) {
		$('#err_phone').html("연락처를 입력하세요");
		frm.phone.focus();
		return false;
	} if(!reg_phone.test(frm.phone.value)){
		$('#err_phone').html("올바른 연락처 형식이 아닙니다");
		frm.phone.focus();
		return false;
	} else {
		$('#err_phone').html("");
	}
}

/* 회원탈퇴 */
function del() {
	var con = confirm("탈퇴 하시겠습니까?");
	if(con) location.href="delete.bb";
	else alert("탈퇴가 취소 되었습니다.");
}



</script></head>
<body>
<div class="container">
	<h1 class="title">회원정보 수정</h1>

	<form action="updateAction.bb" method="post" name="frm" onsubmit="return chk()">
		<!-- 엔터키 전송 막기 -->
		<div style="display:none">
			<input type="submit" onclick="return false"/>
			<input type="text"/>
		</div>
			
			<!-- 아이디 -->
			<div class="check">
				<input type="text" name="id" readonly="readonly" value="${member.id }">
			</div>
			
			<!-- 비밀번호 -->
			<div class="check">
				<input type="password" name="password" placeholder="비밀번호" required="required" onChange="chkPass()">
				<div class="chk-msg" id="err_pass"></div>
			</div>
			<div class="check">
				<input type="password" name="password2" placeholder="비밀번호 확인" required="required" onChange="chkPass2()">
				<div class="chk-msg" id="err_pass2"></div>
			</div>
			
			<!-- 이메일 -->
			<div class="check">
				<input type="text" name="email" required="required" value="${member.email }" onChange="chkEmail()">
				<div class="chk-msg" id="err_email"></div>
			</div>
			
			<!-- 이름 -->
			<input type="text" name="mname" value="${member.mname }" placeholder="${member.mname }" required="required">
			
			<!-- 별명 -->
			<div class="check">
				<input type="text" name="nickname" value="${member.nickname }" placeholder="${member.nickname }" onChange="chkNickname()" required="required">
				<!-- <input type="hidden" name="checked_nick" value=""> -->
				<!-- ✔✔✔checkednick은뭐지? 왜보내지?, 그리고 required해야하는거 아닌가 null로 보낼수있으니?  -->
				<div class="chk-msg" id="err_nickname"></div>
			</div>
			
			<!-- 연락처 -->
			<div class="check">
				<input type="tel" name="phone" value="${member.phone }" placeholder="${member.phone }" required="required" onChange="chkPhone()">
				<div class="chk-msg" id="err_phone"></div>
			</div>
			
			<!-- 광고수신 -->
			<div class="check">
			<!-- ✖✖ 수정해야함! 선택했던 값을 보여줘함.-->
			sms 광고수신<label><input type="radio" name="sms_check" value="y" checked="checked">동의</label><label><input type="radio" name="sms_check" value="n">거부</label><p>
			</div>
			<div class="check">
			email 광고수신<label><input type="radio" name="email_check" value="y" checked="checked">동의</label><label><input type="radio" name="email_check" value="n">거부</label><p>
    	 	</div>

			<!-- button -->
			<input type="submit" class="btn submit-btn" value="수정하기">
			<input type="submit" id="del-btn" value="탈퇴하기" onclick="del()">
	</form>
</div>
</body>
</html>