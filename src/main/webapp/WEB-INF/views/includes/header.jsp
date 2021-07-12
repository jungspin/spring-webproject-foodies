<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FOOODIES</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
        integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="/css/home.css">
    <link rel="stylesheet" type="text/css" href="./css/slick.css">
    <link rel="stylesheet" type="text/css" href="/css/slick-theme.css">
    
</head>
<body>
 <nav class="main-navi nav-down">
        <div class="logo">
            <a href="/">
                <i class="fas fa-hamburger"></i>FOODIES
            </a>


        </div>
        <form class="">
            <div class="search">
                <input type="text" class="search-input" placeholder="지역 및 식당, 음식">
                <button class="search-button"><i class="fas fa-search"></i></button>
            </div>
        </form>

        <div class="menu" id="host">
      <div class="item">게시판</div>  
        	<sec:authorize access="isAuthenticated()">
        	<div class="item"><a href="/member/getInfo">마이페이지</a></div>
        	<div class="item"><a href="/logout">로그아웃</a></div>
        	</sec:authorize>
        	<sec:authorize access="isAnonymous()">
        	<div class="item"><a href="/login">로그인</a></div>
            <div class="item"><a href="/register">회원가입</a></div>
            </sec:authorize>

        </div>
    </nav>

    <div class="main-navi2">
        <div class="logo">
            <a href="/">
                <i class="fas fa-hamburger"></i>FOODIES
            </a>


        </div>
        <form class="">
            <div class="search2">
                <input type="text" class="search-input" placeholder="지역 및 식당, 음식">
                <button class="search-button"><i class="fas fa-search"></i></button>
            </div>
        </form>

        <div class="menu" id="host">
         	<sec:authorize access="isAuthenticated()">
        	<div class="item"><a href="/member/getInfo">마이페이지</a></div>
        	<div class="item"><a href="/logout">로그아웃</a></div>
        	</sec:authorize>
        	<sec:authorize access="isAnonymous()">
        	<div class="item"><a href="/login">로그인</a></div>
            <div class="item"><a href="/register">회원가입</a></div>
            </sec:authorize>
        
      
            <div class="item"><a href = "list">게시판</a></div>

        </div>
    </div>

    <div class="container-fluid">
        <div class="explain">
            <h2>FOODIES</h2><br>
            <h4>먹는 즐거움의 시작!</h4>
        </div>
    </div>
</body>
</html>