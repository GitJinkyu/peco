<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
                    <a href="/peco/board/main" class="logo">
                        <img src="/resources/assets/images/logo.png" alt="">
                    </a>
                    <!-- ***** Logo End ***** -->
                    
                    <!-- ***** Menu Start ***** -->
                    <ul class="nav">
                        <li><a href="index.html">펜션</a></li>
                        <li><a href="browse.html">병원</a></li>
                        <li><a href="details.html">커뮤니티</a></li>
                        <li><a href="streams.html" class="active">업소 등록</a></li>
                        <li><a href="profile.html">Profile <img src="/resources/assets/images/profile-header.jpg" alt=""></a></li>
                    </ul>   
                    <a class='menu-trigger'>
                        <span>Menu</span>
                    </a>
                    <!-- ***** Menu End ***** -->
                </nav>
            </div>
            <div class="col-lg-12">
              <nav class="main-nav">
                    <ul class="nav">
                        <li><a href="/peco/board/free">일상게시판</a></li>
						<li><a href="/peco/board/healing">힐링게시판</a></li>
                        <li><a href="browse.html">어쩌구게시판</a></li>
                        <li><a href="browse.html"></a></li>
                	</ul>
              </nav>
            </div>
        </div>
    </div>
  </header>
  <script type="text/javascript">

// 메세지 처리
/*
   		부트스트랩을 이용한 모달창 띄우기
 		
 		1. css,js 링크 추가하기
 		2. 모달요소 복사
 			타이틀,메세지 수정
 		3. 모달창 열기(message.jsp가 호출되자마자 버튼 뜨게)
 			자바스크립트를 이용해서 모달 객체 생성 후 show()메서드 호출해서 바로 보여줌
 		4. 모달창 닫기 (닫기 버튼 and 배경화면 아무곳 누르기)
 			자바스크립트를 이용해서 모달차을 닫을 경우
 			닫는 이벤트 발생(hidden.bs.modal)->
			그후 뒤로가기(history(-1)) 추가
 */
 

let msg = '${msg}';

window.onload = function(){
	if(msg != ''){
		document.querySelector(".modal-body").innerHTML = msg;
		
		let myModal = new bootstrap.Modal('#myModal', {keyboard: false});
		myModal.show();
	
	}
}
</script>

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	       
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-primary">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>