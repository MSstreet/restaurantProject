<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>${o.num }번게시물</title>
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
	function del(num) {
		var pwd = prompt("글 비밀번호를 입력하세요.");
		if (pwd == '${o.pwd}') {
			location.href = "/ownerboard/del/${o.num}";
			alert('글이 삭제되었습니다.')
		} else {
			alert('글 비밀번호가 일치하지 않습니다.')
		}
	}
	function edit(num) {
		var pwd = prompt("글 비밀번호를 입력하세요.");
		if (pwd == '${o.pwd}') {
			alert('글이 수정되었습니다.')
			location.href = "/ownerboard/detail/${o.num }";
		} else {
			alert('글 비밀번호가 일치하지 않습니다.')
			location.href = "/ownerboard/detail/${o.num }";
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
	<!-- ownerboard detail  -->
	<section class="obdetail">
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
		<div class="obdetail-content">
			<h1 class="login-heading">Maganer Board</h1>
			<div class="underline">
				<div class="small-underline"></div>
				<div class="big-underline"></div>
			</div>
			<form action="/ownerboard/edit/${o.num }"
				class="obdetail-content-inside" method="post" var="o"
				enctype="multipart/form-data">
				<table class="table obwrite-table">
					<tbody>
						<tr class="myorders-list-th">
							<th scope="col">No.</th>
							<td><input type="text" name="num" class="mypage-info-detail"
								value="${o.num }" readonly></td>
						</tr>
						<tr>
							<th scope="col">writer</th>
							<td><input type="text" class="mypage-info-detail"
								value="${sessionScope.loginid }" readonly></td>
						</tr>
						<tr>
							<th scope="col">date</th>
							<td><fmt:formatDate pattern="yyyy/MM/dd HH:MM:SS"
									value="${o.time }" /></td>
						</tr>
						<tr>
							<th scope="col">title</th>
							<td><input type="text" name="title"
								class="mypage-info-detail" value="${o.title }"></td>
						</tr>
						<tr>
							<th scope="col">image</th>
							<td><img src="/ownerboard/read_img/${o.img_path }"
								style="width: 300px; height: 300px"></td>
						</tr>
						<tr>
							<th scope="col">content</th>
							<td><input type="text" class="mypage-info-detail"
								name="content" value="${o.content }"
								style="width: 300px; height: 300px"></td>
						</tr>
					</tbody>
				</table>
				<div class="obdetail-content-btn">
					<input type="submit" value="edit" class="ownerboard-btn"
						onclick="edit()"> <input type="button" value="delete"
						class="ownerboard-btn" onclick="del()"> <input
						type="button" value="list" class="ownerboard-btn"
						onClick="location.href='/ownerboard/list'">
				</div>
			</form>
		</div>
	</section>
	<!-- end of ownerboard detail -->
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