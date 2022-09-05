<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

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
	
<script>
const b = () =>{
// 	let tr1 = document.getElementById("tr1_");
//  		if(tr1.value == "수정"){
// 	 		tr1.value = "수정완료";
			let trs_ =  document.getElementsByClassName("tr_");
			for( var i = 0; i < trs_.length; i++ ){
				document.getElementsByClassName('tr_')[i].style.display = '';
		}
// 		}else if(tr1.value == "수정완료"){
// 			let trs1 =  document.getElementsByClassName("tr_");
// 			let restaurant_id = trs1[0];
//  			let restaurantName = trs1[1];
// 			alert(trs1[0].value);
//			location.href = "/restaurant/edit/"+restaurant_id+"/"+restaurantName;
//		}

	}



// const c = (restaurant_id, restaurantName) =>{
// 	location.href = "/edit/" + restaurant_id + "/" + restaurantName;
// }
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
		
	</div>
		<!-- end of navigation -->
		<!-- end of navbar  -->
		
		<!-- detail_o -->
	<section class="detail_o">
	
	<!-- detail_o header -->
	<header class="header-detail_o">
		<div class="brand-detail_o">
			<div>
				<img
					src="${pageContext.request.contextPath}/resources/img/icon1.png"
					width="80">
			</div>
			<h3 class="detail-service-heading">This is your place</h3>
		</div>
	</header>
	<!-- end of detail_o header -->
	
	
	<div class="detail_o-content">
		<h1 class="detail_o-heading">${r.restaurantName }</h1>
			<div class="underline">
				<div class="small-underline"></div>
				<div class="big-underline"></div>
			</div>
