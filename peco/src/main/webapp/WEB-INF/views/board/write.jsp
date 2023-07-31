<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.104.2">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>반려동물 커뮤니티 사이트</title>

    <!-- Bootstrap core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="/resources/assets/css/fontawesome.css">
    <link rel="stylesheet" href="/resources/assets/css/templatemo-cyborg-gaming.css">
    <link rel="stylesheet" href="/resources/assets/css/owl.css">
    <link rel="stylesheet" href="/resources/assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>




<style>
    body{
      background-color: white;
    }
  
    div >.page-content{
      background-color: rgb(255, 187, 0);
    }
  
    .top-streamers{
        margin-top: 50px;
    
      overflow: auto;
  
      background-color: bisque;
  
    }
  
    .featured-games{
      background-color: bisque;
    }
  
    .live-stream{
      background-color: bisque;
    }
    
    footer p {
          color: black;
    }
    footer p > a {
          color: black;
    }
    
    .category {
        margin-bottom: 10px;
    }
  
    /* 카테고리 스타일 */
    .category {
        position: relative;
        /* 기본 색상 설정 */
        color: #ffffff;
    }

    /* 카테고리 뒤에 * 추가 */
    .category::after {
        content: '*';
        color: red;
        margin-left: 4px; /* *와 글자 사이의 간격 조절을 위해 왼쪽 여백 추가 */
    }


     /* 일상게시판 박스 스타일 */
    .board-box {
        width: 60px;
        height: 30px;
        font-weight: bold;
        background-color: rgba(219, 207, 207, 0.822);
        border-radius: 30px;
        display: inline-flex;
        justify-content: center;
        align-items: center;
        cursor: pointer;
        margin-right: 10px; /* 가로 간격 조절을 위해 오른쪽 여백 추가 */
    }

	/* 선택된 상태의 일상게시판 박스 스타일 */
	.board-box.checked {
	   background-color: #fce93e;
	   color: #000000;
	 }
	/* 라디오 버튼의 동그란 체크박스 제거 */
	input[type="radio"] {
	appearance: none;
	-webkit-appearance: none;
	-moz-appearance: none;
	-ms-appearance: none;
	}
	
	/* 라디오 버튼의 사용자 정의 스타일 적용 */
	input[type="radio"] + label {
	display: inline-flex;
	align-items: center;
	cursor: pointer;
	width: 60px;
	height: 30px;
	font-weight: bold;
	background-color: rgba(219, 207, 207, 0.822);
	border-radius: 30px;
	justify-content: center;
	margin-right: 10px;
	}
	
	input[type="radio"]:checked + label {
	background-color: #fce93e;
	color: #000000;
	}
        
        
        
    .title-bar{
        margin: 0;
        margin-bottom: 10px;
        padding: 5px;
        border: none;
        outline: none;
        border-radius: 15px;
        width: 100%;
        height: 40px;
        font-size: 15px;
    }

    /* 고정된 크기의 textarea 스타일 */
    .content-bar {
        resize: none; /* 사용자가 크기를 조정할 수 없도록 설정 */
        margin: 0;
        margin-bottom: 10px;
        padding: 5px;
        border: none;
        outline: none;
        border-radius: 15px;
        width: 100%;
        height: 150px;
        
    }

    /* 선택된 상태일 때의 테두리 스타일 */
    .title-bar.selected, .content-bar.selected {
        border: 2px solid;
        border-color: #000; /* 검정색으로 변경 */
    }


</style>

<script>
function applySelectedStyle(element) {
    const boxes = document.querySelectorAll('.board-box');
    boxes.forEach(item => item.classList.remove('checked'));
    element.parentElement.classList.add('checked');
}
</script>

</head>

