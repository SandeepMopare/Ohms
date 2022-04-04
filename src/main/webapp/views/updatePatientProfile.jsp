<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="common-css-js.jsp"%>
<jsp:include page="common-header-patient.jsp"></jsp:include>

   <%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Profile</title>
</head>



<% 

response.setHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Expires", "0");
response.setDateHeader("Expires", -1);

if(session.getAttribute("my-patient")==null){
	response.sendRedirect("http://localhost:8080/patient/ptlogout");
}

%>

<script >
  history.forword();
</script>


<body class="bg-image">
 <br>
        <br>
<div class="row">


 <div class="col-4"></div>
       <div  class="col-4">
      
	               <c:if test="${u==1 }">
						<div class=" alert alert-success mt-2">User Profile Updated Successfully...
					</c:if>

					<c:if test="${u==0 }">
						<div class="alert alert-warning">User Profile Updatation Failed...<br>
						 <small>username already used. Try with different credentials.</small></div>
					</c:if>
					
					<c:if test="${u==3 }">
						<div class="alert alert-success">User profile unable to update</div>
					</c:if>
					
					<c:if test="${u==2 }">
					    <br>

						<form action="upd-patient" method="post" class=""
							style="border: 2px solid black; background-color: white; padding: 20px; border-radius: 20px">

							<div>
								<center><h6>
									Update User Profile
								</h6></center>
							</div>
							<div>
								<input name="id" type="hidden" value="${patient.ptId}" readonly />
							</div>						
							<div>
							   <input type="hidden" name="password" value="${patient.ptPassword}" readonly />
							</div>
							<div class="mt-1">
								Name:<input name="ptName" class="form-control form-control-md"
									type="text" value="${patient.ptName}"  pattern="^[a-zA-z]+([\s][a-zA-Z]+)*$" required autocomplete="off" title="only characters are allowed"/>
							</div>
							<div class="mt-1">
								Age:<input name="age" class="form-control form-control-md"
									type="text" value="${patient.ptAge}" Pattern= "^(0?[1-9]|[1-9][0-9]|[1][1-9][1-9]|200)$" required autocomplete="off" title="entered age not valid"/>
							</div>
							<div class="mt-1">
								Email: <input name="ptGmail" class="form-control form-control-md"
									type="email" value="${patient.ptGmail}" pattern="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z]{5})\.([a-zA-Z]{3})$" required autocomplete="off" title="enter valid email"/>
							</div>
							<div class="mt-1">
								Mobile: <input name="ptMobile"
									class="form-control form-control-md" type="text"
									value="${patient.ptMobile}" Pattern= "[789][0-9]{9}" required autocomplete="off" title="enter valid mobile no"/>
							</div>
							
							<div class="mt-1">
								Username: <input name="ptUsername"
									class="form-control form-control-md" type="text"
									value="${patient.ptUsername}" pattern="[A-Za-z0-9]{1,15}" required autocomplete="off" title="Username only contains characters & numbers.."/>
							</div>
																	
							<div class="form-row mt-3">
								<input class="btn btn-outline-secondary btn-sm col-md-6" type="submit"
									value="Save" />
							
								<input class="btn btn-outline-secondary btn-sm col-md-6" type="reset"
									value="Clear" />
							</div>
						</form>
						
						
					</c:if>
					</div>
					
</div>
    
    
    
</body>
</html>