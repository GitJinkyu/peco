<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
    background-color: rgba(250, 149, 16, 0.979);
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
  


</style>
<script>
window.addEventListener('load', () => {


  
});

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
	<%@include file = "../common/header.jsp" %>
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
		  <input type="text" name="bno" id="bno" value="${board.bno }">
		  <!-- 페이징 처리 하기 위해 있어야함 -->
		  <input type="hidden" id="page" name="page" value="1">
		  <!-- ***** Details Start ***** -->
		  <div class="game-details">
		    <div class="col-lg-12">
		      <div class="col-lg-12">
		        <div class="content">
		          <div class="row justify-content-center">
		            <div class="col-lg-6">
		              <div class="left-info">
		                <div class="left">
		                  <input type="text" name="title" placeholder="제목 작성할 부분" value="${board.title }">
		                  <span>${sessionScope.nickName }</span>
		                </div>
		              </div>
		            </div>
		            <div class="col-lg-6">
		              <div class="right-info">
		              </div>
		            </div>
		            <div class="content col-lg-12" style="background-color: white">
		              <textarea name="content" placeholder="내용 작성할 부분">${board.content }</textarea>
		            </div>
		            <div class="col-lg-12">
		              <button type="submit" class="btn btn-primary btn-lg">글쓰기</button>
		              <button type="reset" class="btn btn-secondary btn-lg">초기화</button>
		            </div>
		            <div class="col-lg-12">
		              <div class="main-border-button">
		                <a href="#">사진 업로드</a>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
		  <!-- ***** Details End ***** -->
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