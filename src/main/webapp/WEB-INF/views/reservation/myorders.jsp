<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>My Reservation</title>
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


function rate(rev_num, restaurant_id) {
	location.href = "/consumer_rate/write/" + rev_num;
}


function edit(rev_num){
	location.href = "/reservation/edit/" + rev_num;	
}


function del(rev_num){
	location.href = "/reservation/del/" + rev_num;	
}


function finddate(){
	let date1 = document.getElementById( 'date1' ).value;
	let f = document.myForm;
	
	if(date1 == '') {
		alert("날짜를 입력해주세요.");
	} else{
		location.href = "/reservation/finddaymyorders";
		f.submit();
		return true;
	}
}

function findrestaurant(){
	let restaurant = document.getElementById( "restaurant" ).value;
	let f = document.myForm;
	
	if(restaurant == "") {
		alert("레스토랑 이름을 입력해주세요.");
	} else{
		f.submit();
		return true;
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
				<li class="navigation-item"><a href="/member/main/1"
					class="navigation-link">home</a></li>
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

	<!-- myorders -->
	<section class="myorders">
		<!-- myorders header -->
		<header class="header-myorders">
			<div class="brand-myorders">
				<div>
					<img
						src="${pageContext.request.contextPath}/resources/img/icon1.png"
						width="80">
				</div>
				<h3 class="service-heading">This is your place</h3>
			</div>
		</header>
		<!-- end of myorders header -->

		<!-- myorders list -->
		<section class="list-myorders">
			<div class="myorders-info">
				<h1 class="myorders-heading">${sessionScope.loginid }님의 예약목록</h1>
				<div class="underline">
					<div class="myorders-underline"></div>
				</div>

				<div class="myorders-wrapper">
					<c:if test="${empty list}">
					<h2>등록된 예약이 없습니다.</h2>
					</c:if>
					<c:if test="${not empty list }">
				
					<div class="myorders-search">
							<form action="/reservation/finddaymyorders" method="get"
								onsubmit="finddate();return false;">
								DATE : <input type="date" id="date1" name="day"> <input
									type="submit" class="myorders-btn" value="Search by Date">
							</form>
					</div>

					<div class="myorders-search">
						<form action="/reservation/findnametorestaurant" method="post"
							onsubmit="findrestaurant();return false;">
							RESTAURANT :  <input type="text" id="restaurant" name="rname">
							<input type="submit" class="myorders-btn" value="Search by Name">
						</form>
					</div>
					
					<div class="myorders-list">
						<table class="table custom-table">
						<thead>
							<tr class="myorders-list-th">
								<th scope="col">NO.</th>
								<th scope="col">RESTAURANT</th>
								<th scope="col">DATE</th>
								<th scope="col">TIME</th>
								<th scope="col">PEOPLE</th>
								<th scope="col">MODIFICATION</th>
								<th scope="col">CANCEL</th>
								<th scope="col">REVIEW</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="r" items="${list }">
								<tr scope="row">
									<td><a href="/reservation/detail/${r.rev_num}">${r.rev_num}</a></td>
									<td>${r.restaurant.restaurantName }</td>
									<td>${r.day }</td>
									<td>${r.time }시</td>
									<td>${r.rev_cnt }</td>
									<td><input type="button" class="myorders-btn-table" value="edit"
										onclick="edit(${r.rev_num})"></td>
									<td><input type="button" class="myorders-btn-table" value="delete"
										onclick="del(${r.rev_num})"></td>
									<td><input type="button" class="myorders-btn-table" value="write"
										onclick="rate(${r.rev_num }, ${r.restaurant.restaurant_id })"></td>
								</tr>
							</c:forEach>
						</tbody>
						</table></div>
					</c:if>
					</div>
				</div>
				</a>
		</section>
	</section>

	<!-- footer -->
	<footer class="footer">
		<a name="contact">
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