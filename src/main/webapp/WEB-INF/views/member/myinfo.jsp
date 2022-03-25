<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MyPage</title>
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

<script type="text/javascript">
window.onload = () =>{//페이지가 시작되자마자 호출되는 함수
	if(${m.type}==1){
		document.getElementById("t1").checked = true;
	}else if(${m.type}==2){
		document.getElementById("t2").checked = true;
	}
}
</script>
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

				<p class="logging-in">${sessionScope.loginid }
					${sessionScope.typename }님 logging in</p>

				<button class="logout-button">
					<a class="banner-text" href="/member/logout">Logout</a>
				</button>
			</div>

			<ul class="navigation-list">
				<li class="navigation-item"><a href="#" class="navigation-link">home</a>
				</li>
				<li class="navigation-item"><a href="/member/myinfo"
					class="navigation-link">mypage</a></li>
				<li class="navigation-item"><a href="/consumer_rate/mylist"
					class="navigation-link">my review</a></li>
				<li class="navigation-item"><a href="/reservation/myorders"
					class="navigation-link">reservation</a></li>
				<li class="navigation-item"><a href="#search"
					class="navigation-link">search</a></li>
				<li class="navigation-item"><a href="#places"
					class="navigation-link">places</a></li>
				<li class="navigation-item"><a href="#contact"
					class="navigation-link">contact</a></li>
			</ul>

			<div class="copyright">
				<p>&copy 2022 Team3 All Rights Reserved</p>
			</div>
		</nav>
		<!-- end of navigation -->
	</div>
	<!-- end of navbar  -->

	<!-- mylist -->
	<section class="mypage">
		<!-- mylist header -->
		<header class="header-mypage">
			<div class="brand-login">
				<div>
					<img
						src="${pageContext.request.contextPath}/resources/img/icon1.png"
						width="80">
				</div>
				<h3 class="service-heading">This is your place</h3>
			</div>
		</header>
		<!-- end of mylist header -->
		<div class="mypage-wrapper">
			<h1 class="login-heading">${sessionScope.loginid }${sessionScope.typename }님
				Mypage</h1>
<!-- 			<div class="underline"> -->
				<div class="mypage-underline"></div>
<!-- 			</div> -->

			<form action="/member/edit" method="post">
				<div class="mypage-info">

					<div class="mypage-info-wrapper">
						ID<input type="text" class="mypage-info-detail" name="id"
							value="${m.id }" readonly>
					</div>
					<div class="mypage-info-wrapper">
						PWD<input type="password" class="mypage-info-detail" name="pwd"
							value="${m.pwd }">
					</div>
					<div class="mypage-info-wrapper">
						NAME<input type="text" class="mypage-info-detail" name="name"
							value="${m.name }">
					</div>
					<div class="mypage-info-wrapper">
						EMAIL<input type="email" class="mypage-info-detail" name="email"
							value="${m.email }">
					</div>
					<div class="mypage-info-wrapper">
						TEL<input type="tel" class="mypage-info-detail" name="tel"
							value="${m.tel }">
					</div>
					<div class="mypage-info-wrapper">
						TYPE<input type="radio" class="mypage-btn-radio" name="type" value="1"
							id="t1" onclick='return false;'>user <input type="radio"
							class="mypage-btn-radio" name="type" value="2" id="t2"
							onclick='return false;'>manager
					</div>
				</div>
				<div class="btn-wrapper">
					<input type="submit" class="mypage-btn-table" value="edit">
			</form>
			<input type="button" onclick="location.href='/member/logout'"
				class="mypage-btn-table" value="logout"> <input
				type="button" onclick="location.href='/member/out'"
				class="mypage-btn-table" value="out">
		</div>
		</div>
	</section>
	<!-- footer -->
	<footer class="footer">
		<div class="main-part">
			<div class="footer-list-wrapper">
				<h3 class="footer-heading">This is your place</h3>
				<ul class="footer-list">
					<li class="footer-list-item"><a href="#"
						class="footer-list-link">isu9848@gmail.com</a></li>
					<li class="footer-list-item"><a href="#"
						class="footer-list-link">Seoul, Sadangdong</a></li>
					<li class="footer-list-item"><a href="#"
						class="footer-list-link">Tel : +82 2678 3195</a></li>
				</ul>
			</div>
			<div class="footer-list-wrapper">
				<h3 class="footer-heading">Explore</h3>
				<ul class="footer-list">
					<li class="footer-list-item"><a href="#"
						class="footer-list-link">Home</a></li>
					<li class="footer-list-item"><a href="#"
						class="footer-list-link">My Page</a></li>
					<li class="footer-list-item"><a href="#"
						class="footer-list-link">Reservation</a></li>
					<li class="footer-list-item"><a href="#"
						class="footer-list-link">Search</a></li>
					<li class="footer-list-item"><a href="#"
						class="footer-list-link">Place</a></li>
					<li class="footer-list-item"><a href="#"
						class="footer-list-link">Contact</a></li>
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
				<p>Copyright &copy; 2022. This is your place. All Rights
					Reserved</p>
			</div>

			<div class="text-right">
				<p>
					Made With<i class="fas fa-heart"></i>by<span>EncoreTeam3</span>
				</p>
			</div>
		</div>
	</footer>
	<!-- end of footer -->
</body>
</html>