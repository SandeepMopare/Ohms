<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ include file="common-css-js.jsp"%>
<jsp:include page="common-header-hospital.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hospital Logged</title>
</head>


<% 
response.setHeader("Pragma","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Expires","0");
response.setDateHeader("Expires",-1);


if(session.getAttribute("my-hospital")==null){
	response.sendRedirect("http://localhost:8080/hospital/login");
	return;
}
%>


<body class="bg-image">
<br>
	<div class="row">
		<div class="mx-auto">
			<center>
				<h3 style="color:white">Hospital Info</h3>
				<img src="/image/newprofilelogo/hospprofileLogo.png"" alt="" width="100" height="100"/></center>
			</center>

             <br>
			<table class="table  border-dark table-bordered bg-tableHspListcontact">
				<tr>

					<th>Hospital Reg. No</th>
					<td>${hospital.hspId}</td>
				</tr>

				<tr>
					<th>Hospital Name</th>
					<td>${hospital.hspName}</td>
				</tr>
				
				 <tr>
					<th>Total doctors</th>
					<td>${drcount}</td>
				</tr>
				

				<tr>
					<th>Hospital Address</th>
					<td>${hospital.hspAdd}</td>
				</tr>

     
			</table>

		</div>

	</div>




</body>
</html>