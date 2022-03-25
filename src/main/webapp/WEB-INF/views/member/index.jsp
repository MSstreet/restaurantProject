<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>This is your Place</title>

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
function moveplace(){
	document.location.href="#places";
}

function categoryChange(e) {
	  const state = document.getElementById("state");

	  const gangwon = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
	  const gyeonggi = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
	  const gyeongsangnam = ["거제시", "김해시", "마산시", "밀양시", "사천시", "양산시", "진주시", "진해시", "창원시", "통영시", "거창군", "고성군", "남해군", "산청군", "의령군", "창녕군", "하동군", "함안군", "함양군", "합천군"];
	  const gyeongsangbuk = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
	  const gwangju = ["광산구", "남구", "동구", "북구", "서구"];
	  const daegu = ["남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군"];
	  const daejeon = ["대덕구", "동구", "서구", "유성구", "중구"];
	  const busan = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
	  const seoul = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
	  const ulsan = ["남구","동구","북구","중구","울주군"];
	  const incheon = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
	  const jeonnam = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
	  const jeonbuk = ["군산시", "김제시", "남원시", "익산시", "전주시", "정읍시", "고창군", "무주군", "부안군", "순창군", "완주군", "임실군", "장수군", "진안군"];
	  const jeju = ["서귀포시","제주시","남제주군","북제주군"];
	  const chungbuk = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
	  

	  if (e.value == "강원") {
	    add = gangwon;
	  } else if (e.value == "경기") {
	    add = gyeonggi;
	  } else if (e.value == "경남") {
	    add = gyeongsangnam;
	  } else if (e.value == "경북") {
	    add = gyeongsangbuk;
	  } else if (e.value == "광주") {
	    add = gwangju;
	  } else if (e.value == "대구") {
	    add = daegu;
	  } else if (e.value == "대전") {
	    add = daejeon;
	  } else if (e.value == "부산") {
	    add = busan;
	  } else if (e.value == "서울") {
	    add = seoul;
	  } else if (e.value == "울산") {
	    add = ulsan;
	  } else if (e.value == "인천") {
	    add = incheon;
	  } else if (e.value == "전남") {
	    add = jeonnam;
	  } else if (e.value == "전북") {
	    add = jeonbuk;
	  } else if (e.value == "제주") {
	    add = jeju;
	  } else if (e.value == "충남") {
	    add = chungnam;
	  } else if (e.value == "충북") {
	    add = chungbuk;
	  }

	  state.options.length = 1;
	  // 군/구 갯수;

		for (property in add) {
			let opt = document.createElement("option");
			opt.value = add[property];
			opt.innerHTML = add[property];
			state.appendChild(opt);
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

				<form class="navigation-search">
					<input type="text" class="navigation-search-input"
						placeholder="Search...">
					<button class="navigation-search-btn">
						<i class="fas fa-search"></i>
					</button>
				</form>
			</div>

			<ul class="navigation-list">
				<li class="navigation-item"><a href="/member/index" class="navigation-link" >home</a>
				</li>
				<li class="navigation-item"><a href="/member/login" class="navigation-link" onclick="login()">mypage</a>
				</li>
				<li class="navigation-item"><a href="/member/login" class="navigation-link" onclick="login()">reservation</a>
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
	

	<!-- header -->
	<header class="header">
		<div class="brand">
			<div>
				<img
					src="${pageContext.request.contextPath}/resources/img/icon1.png"
					width="80">
			</div>
			<h3 class="service-heading">This is your place</h3>
		</div>

		<div class="banner">
			<h1 class="banner-heading">This is your place</h1>
			<p class="banner-paragraph">Make your meal more successful</p>
			<button class="banner-button">
				<a class="banner-text" href="/member/login">Login</a>
			</button>
		</div>
	</header>
	<!-- end of header -->
	
	

	<!-- search -->
	<section class="search">
	<a name="search">
		<div class="search-content">
			<form action="/restaurant/getByAddrAndCategory" method="post">
				<div class="search-info">
					<h1 class="search-heading">Location</h1>
					<div class="underline">
						<div class="search-underline"></div>
					</div>
					<select name="addr" id="" onchange="categoryChange(this)" class="search-select">
              <option value>시/도 선택</option>
              <option value="강원">강원</option>
              <option value="경기">경기</option>
              <option value="경남">경남</option>
              <option value="경북">경북</option>
              <option value="광주">광주</option>
              <option value="대구">대구</option>
              <option value="대전">대전</option>
              <option value="부산">부산</option>
              <option value="서울">서울</option>
              <option value="울산">울산</option>
              <option value="인천">인천</option>
              <option value="전남">전남</option>
              <option value="전북">전북</option>
              <option value="제주">제주</option>
              <option value="충남">충남</option>
              <option value="충북">충북</option>
          		  </select>
            <select name="addr" id="state" value="addr" class="search-select">
              <option>군/구 선택</option>
            </select>
				</div>

				<div class="search-info">
					<h1 class="search-heading">Category</h1>
					<div class="underline">
						<div class="search-underline"></div>
					</div>
					
					<input type="checkbox" name="category" value=""><label
						for="선택안함">선택안함</label> <input type="checkbox" name="category"
						value="로컬맛집"><label for="로컬맛집">로컬맛집</label> <input
						type="checkbox" name="category" value="데이트"><label
						for="데이트">데이트</label> <input type="checkbox" name="category"
						value="단체/회식"><label for="단체/회식">단체/회식</label> <input
						type="checkbox" name="category" value="인스타감성"><label
						for="인스타감성">인스타감성</label> <input type="checkbox" name="category"
						value="포토존"><label for="포토존">포토존</label> <input
						type="checkbox" name="category" value="상견례"><label
						for="상견례">상견례</label> <input type="checkbox" name="category"
						value="공부하기좋은"><label for="공부하기좋은">공부하기좋은</label> <input
						type="checkbox" name="category" value="혼술/혼밥"><label
						for="혼술/혼밥">혼술/혼밥</label> <input type="checkbox" name="category"
						value="노포감성"><label for="노포감성">노포감성</label> <input
						type="checkbox" name="category" value="뷰맛집"><label
						for="뷰맛집">뷰맛집</label>
				</div>


				<div class="search-info">
					<h1 class="search-heading">Restaurant Type</h1>
					<div class="underline">
						<div class="search-underline"></div>
					</div>
					<input type="radio" name="restauranttype"
						value="카페"><label for="카페">카페</label> <input type="radio"
						name="restauranttype" value="베이커리"><label for="베이커리">베이커리</label>
					<input type="radio" name="restauranttype" value="음식점"><label
						for="음식점">음식점</label> <input type="radio" name="restauranttype"
						value="주점"><label for="주점">주점</label>
				</div>

				<input class="search-btn" type="submit" value="Search"  onclick="moveplace();">
			</form>
		</div>
	</section>
	<!-- end of search -->

	<!-- places -->
	<section class="places">
	<a name="places">
		<div class="common-header">
			<h1 class="common-heading">Search Result</h1>
			<div class="underline">
				<div class="small-underline"></div>
				<div class="big-underline"></div>
			</div>
		</div>

		<div class="places-cards-wrapper">
		<c:if test="${empty list}">
		등록된 가게가 없습니다.
		</c:if>
				<c:if test="${not empty list }">
				<c:forEach var="a" items="${list }">
					<div class="place-card">
						<img src="/restaurant/readimg/${a.r_img }" class="place-img">
						<div class="place-card-content">
<!-- 							<h4 class="place-card-heading"> -->
								<a class="place-card-heading" href="/restaurant/detail/${a.restaurant_id }">${a.restaurantName }</a>
<!-- 							</h4> -->
							<p class="place-card-info">평점 : ${a.comsumer_rate }</p>
							<p class="place-card-info">카테고리 : ${a.category }</p>
							<p class="place-card-info">주소 : ${a.addr }</p>
						<button class="place-card-btn"
							 onclick="location.href='/restaurant/detail/${a.restaurant_id }'">
							Book Now <i class="fas fa-angle-double-down btn-arrow"></i>
						</button>
						</div>
					</div>
				</c:forEach>
				</c:if>
		</div>
			
			<div class="places-btn-wrapper">
            	<button class="places-btn" onclick="location.href='/member/index#places'">View All Places</button>
        	</div>
	</section>
	<!-- end of place -->
	
	
	
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