<!-- 			<h3>가게 상세 페이지</h3> -->
				<form action="/restaurant/edit/${r.restaurant_id }" method="post"
					enctype="multipart/form-data">
				<div class = detail_o-table>
					<table border="1">
						<tr class="tr_">
							<th>고유번호</th>
							<td><input type="text" name="restaurant_id"
								value="${r.restaurant_id}" readonly class="detail_o-input"></td>
						</tr>
			
						<tr>
							<th>작성자</th>
							<td><input type="text" name="id"
								value="${sessionScope.loginid }" class="detail_o-input"></td>
						</tr>
			
						<tr>
							<th>상호명</th>
							<td><input type="text" value="${r.restaurantName }" readonly class="detail_o-input"></td>
						</tr>
			
						<tr class="tr_" style="display: none;">
							<th>상호명 수정</th>
							<td><input type="text" name="restaurantName" class="detail_o-input"></td>
						</tr>
			
						<tr>
							<th>주소</th>
							<td><input type="text" value="${r.addr }" readonly class="detail_o-input"></td>
						</tr>
			
						<tr class="tr_" style="display: none;">
							<th>주소 수정</th>
							<td><input type="text" name="addr" class="detail_o-input"></td>
						</tr>
			
						<tr>
							<th>상세주소</th>
							<td><input type="text" value="${r.detailAddr }" readonly class="detail_o-input"></td>
						</tr>
			
						<tr class="tr_" style="display: none;">
							<th>상세주소 수정</th>
							<td><input type="text" name="detailAddr" class="detail_o-input"></td>
						</tr>
			
						<tr>
							<th>연락처</th>
							<td><input type="text" value="${r.tel }" readonly class="detail_o-input"></td>
						</tr>
			
						<tr class="tr_" style="display: none;">
							<th>연락처 수정</th>
							<td><input type="text" name="tel" class="detail_o-input"></td>
						</tr>
			
						<tr>
							<th>카테고리</th>
							<td><input type="text" value="${r.category }" readonly class="detail_o-input"></td>
						</tr>
			
						<tr class="tr_" style="display: none;" >
							<th>카테고리 수정</th>
							<td><input type="checkbox" name="category" value="로컬맛집"><label
								for="로컬맛집">로컬맛집</label> <input type="checkbox" name="category"
								value="데이트"><label for="데이트">데이트</label> <input
								type="checkbox" name="category" value="단체/회식"><label
								for="단체/회식">단체/회식</label> <input type="checkbox" name="category"
								value="인스타감성"><label for="인스타감성">인스타감성</label> <input
								type="checkbox" name="category" value="포토존"><label
								for="포토존">포토존</label> <input type="checkbox" name="category"
								value="상견례"><label for="상견례">상견례</label> <input
								type="checkbox" name="category" value="공부하기좋은"><label
								for="공부하기좋은">공부하기좋은</label> <input type="checkbox" name="category"
								value="혼술/혼밥"><label for="혼술/혼밥">혼술/혼밥</label> <input
								type="checkbox" name="category" value="노포감성"><label
								for="노포감성">노포감성</label> <input type="checkbox" name="category"
								value="뷰맛집"><label for="뷰맛집">뷰맛집</label></td>
						</tr>
			
						<tr>
							<th>운영시간</th>
							<td><input type="text" value="${r.oper_time }" readonly class="detail_o-input"></td>
						</tr>
			
						<tr class="tr_" style="display: none;">
							<th>운영시간 수정</th>
							<td><input type="text" name="oper_time"></td>
						</tr>
			
						<tr>
							<th>식당종류</th>
							<td><input type="text" value="${r.restauranttype }" readonly class="detail_o-input"></td>
						</tr>
			
						<tr class="tr_" style="display: none;">
							<th>식당종류 수정</th>
							<td><input type="radio" name="restaurant_type" value="카페"><label
								for="카페">카페</label> <input type="radio" name="restaurant_type"
								value="베이커리"><label for="베이커리">베이커리</label> <input
								type="radio" name="restaurant_type" value="음식점"><label
								for="음식점">음식점</label> <input type="radio" name="restaurant_type"
								value="주점"><label for="주점">주점</label></td>
						</tr>
			
						<tr>
							<th>음식종류</th>
							<td><input type="text" value="${r.menutype }" readonly class="detail_o-input"></td>
						</tr>
			
						<tr class="tr_" style="display: none;">
							<th>음식종류 수정</th>
							<td><input type="radio" name="menu_type" value="한식"><label
								for="한식">한식</label> <input type="radio" name="menu_type" value="중식"><label
								for="중식">중식</label> <input type="radio" name="menu_type" value="일식"><label
								for="일식">일식</label> <input type="radio" name="menu_type" value="분식"><label
								for="분식">분식</label> <input type="radio" name="menu_type"
								value="레스토랑"><label for="레스토랑">레스토랑</label> <input
								type="radio" name="menu_type" value="패스트푸드"><label
								for="패스트푸드">패스트푸드</label> <input type="radio" name="menu_type"
								value="아시아음식"><label for="아시아음식">아시아음식</label> <input
								type="radio" name="menu_type" value="베이커리"><label
								for="베이커리">베이커리</label> <input type="radio" name="menu_type"
								value="커피/차"><label for="커피/차">커피/차</label></td>
						</tr>
			
						<tr>
							<th>가게설명</th>
							<td><input type="text" value="${r.contents }" rows="10" cols="30" readonly class="detail_o-input"></td>
						</tr>
						
						<tr class="tr_" style="display: none;">
							<th>가게설명 수정</th>
							<td><input type="text" name="contents"></td>
						</tr>
			
						<tr>
							<th>사진</th>
							<td><input type="file" name="file"></td>
						</tr>
<%-- 						<td><a href="/menu/${r.restaurant_id}/add">메뉴추가</a></td> --%>
<%-- 						<td><a href="/reservation/${r.restaurant_id}/restaurantorders">예약자명단</a></td> --%>
					</table>
					<div class="detail_o-btn-wrapper">
							<input type="button" value="수정" onclick="b()" class="detail_o-btn">
							<input id="tr2_" type="submit" value="수정완료" class="detail_o-btn">
					</div>
					
				<div class = detail_c-link>

				<input
						type="button" value="메뉴추가" class="ownerboard-btn"
						onclick= "location.href='/menu/${r.restaurant_id}/add'">
				<input
						type="button" value="예약자명단" class="ownerboard-btn"
						onclick= "location.href='/reservation/${r.restaurant_id}/restaurantorders'">
				</div>
				</div>
				</form>
		
	</div>
	</section>
	
		<!-- footer -->
    <footer class="footer">
	<a name="contact">
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