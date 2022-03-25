<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Edit Menu</title>
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

				<p class="logging-in">${sessionScope.loginid }
					${sessionScope.typename }님 logging in</p>

				<button class="logout-button">
					<a class="banner-text" href="/member/logout">Logout</a>
				</button>
			</div>

			<ul class="navigation-list">
				<li class="navigation-item"><a href="/member/main/2"
					class="navigation-link">home</a></li>
				<li class="navigation-item"><a href="/member/myinfo"
					class="navigation-link">mypage</a></li>
				<li class="navigation-item"><a href="/restaurant/write"
					class="navigation-link">add place</a></li>
				<li class="navigation-item"><a href="/ownerboard/list"
					class="navigation-link">manager board</a></li>
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

	<!-- ownerboard -->
	<section class="editmenu">
		<!-- header -->
		<header class="header-login">
			<div class="brand-login">
				<div>
					<img
						src="${pageContext.request.contextPath}/resources/img/icon1.png"
						width="80">
				</div>
				<h3 class="service-heading">This is your place</h3>
			</div>
		</header>
		<!-- end of header -->
		<div class="obwrite-wrapper">
			<h1 class="login-heading">edit menu</h1>
			<div class="obwrite-content">
				<div class="underline">
					<div class="small-underline"></div>
					<div class="big-underline"></div>
				</div>
				<form action="/menu/edit" class="obdetail-content-inside"
					method="post" enctype="multipart/form-data">
					<table class="table obwrite-table">
						<tbody>
							<tr class="myorders-list-th">
								<th scope="col">식당이름</th>
								<td scope="row"><input type="text" class="mypage-info-detail" name="restaurantname"
									value="${m.resid.restaurantName }" readonly></td>
							</tr>
							<tr>
								<th scope="col">메뉴이름</th>
								<td scope="row"><input type="text" class="mypage-info-detail" name="mname" value="${m.mname}"></td>
							</tr>
							<tr>
								<th scope="col">가격</th>
								<td scope="row"><input type="number" class="mypage-info-detail" name="price" value="${m.price}">원</td>
							</tr>
							<tr>
								<th scope="col">메뉴 상세정보</th>
								<td scope="row"><textarea rows="10" class="mypage-info-detail" cols="30" name="m_summary"> ${m.m_summary} </textarea>
								</td>
							</tr>
							<tr>
								<th scope="col">메뉴 이미지</th>
								<td scope="row"><img src="/menu/readimg/${m.img_path }" width="200"
									height="200"></td>
							</tr>
							</tbody>
					</table>
							<input type="submit" class="ownerboard-btn" value="수정완료"></td>
					<input type="hidden" name="resid" value="${m.resid.restaurant_id }">
				</form>
				</div>
				</div>
				</section>
				<!-- footer -->
				<footer class="footer">
					<div class="main-part">
						<div class="footer-list-wrapper">
							<a name=contact>
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
								<li class="footer-list-item"><a href="/member/main/2"
									class="footer-list-link">Home</a></li>
								<li class="footer-list-item"><a href="/member/myinfo"
									class="footer-list-link">My Page</a></li>
								<li class="footer-list-item"><a href="/restaurant/write"
									class="footer-list-link">add place</a></li>
								<li class="footer-list-item"><a href="/ownerboard/list"
									class="footer-list-link">manager board</a></li>
								<li class="footer-list-item"><a href="#contact"
									class="footer-list-link">Contact</a></li>
							</ul>
						</div>

						<div class="contact">
							<h3 class="footer-heading">Contact</h3>
							<p>Sign Up for Store inquiry</p>
							<form class="footer-form">
								<input type="text" class="footer-input"
									placeholder="Your email...">
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