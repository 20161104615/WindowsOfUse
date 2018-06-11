<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="UserJavaBean.User" %>
<%@ page import="UserJavaBean.DB_User" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Home</title>
<link rel="icon" type="image/icon" href="assets/images/tabicon.ico">

<link rel="stylesheet" type="text/css" href="">
<link href="assets/css/bootstrap.min.css" rel="stylesheet">
<link href="assets/css/bootstrap-theme.min.css" rel="stylesheet">
<link href="assets/css/font-awesome.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,400i,600,700,700i" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Crimson+Text:400,700,700i|Josefin+Sans:700" rel="stylesheet">
<link href="assets/css/main.css" rel="stylesheet">
<link rel="icon" href="assets/images/logo.png">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">

</head>

<body>
<jsp:useBean id="user" class="UserJavaBean.DB_User" scope="session" />
<div id="index">                                           <!-- Index starts here -->
	<div class="container main">
		<div class="row home">
			<div id = "index_left" class="col-md-6 left">
				<img class="img-responsive img-rabbit" src="assets/images/home.jpg">
			</div>
			<div id = "index_right" class="col-md-6 text-center right">
				<div class="logo">
					<img src="assets/images/logo.png">
					<h4>I am rabbit</h4>
				</div>
				<p class="home-description">
					Hi, I am Rabbit, Web developer from michigan, US. I am passionate about design, development and interaction. I really love what I do.
				</p>
				<div class="btn-group-vertical custom_btn animated slideinright">
					<div id="about" class="btn btn-rabbit">个人信息</div>
					<div id="work" class="btn btn-rabbit">修改信息</div>
					<div id="contact" class="btn btn-rabbit">Contact</div>
				</div>      
			</div>
		</div>

		
	</div>
</div>                                                      <!-- index ends here -->

<div id="about_scroll" class="pages ">                      <!-- about strats here  -->
	<div class="container main">
		<div class="row">
			<div class="col-md-6 left" id="about_left">
				<img class="img-responsive img-rabbit" src="assets/images/about.jpg">
			</div>

			<div class="col-md-6 right" id="about_right">
				<a href="#index" class="btn btn-rabbit back"> <i class="fa fa-angle-left" aria-hidden="true"></i> Back to home </a>
				<div id="watermark">
					<h2 class="page-title" text-center>About</h2>
					<div class="marker">a</div>
				</div>
				<p class='subtitle'>Hi, I am <% 
												String loginName = (String) session.getAttribute("loginName");
												out.print(loginName);
											 %>
									. A freelance web designer, front-end developer and digital planner based in US.
				</p>
				<p class="info">
					test
				</p>  
			</div>
		</div>
	</div>            
</div>                                                                <!-- About ends here -->

<div id="work_scroll" class="pages">                                  <!-- Work starts here -->
	<div class="container main">
		<div class="row">
			<div class="col-md-6" id="work_left">
				<div id="owl-demo" class="owl-carousel owl-theme">
					<div class="item"><img class="img-responsive img-rabbit" src="assets/images/work.jpg"></div>
				</div>
			</div>

			<div class="col-md-6" id="work_right">
				<a href="#index" class="btn btn-rabbit back"> <i class="fa fa-angle-left" aria-hidden="true"></i> Back to Home </a>
				<div id="watermark">
					<h2 class="page-title" text-center>Work</h2>
					<div class="marker">w</div>
				</div>
				<p class='subtitle'>
					Do you want to change your personal information? 
				</p>
				<p class="info">
					<a href="/GWC/personinformation/index3.html">Yes</a>   or   <a href="#">No</a>
				</p>
			</div>
		</div>
	</div>    
</div>                                                                 <!-- Work ends here  -->


<div id="contact_scroll" class="pages">                             <!-- Contact starts here -->
	<div class="container main">
		<div class="row">
			<div class="col-md-6 left" id="contact_left">
				<img class="img-responsive img-rabbit" src="assets/images/contact.jpg">
			</div>

			<div class="col-md-6 right" id="contact_right">
				<a href="#index" class="btn btn-rabbit back"> <i class="fa fa-angle-left" aria-hidden="true"></i> Back to Home </a>
				<div id="watermark">
					<h2 class="page-title" text-center>Contact</h2>
					<div class="marker">c</div>
				</div>
				<p class='subtitle'>I'm based in cheltenham in the UK, not far from Bristol, Birmingham, Oxford and Swindom. Drop me a line.
				</p>
				<!-- form -->
				<form class="form_edit"> 
					<div class="form-group">
						<input type="name" class="form-control" id="exampleInputName" placeholder="Name">
					</div>

					<div class="form-group">
					<input type="email" class="form-control" id="exampleInputEmail1" placeholder="Email">
					</div>

					<div class="form-group">
					<textarea class="form-control" rows="5" placeholder="Message"></textarea>
					</div>
					<button type="submit" class="btn btn-rabbit submit">Send Message</button>
				</form>
			</div>
		</div>
	</div>

	<footer class="text-center">
		<div class="container bottom">
			<div class="row">
				<div class="col-sm-12">
					<p>Copyright &copy; 2017.Company name All rights reserved.<a target="_blank" href="http://www.17sucai.com/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
				</div>
			</div>
		</div>
	</footer>
	
</div>                                                              <!-- Contact ends here -->

<script src="assets/js/jquery-3.1.0.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/script.js"></script>
</body>
</html>