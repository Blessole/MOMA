<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../sessionChk.jsp" %>
<link rel="stylesheet" href="../../css/board/bdWrite.css">
<link rel="stylesheet" href="../../css/summernote-lite.css">
<script src="../../js/summernote-lite.js"></script>
<script src="../../js/lang/summernote-ko-KR.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	// content 입력 폼
	$('#summernote').summernote({
		height : 400, // 에디터 높이
		minHeight : 400, // 최소 높이
		maxHeight : null, // 최대 높이
		focus : true, // 에디터 로딩후 포커스를 맞출지 여부
		lang : "ko-KR", // 한글 설정
		placeholder : '최대 2048자까지 쓸 수 있습니다' //placeholder 설정
	});
	
	// input type file 파일명 변경 설정
	$('#f1').on('change', function() {
		var fileName = $(this).val();
		var realFileName = fileName.split('\\');
		$('.file_label').text(realFileName[2]);
	});
	
	// modal open
	$('.btn_modal').on('click', function() {
		$('.modal').show();
		$('html body').css('overflow', 'hidden');
		$('.top_edit').text('편집');
		$('.check').css('display', 'none');
		$('input[name=bs_no]').siblings("label").removeClass('active');
	});

	// modal close
	$('.close, .dim_box').on('click', function() {
		$('.modal').hide();
		$('html body').css('overflow', 'auto');
	});
	
	// 글작성일 때 required 확인
	function insertChk() {
		if ($("input[name=title]").val() == "" || $("input[name=title]").val() == null) {
			alert("제목 입력란을 작성하세요");
			return false;
		} else if ($("input[type=file]").val() == "" || $("input[type=file]").val() == null) {
			alert("썸네일 이미지를 선택하세요");
			return false;
		} else 	if ($(".note-editable").text() == "" || $(".note-editable").text() == null) {
			alert("내용 입력란을 작성하세요");
			return false;
		}
	}
</script>

</head>

<body>
<div class="container_middle">
<h1 class="title">게시물 작성</h1>

<form method="post"	enctype="multipart/form-data">
	<!-- 제목 -->
	<input type="text" name="title" placeholder="제목">
	
	<div class="btn_area">
				<button type="submit" class="btn btn_small" onclick="return insertChk()"
					formaction="boardWriteResult.do?action=insert">글작성</button>

	<!-- 상단 버튼 영역 -->f
	<div class="column">
		<label for="f1" class="btn_stroke file_label">썸네일 이미지 업로드</label>
		<input type="file" id="f1" name="thumbnail">
	</div>

	<!-- 내용 작성 -->
	<textarea id="summernote" name="content" class="clear"></textarea>
	
		<a class="btn btn_stroke btn_small btn_right" href="boardMain.do">취소</a>
	</div>
</form>
</div>

</div>
</div>
</body>
</html>