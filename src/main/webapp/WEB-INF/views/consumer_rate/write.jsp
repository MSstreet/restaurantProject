<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Review</title>
<link rel="shortcut icon" type="image/png"
	href="${pageContext.request.contextPath}/resources/img/icon1.png">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"
	integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Sans:100,100i,300,300i,400,400i,600,600i,700,700i"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css">
</head>
<body>

	<!-- navbar  -->
	<div class="navbar">

		<input type="checkbox" class="checkbox" id="click" hidden>

		<!-- sidebar -->
		<div class="sidebar">
			<label for="click">
				<div class="menu-icon">
					<div class="line line-1"></div>
					<div class="line line-2"></div>
					<div class="line line-3"></div>
				</div>
			</label>

			<div class="year">
				<p>2022/01/14</p>
			</div>
		</div>
		<!-- end of sidebar -->

		<!-- navigation -->
		<nav class="navigation">
			<div class="navigation-header">
				<h1 class="navigation-heading">This is your place</h1>

				<p class="logging-in">${sessionScope.loginid } ${sessionScope.typename }님 logging in</p>
				
				<button class="logout-button">
				<a class="banner-text" href="/member/logout">Logout</a>
			</button>
			</div>

			<ul class="navigation-list">
				<li class="navigation-item"><a href="/member/main/1" class="navigation-link" >home</a>
				</li>
				<li class="navigation-item"><a href="/member/myinfo" class="navigation-link">mypage</a>
				</li>
				<li class="navigation-item"><a href="/consumer_rate/mylist" class="navigation-link">my review</a>
				</li>
				<li class="navigation-item"><a href="/reservation/myorders" class="navigation-link">reservation</a>
				</li>
				<li class="navigation-item"><a href="#search" class="navigation-link">search</a>
				</li>
				<li class="navigation-item"><a href="#places" class="navigation-link">places</a>
				</li>
				<li class="navigation-item"><a href="#contact" class="navigation-link">contact</a>
				</li>
			</ul>

			<div class="copyright">
				<p>&copy 2022 Team3 All Rights Reserved</p>
			</div>
		</nav>
		<!-- end of navigation -->
	</div>
	<!-- end of navbar  -->
<!-- write -->
	<section class="write">
	<!-- write header -->
	<header class="header-wrtie">
		<div class="brand-write">
			<div>
				<img
					src="${pageContext.request.contextPath}/resources/img/icon1.png"
					width="80">
			</div>
			<h3 class="service-heading">This is your place</h3>
		</div>
	</header>
	<!-- end of write header -->
	<div class="write-content">
		<h1 class="write-heading">방문후기 작성</h1>
			<div class="underline">
				<div class="small-underline"></div>
				<div class="big-underline"></div>
			</div>
				<form action="/consumer_rate/write" method="post" enctype="multipart/form-data">
					<p class="write-info">예약번호</p><input type="number" class="write-box" value="${rs.rev_num }" readonly><br/>
					<p class="write-info">가게명</p><input type="text" class="write-box" value="${rs.restaurant.restaurantName }" readonly><br/>
					<p class="write-info">작성자</p><input type="text" class="write-box" name="id" value="${sessionScope.loginid }" readonly><br/>
					<p class="write-info">평점</p><input type="number" min="0" max="5" class="write-box" name="rate"><br/>
					<p class="write-info">후기</p><textarea rows="5" cols="35" class="write-box" name="contents"></textarea><br/>
					<p class="write-info">사진</p><input type="file" class="write-box" name="file"><br/>
					<input type="submit" class="write-btn" value="작성">
					<input type="hidden" name="restaurant" value="${rs.restaurant.restaurant_id}">
					<input type="hidden" name="rev_num" value="${rs.rev_num}">
				</form>
	</section>
	<!-- footer -->
    <footer class="footer">
        <div class="main-part">
            <div class="footer-list-wrapper">
                <h3 class="footer-heading">This is your place</h3>
                <ul class="footer-list">
                    <li class="footer-list-item">
                        <a href="#" class="footer-list-link">isu9848@gmail.com</a>
                    </li>
                    <li class="footer-list-item">
                        <a href="#" class="footer-list-link">Seoul, Sadangdong</a>
                    </li>
                    <li class="footer-list-item">
                        <a href="#" class="footer-list-link">Tel : +82 2678 3195</a>
                    </li>
                </ul>
            </div>
            <div class="footer-list-wrapper">
                <h3 class="footer-heading">Explore</h3>
                <ul class="footer-list">
                    <li class="footer-list-item">
                        <a href="#" class="footer-list-link">Home</a>
                    </li>
                    <li class="footer-list-item">
                        <a href="#" class="footer-list-link">My Page</a>
                    </li>
                    <li class="footer-list-item">
                        <a href="#" class="footer-list-link">Reservation</a>
                    </li>
                    <li class="footer-list-item">
                        <a href="#" class="footer-list-link">Search</a>
                    </li>
                    <li class="footer-list-item">
                        <a href="#" class="footer-list-link">Place</a>
                    </li>
                    <li class="footer-list-item">
                        <a href="#" class="footer-list-link">Contact</a>
                    </li>
                </ul>
            </div>

            <div class="contact">
                <h3 class="footer-heading">Contact</h3>
                <p>Sign Up for Store inquiry</p>
                <form class="footer-form">
                    <input type="text" class="footer-input" placeholder="Your email...">
                    <button class="footer-btn">Sign Up</button>
                </form>
            </div>

        </div>
        <div class="creator-part">
            <div class="copyright-text">
                <p>Copyright &copy; 2022. This is your place. All Rights Reserved</p>
            </div>

            <div class="text-right">
                <p>Made With<i class="fas fa-heart"></i>by<span>EncoreTeam3</span></p>
            </div>
        </div>
    </footer>
    <!-- end of footer -->
</body>
</html>