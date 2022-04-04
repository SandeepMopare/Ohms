<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ include file="common-css-js.jsp"%>
<jsp:include page="common-header-doctor.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Profile</title>
</head>

<%
response.setHeader("Pragma", "no-cache");
response.setHeader("cache-control", "no-store");
response.setHeader("Expires", "0");
response.setDateHeader("Expires", -1);

if(session.getAttribute("my-doctor")==null){
	response.sendRedirect("http://localhost:8080/dr/drlogout");
	return;
}

%>
<script>
   history.forward();
</script>




<body class="bg-image">
<br>
	<div class="row">
		<div class="mx-auto">
			<center>
				<h3 style="color:white">Doctor Profile</h3>
			<img src="/image/newprofilelogo/doctorprofilelogo1.jpg" alt="" width="100" height="100"/></center>
			</center>

         <br>
			<table class="table  border-dark table-bordered bg-tableHspListcontact " >



				<tr>
					<th>Registration Id</th>

					<td>${doctor.drId}</td>
				</tr>

				<tr>
					<th>Name</th>

					<td>${doctor.drName}</td>
				</tr>
				
				<tr>
					<th>Hospital</th>

					<td>${hospital.hspName}</td>
				</tr>

				<tr>
					<th>Speciality</th>

					<td>${doctor.drSpec}</td>
				</tr>



<tr>
					<th>Email</th>

					<td>${doctor.drEmail}</td>
				</tr>

<tr>
					<th>Mobile</th>

					<td>${doctor.drMobile}</td>
				</tr>

			</table>

		</div>

	</div>




</body>
</html>