<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="common-css-js.jsp"%>
<jsp:include page="common-header.jsp"></jsp:include>
<link href="<c:url value="/css/home.css" />" rel="stylesheet">
<!DOCTYPE html>
<html>
<head>

<title>home</title>

<link rel="icon" href="/image/DoctorHubLogo.png" type="image/png"
	sizes="16x16">

<style>
.homebg {
	background-image: url("/image/homebackground/homebackimg.jpg");
	background-size:cover;
	height:100vh;
	
}

.about-section {
	padding: 50px;
	text-align: center;
	background-color: grey;
	color: white;
}

.about-section1 {
	padding: 15px;
	text-align: center;
	background-color: yellowgreen;
	color: white;
}
</style>

</head>
<body class="">

      <div class='container1 homebg' style="height:600px">
		<div class="container_content1"   >
			<div class="container_content_inner1">
				 <div class="title" >
					<h1 style="color:white">OHMS</h1>
				</div>
				<div class="par">
					<h5 style="font-family:cursive;">
					
					" to bring health care of  standards within the reach of every individual we are committed to the achievement and the maintenance of excellence in healthcare for the benefit of the humanity. "
					
                     </h5>
				</div> 
				

			</div>
		</div>
		<div class="container_outer_img">
			<div class="img-inner1">
				<div class="slider-container">

					<div class="slider-content">

						<div class="slider-single">
							<img class="slider-single-image"
								src="image/hospitals/hsp1.jpg" alt="1" />
							<h1 class="slider-single-title">Government Hospitals</h1>
							<a class="slider-single-likes" href="javascript:void(0);"> <i
								class="fa fa-heart"></i>
								<p>1,247</p>
							</a>
						</div>

						<div class="slider-single">
							<img class="slider-single-image"
								src="image/hospitals/hsp2.jpg" alt="2" />
							<h1 class="slider-single-title">Government Hospitals</h1>
							<a class="slider-single-likes" href="javascript:void(0);"> <i
								class="fa fa-heart"></i>
								<p>1,247</p>
							</a>
						</div>

						<div class="slider-single">
							<img class="slider-single-image"
								src="image/hospitals/hsp3.jpg" alt="3" />
							<h1 class="slider-single-title">Government Hospitals</h1>
							<a class="slider-single-likes" href="javascript:void(0);"> <i
								class="fa fa-heart"></i>
								<p>1,247</p>
							</a>
						</div>


						<div class="slider-single">
							<img class="slider-single-image"
								src="image/hospitals/hsp4.jpg" alt="4" />
							<h1 class="slider-single-title">Government Hospitals</h1>
							<a class="slider-single-likes" href="javascript:void(0);"> <i
								class="fa fa-heart"></i>
								<p>1,247</p>
							</a>
						</div>


						
					</div>
				</div>
			</div>
		</div>
	</div>

	<div >
	<br>
		<center>
			<h1 style="color: black;">
				<i class="fas fa-user-md">OHMS </i>
			</h1>
		</center>

		<div class="d-flex">
		
			<div class="container">
				<span>Step 1</span> <img alt=""
					src="https://www.devsnews.com/wp/medinet/wp-content/uploads/2020/06/process-icon-01.png">
				<span>Make Appointment </span>
			</div>
			<div class="container">
				<span>Step 2</span> <img alt=""
					src="https://www.devsnews.com/wp/medinet/wp-content/uploads/2020/06/process-icon-02.png">
				<span>Ready To Go </span>
			</div>
			<div class="container">
				<span>Step 3</span> <img alt=""
					src="https://www.devsnews.com/wp/medinet/wp-content/uploads/2020/06/process-icon-03.png">
				<span>Get Consultant </span>
			</div>
			<div class="container">
				<span>Step 4</span> <img alt=""
					src="https://www.devsnews.com/wp/medinet/wp-content/uploads/2020/06/process-icon-04.png">
				<span>Get Relief </span>
			</div>
		</div>



	</div>

	<div class="overlay"></div>


	<div >

		<div style="text-align: center; color: black;">
		 <br> <br>
			<h2>Our Specialist</h2>

			<div class="d-flex">

				<c:forEach var="item" items="${drList }" begin="0" end="3"
					varStatus="srno">
					<div class="card ml-5 mr-2 mb-2" style="width: 18rem;">
						<img style="height: 250px;" class="card-img-top"
							src="image/doctors/doctor${srno.index+1}.jpg"
							alt="Card image cap">
						<div class="card-body">
							<h5 class="card-text" style="color: black;">Dr.
								${item.drName}</h5>
							<h5 class="card-text" style="color: black;">${item.drSpec}</h5>
						</div>
					</div>

				</c:forEach>


			</div>
			
		</div>
		
	
	</div>
	<br>
	<div class="container">
	  <div class=" row" style="height:350px">
		    <div class="col-6">
		           
		            <img src="image/home/missiondoctor.jpg" alt="doctor" width=100% height="350">
		            
		    </div>
		     <div class="col-6 d-flex flex-column justify-content-center align-items-center ">
		           <center><h2>Our Mission</h2></center>
		          
		            At doctorhub, To provide comprehensive health care service, to all section of society by a providing such type of information so user/patient can able to take decision about the problem he is going to face, be the medium to connect patient  with hospital and doctor easily.
		    </div>
		 
		
		
		</div>
	   <div class=" row" style="height:350px">
		    
		    <div class="col-6 d-flex flex-column justify-content-center align-items-center ">
		           <center><h2>Our Approach</h2></center>
		          
		             At doctorhub, our approach is to improve the health of those we serve with a commitment to excellence in all that we do. Our goal is to offer quality care and services that set community standards, exceed patients' expectations and are provided in a caring, convenient, cost-effective and accessible manner.
		    </div>
		 <div class="col-6">
		           
		            <img src="image/home/approachdoctor.jpg" alt="doctor" width=100%  height="350">
		            
		    </div>		
		
		</div>
	</div>
	<br>

	<footer class="text-center text-white"
		style="background-color: black;">
		<!-- Grid container -->
		<div class="container p-4 pb-0" style="">
			<!-- Section: Social media -->
			<section class="mb-4">
				<!-- Facebook -->
				<a class="btn btn-primary btn-floating m-1"
					style="background-color: #3b5998;" href="#!" role="button"><i
					class="fab fa-facebook-f"></i></a>

				<!-- Twitter -->
				<a class="btn btn-primary btn-floating m-1"
					style="background-color: #55acee;" href="#!" role="button"><i
					class="fab fa-twitter"></i></a>

				<!-- Google -->
				<a class="btn btn-primary btn-floating m-1"
					style="background-color: #dd4b39;" href="#!" role="button"><i
					class="fab fa-google"></i></a>

				<!-- Instagram -->
				<a class="btn btn-primary btn-floating m-1"
					style="background-color: #ac2bac;" href="#!" role="button"><i
					class="fab fa-instagram"></i></a>

				<!-- Linkedin -->
				<a class="btn btn-primary btn-floating m-1"
					style="background-color: #0082ca;" href="#!" role="button"><i
					class="fab fa-linkedin-in"></i></a>
				<!-- Github -->
				<a class="btn btn-primary btn-floating m-1"
					style="background-color: #333333;" href="#!" role="button"><i
					class="fab fa-github"></i></a>
			</section>
			<!-- Section: Social media -->
		</div>
		<!-- Grid container -->

		<!-- Copyright -->
		<div class="text-center" >
			Copyright © 2021. All rights reserved | Designed by	Team25. <a href="#">DoctorHub.com</a>
		</div>
		<!-- Copyright -->
	</footer>
	
	
	
	
	
	<script type="text/javascript">

	const repeat = false;
	const noArrows = false;
	const noBullets = false;


	const container = document.querySelector('.slider-container');
	var slide = document.querySelectorAll('.slider-single');
	var slideTotal = slide.length - 1;
	var slideCurrent = -1;

	function initBullets() {
	    if (noBullets) {
	        return;
	    }
	    const bulletContainer = document.createElement('div');
	    bulletContainer.classList.add('bullet-container')
	    slide.forEach((elem, i) => {
	        const bullet = document.createElement('div');
	        bullet.classList.add('bullet')
	        bullet.id = `bullet-index-${i}`
	        bullet.addEventListener('click', () => {
	            goToIndexSlide(i);
	        })
	        bulletContainer.appendChild(bullet);
	        elem.classList.add('proactivede');
	    })
	    container.appendChild(bulletContainer);
	}

	function initArrows() {
	    if (noArrows) {
	        return;
	    }
	    const leftArrow = document.createElement('a')
	    const iLeft = document.createElement('i');
	    iLeft.classList.add('fa')
	    iLeft.classList.add('fa-arrow-left')
	    leftArrow.classList.add('slider-left')
	    leftArrow.appendChild(iLeft)
	    leftArrow.addEventListener('click', () => {
	        slideLeft();
	    })
	    const rightArrow = document.createElement('a')
	    const iRight = document.createElement('i');
	    iRight.classList.add('fa')
	    iRight.classList.add('fa-arrow-right')
	    rightArrow.classList.add('slider-right')
	    rightArrow.appendChild(iRight)
	    rightArrow.addEventListener('click', () => {
	        slideRight();
	    })
	    container.appendChild(leftArrow);
	    container.appendChild(rightArrow);
	}

	function slideInitial() {
	    initBullets();
	    initArrows();
	    setTimeout(function () {
	        slideRight();
	    }, 500);
	}

	function updateBullet() {
	    if (!noBullets) {
	        document.querySelector('.bullet-container').querySelectorAll('.bullet').forEach((elem, i) => {
	            elem.classList.remove('active');
	            if (i === slideCurrent) {
	                elem.classList.add('active');
	            }
	        })
	    }
	    checkRepeat();
	}

	function checkRepeat() {
	    if (!repeat) {
	        if (slideCurrent === slide.length - 1) {
	            slide[0].classList.add('not-visible');
	            slide[slide.length - 1].classList.remove('not-visible');
	            if (!noArrows) {
	                document.querySelector('.slider-right').classList.add('not-visible')
	                document.querySelector('.slider-left').classList.remove('not-visible')
	            }
	        }
	        else if (slideCurrent === 0) {
	            slide[slide.length - 1].classList.add('not-visible');
	            slide[0].classList.remove('not-visible');
	            if (!noArrows) {
	                document.querySelector('.slider-left').classList.add('not-visible')
	                document.querySelector('.slider-right').classList.remove('not-visible')
	            }
	        } else {
	            slide[slide.length - 1].classList.remove('not-visible');
	            slide[0].classList.remove('not-visible');
	            if (!noArrows) {
	                document.querySelector('.slider-left').classList.remove('not-visible')
	                document.querySelector('.slider-right').classList.remove('not-visible')
	            }
	        }
	    }
	}

	function slideRight() {
	    if (slideCurrent < slideTotal) {
	        slideCurrent++;
	    } else {
	        slideCurrent = 0;
	    }

	    if (slideCurrent > 0) {
	        var preactiveSlide = slide[slideCurrent - 1];
	    } else {
	        var preactiveSlide = slide[slideTotal];
	    }
	    var activeSlide = slide[slideCurrent];
	    if (slideCurrent < slideTotal) {
	        var proactiveSlide = slide[slideCurrent + 1];
	    } else {
	        var proactiveSlide = slide[0];

	    }

	    slide.forEach((elem) => {
	        var thisSlide = elem;
	        if (thisSlide.classList.contains('preactivede')) {
	            thisSlide.classList.remove('preactivede');
	            thisSlide.classList.remove('preactive');
	            thisSlide.classList.remove('active');
	            thisSlide.classList.remove('proactive');
	            thisSlide.classList.add('proactivede');
	        }
	        if (thisSlide.classList.contains('preactive')) {
	            thisSlide.classList.remove('preactive');
	            thisSlide.classList.remove('active');
	            thisSlide.classList.remove('proactive');
	            thisSlide.classList.remove('proactivede');
	            thisSlide.classList.add('preactivede');
	        }
	    });
	    preactiveSlide.classList.remove('preactivede');
	    preactiveSlide.classList.remove('active');
	    preactiveSlide.classList.remove('proactive');
	    preactiveSlide.classList.remove('proactivede');
	    preactiveSlide.classList.add('preactive');

	    activeSlide.classList.remove('preactivede');
	    activeSlide.classList.remove('preactive');
	    activeSlide.classList.remove('proactive');
	    activeSlide.classList.remove('proactivede');
	    activeSlide.classList.add('active');

	    proactiveSlide.classList.remove('preactivede');
	    proactiveSlide.classList.remove('preactive');
	    proactiveSlide.classList.remove('active');
	    proactiveSlide.classList.remove('proactivede');
	    proactiveSlide.classList.add('proactive');

	    updateBullet();
	}

	function slideLeft() {
	    if (slideCurrent > 0) {
	        slideCurrent--;
	    } else {
	        slideCurrent = slideTotal;
	    }

	    if (slideCurrent < slideTotal) {
	        var proactiveSlide = slide[slideCurrent + 1];
	    } else {
	        var proactiveSlide = slide[0];
	    }
	    var activeSlide = slide[slideCurrent];
	    if (slideCurrent > 0) {
	        var preactiveSlide = slide[slideCurrent - 1];
	    } else {
	        var preactiveSlide = slide[slideTotal];
	    }
	    slide.forEach((elem) => {
	        var thisSlide = elem;
	        if (thisSlide.classList.contains('proactive')) {
	            thisSlide.classList.remove('preactivede');
	            thisSlide.classList.remove('preactive');
	            thisSlide.classList.remove('active');
	            thisSlide.classList.remove('proactive');
	            thisSlide.classList.add('proactivede');
	        }
	        if (thisSlide.classList.contains('proactivede')) {
	            thisSlide.classList.remove('preactive');
	            thisSlide.classList.remove('active');
	            thisSlide.classList.remove('proactive');
	            thisSlide.classList.remove('proactivede');
	            thisSlide.classList.add('preactivede');
	        }
	    });

	    preactiveSlide.classList.remove('preactivede');
	    preactiveSlide.classList.remove('active');
	    preactiveSlide.classList.remove('proactive');
	    preactiveSlide.classList.remove('proactivede');
	    preactiveSlide.classList.add('preactive');

	    activeSlide.classList.remove('preactivede');
	    activeSlide.classList.remove('preactive');
	    activeSlide.classList.remove('proactive');
	    activeSlide.classList.remove('proactivede');
	    activeSlide.classList.add('active');

	    proactiveSlide.classList.remove('preactivede');
	    proactiveSlide.classList.remove('preactive');
	    proactiveSlide.classList.remove('active');
	    proactiveSlide.classList.remove('proactivede');
	    proactiveSlide.classList.add('proactive');

	    updateBullet();
	}

	function goToIndexSlide(index) {
	    const sliding = (slideCurrent > index) ? () => slideRight() : () => slideLeft();
	    while (slideCurrent !== index) {
	        sliding();
	    }
	}

	slideInitial();
	
	const root = document.documentElement;
	const marqueeElementsDisplayed = getComputedStyle(root).getPropertyValue("--marquee-elements-displayed");
	const marqueeContent = document.querySelector("ul.marquee-content");

	root.style.setProperty("--marquee-elements", marqueeContent.children.length);

	for(let i=0; i<marqueeElementsDisplayed; i++) {
	  marqueeContent.appendChild(marqueeContent.children[i].cloneNode(true));
	}
	</script>
	
	

</body>
</html>