<body>

  <!-- ***** Preloader Start ***** -->
  <div id="js-preloader" class="js-preloader">
    <div class="preloader-inner">
      <span class="dot"></span>
      <div class="dots">
        <span></span>
        <span></span>
        <span></span>
      </div>
    </div>
  </div>
  <!-- ***** Preloader End ***** -->

  <!-- ***** Header Area Start ***** -->
  <header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
                    <a href="index.html" class="logo">
                        <img src="assets/images/logo.png" alt="">
                    </a>
                    <!-- ***** Logo End ***** -->
                    <!-- ***** Search End ***** -->
                    <div class="search-input">
                      <form id="search" action="#">
                        <input type="text" placeholder="Type Something" id='searchText' name="searchKeyword" onkeypress="handle" />
                        <i class="fa fa-search"></i>
                      </form>
                    </div>
                    <!-- ***** Search End ***** -->
                    <!-- ***** Menu Start ***** -->
                    <ul class="nav">
                        <li><a href="index.html">Home</a></li>
                        <li><a href="browse.html" class="active">Browse</a></li>
                        <li><a href="details.html">Details</a></li>
                        <li><a href="streams.html">Streams</a></li>
                        <li><a href="profile.html">Profile <img src="assets/images/profile-header.jpg" alt=""></a></li>
                    </ul>   
                    <a class='menu-trigger'>
                        <span>Menu</span>
                    </a>
                    <!-- ***** Menu End ***** -->
                </nav>
            </div>
        </div>
    </div>
  </header>
  <!-- ***** Header Area End ***** -->

  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="page-content">
	
	<form method="post" name="writeForm" action="/peco/board/write">
			
		  <!-- 검색조건 유지하기 위해 갖고가야하는 값들 -->
		  <input type="text" name="pageNo" value="${param.pageNo }">
		  <input type="text" name="searchField" value="${param.searchField }">
		  <input type="text" name="searchWord" value="${param.searchWord }">
		  <input type="text" name="m_id" value="${sessionScope.mid }">
		  <input type="text" name="writer" value="${sessionScope.nickName }">
		  
		  <!-- 페이징 처리 하기 위해 있어야함 -->
		  <input type="hidden" id="page" name="page" value="1">
		  
		  
		  
        <h4 class="category">카테고리</h4>

        <!-- 일상게시판 박스 -->
        <label class="board-box">
            <input type="radio" name="category" value="free" onclick="applySelectedStyle(this)">
            	일상
        </label>
        
        <!-- 힐링게시판 박스 -->
        <label class="board-box">
            <input type="radio" name="category" value="healing" onclick="applySelectedStyle(this)">
            	힐링
        </label>

        <br>
        <br>
        <br>
        
        <h4 class="category">게시글 작성</h4>
        <input type="text" class="title-bar" name="title" id="title" placeholder=" 제목을 입력하세요" onfocus="applySelectedStyle(this)" onblur="removeSelectedStyle(this)" required>

        <textarea class="content-bar" name="content" id="content" placeholder=" 내용을 입력하세요" onfocus="applySelectedStyle(this)" onblur="removeSelectedStyle(this)" required></textarea>

        <div style="text-align: center;">
            <button type="submit" class="btn btn-danger btn-lg">글 작성</button>
        </div>
	</form>





























        </div>
      </div>
    </div>
  </div>
  
  <footer>
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <p>Copyright © 2036 <a href="#">Cyborg Gaming</a> Company. All rights reserved. 
          <br>Design: <a href="https://templatemo.com" target="_blank" title="free CSS templates">TemplateMo</a>  Distributed By <a href="https://themewagon.com" target="_blank" >ThemeWagon</a></p>
        </div>
      </div>
    </div>
  </footer>


  <!-- Scripts -->
  <!-- Bootstrap core JavaScript -->
  <script src="/resources/vendor/jquery/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.0/js/bootstrap.min.js"></script>

  <script src="/resources/assets/js/isotope.min.js"></script>
  <script src="/resources/assets/js/owl-carousel.js"></script>
  <script src="/resources/assets/js/tabs.js"></script>
  <script src="/resources/assets/js/popup.js"></script>
  <script src="/resources/assets/js/custom.js"></script>


  </body>

</html>