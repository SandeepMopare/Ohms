<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <%@ include file="common-css-js.jsp"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>User Login</title>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

 <link href="<c:url value="/css/newlogin.css" />" rel="stylesheet">
</head>
<body>

<div class="container-fluid">
<jsp:include page="common-header.jsp"></jsp:include>
</div>
<br>
<br>

<div class="container" id="container">

	<div class="form-container sign-up-container">
	
		<form action="reqforgotPass" method="post">
		            <c:if test="${ptPassFail==1 }">
						<div class="alert alert-success" style="color:green"><h6>Please check your email</h6></div>
					</c:if>

					<c:if test="${ptPassFail==0 }">
						<div class="alert alert-warning" style="color:orange"><h6>Invalid User</h6></div>
					</c:if>
					
					<c:if test="${ptPassUpdated==1 }">
						<div class="alert alert-success" style="color:green"><h6>Password updated successfully.</h6></div>
					</c:if>

					<c:if test="${ptPassUpdated==0 }">
						<div class="alert alert-warning" style="color:orange"><h6>Password not updated.</h6></div>
					</c:if>
		
			<h1>Change password</h1>
			
			<span>enter your Username & email here</span>
		<input class="form-control form-control-sm" type="text" name="ptUsername" placeholder="UserName"  pattern="[A-Za-z0-9]{1,15}" required autocomplete="off" title="only 15 characters & numbers allowed"/>	
			<input class="form-control form-control-sm" type="email" name="ptGmail" placeholder="Email" pattern="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z]{5})\.([a-zA-Z]{3})$" required autocomplete="off" title="enter valid email"/>				
			<!-- <input class="form-control form-control-sm" type="password" name="ptPassword" placeholder="Enter new password"  pattern="[A-Za-z0-9]{1,10}" required autocomplete="off" title="only 10 characters & numbers allowed"/> -->
			
			<button>Apply</button>
			<a href="/home">Go to home</a>
		</form>
	</div>
	<div class="form-container sign-in-container">
		<form action="AuthPtlogin" method="post">
		             <c:if test="${ptLogFail==0 }">
						<div class="alert alert-warning"> Invalid Login</div>
					 </c:if>
					
					 <c:if test="${ptPassFail==1 }">
						<div class="alert alert-success" style="color:green"><h6> Please check your email</h6></div>
					 </c:if>

					<c:if test="${ptPassFail==0 }">
						<div class="alert alert-warning " style="color:orange"><h6>Invalid User</h6></div>
					</c:if>
					<c:if test="${ptPassUpdated==1 }">
						<div class="alert alert-success" style="color:green"><h6>Password updated successfully.</h6></div>
					</c:if>
					
			<h1>Sign in</h1>			
			<span>use your account</span>
			<input type="text" name="ptUsername" placeholder="Username" required="required"/>
			<input type="password" name="ptPassword" placeholder="Password" required="required"/>
			
			
			<button>Sign In</button>
			<a href="/home">Go to home</a>
		</form>
	</div>
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-left">
				<h1>Welcome Back!</h1>
				<p>To keep connected with us please login with your personal info</p>
				 <button class="ghost" id="signIn">Sign In</button> 
			</div>
			<div class="overlay-panel overlay-right">
				<h1>Hello, Friend !</h1>
				<p>Have you forgot your password? click here to change password</p>
				<button class="ghost" id="signUp">forgot password</button> 
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click', () => {
	container.classList.add("right-panel-active");
});

signInButton.addEventListener('click', () => {
	container.classList.remove("right-panel-active");
});

</script>
</body>
</html>