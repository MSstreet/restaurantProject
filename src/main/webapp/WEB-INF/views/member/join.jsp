<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Join</title>
<script type="text/javascript" src="httpRequest.js"></script>
<script type="text/javascript">


function checkPwd(){
	  var f1 = document.forms[1]; 
	  var pw1 = f1.pwd.value;
	  var pw2 = f1.pwd_check.value;
	  if(pw1!=pw2){
	   document.getElementById('checkPwd').style.color = "red";
	   document.getElementById('checkPwd').innerHTML = "동일한 암호를 입력하세요.";
	  }else{
	   document.getElementById('checkPwd').style.color = "black";
	   document.getElementById('checkPwd').innerHTML = "암호가 확인 되었습니다.";
	   
	  }	  
	 }

function checkMsg(){
	let m1 = document.forms[1];
	let id1 = m1.id.value;
	let checkM = document.getElementById('checkMsg');
	if(id1 ===""){
		checkM.style.display = 'block';
	}else{
		checkM.style.display = 'none';		
	}

	
	 
</script>

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
				<li class="navigation-item"><a href="#" class="navigation-link" >home</a>
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
	
<!-- join -->
	<section class="join">
	<!-- join header -->
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
	<!-- end of join header -->
	<div class="join-content">
		<h1 class="join-heading">join</h1>
			<div class="underline">
				<div class="small-underline"></div>
				<div class="big-underline"></div>
			</div>
				<form name = "search" action="/member/join" method="post">	<!-- (controller로)제출/action:제출경로/method:전송방식 -->
					<p class="join-info">id :</p><input type="text" name="id" class="join-box" id="id" maxlength="50" onkeydown="checkMsg()">
					<button type="button" class="join-checkbtn" onclick="openIdchk()">중복검사</button>
					<input type="hidden" name="idDuplication" value="idUncheck">
					
					<!-- <img id="id_check_sucess" style="display: none;"> -->
					<div id="checkMsg">아이디를 입력하세요.</div>
					
					<p class="join-info">암호 :</p><input type="password" class="join-box" name="pwd"><br/>
					<p class="join-info">암호 확인 :</p><input type="password" class="join-box" name="pwd_check" onkeyup="checkPwd()"><br/>
					<div id="checkPwd">동일한 암호를 입력하세요.</div>
					<p class="join-info">name :</p><input type="text" class="join-box" name="name"><br/>
					<p class="join-info">tel :</p><input type="tel" class="join-box" name="tel"><br/>
					<p class="join-info">email :</p><input type="email" class="join-box" name="email"><br/>
					<p class="join-info">type :</p><input type="radio" name="type" value="1" checked>사용자
						<input type="radio" name="type" value="2">점주<br/>
					<input type="submit" class="join-btn" value="가입">	<!-- action이 지정한 URL로 제출 -->
					<input type="reset" class="join-btn" value="취소" >
				</form>
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