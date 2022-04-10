<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="common-css-js.jsp"%>
<jsp:include page="common-header-doctor.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<%
response.setHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Expires", "0");
response.setDateHeader("Expires", -1);

if (session.getAttribute("my-doctor") == null) {
	response.sendRedirect("http://localhost:8080/dr/drlogout");
	return;
}
%>
<script>
	history.forword();
</script>
<meta charset="ISO-8859-1">
<title>Old Record</title>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<link href="css/HospitalList.css" rel="stylesheet" type="text/css">

</head>
<body class="bg-dark">
	<br>
	<div class="container mt-3">
		<div style="color: white">
			<h4>
				<center>Medical History Of ${patient.ptName }</center>
			</h4>
		</div>
		<c:forEach var="prescription" items="${prescriptionList}" begin="0"
			end="100" varStatus="srno">

			<div class="card" style="width: 70rem;">

				<div class="card-body">
					<h5 class="card-title">Prescription For Appointment On
						${prescription.dateTime }</h5>
					<h6 class="card-subtitle mb-2 text-muted">${patient.ptName }
						is Diagnosed With: ${prescription.diagnosedWith }</h6>

					<h5 class="card-text">Measurements:</h5>
					<p>
						<b>Blood Pressure: </b>${prescription.bloodPressure } &nbsp &nbsp<b>
							Pulse Rate: </b>${prescription.pulseRate } &nbsp &nbsp <b>
							Weight: </b> ${prescription.weight }
					</p>

					<p class="card-text">
						<b>Allergies:</b> ${prescription.allergies }
					</p>
					<p class="card-text">
						<b>Disabilities:</b> ${prescription.disabilities }
					</p>


					<table style="border: 1px solid black;" width="385">
						<tr style="border: 1px solid black;">
							<td colspan="8" class="text-center"
								style="border: 1px solid black;">
								<div class="form-group ">
									<b> Drugs </b>
								</div>
							</td>
							<td colspan="4" class="text-center"
								style="border: 1px solid black;">
								<div class="form-group ">
									<b> Unit </b>
								</div>
							</td>

							<td colspan="4" class="text-center">
								<div class="form-group ">
									<b> Dosage</b>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="8" class="text-center"
								style="border: 1px solid black;">

								<div class="form-group ">${prescription.drug1 }</div>
							</td>
							<td colspan="4" class="text-center"
								style="border: 1px solid black;">

								<div class="form-group ">${prescription.unit1 }</div>
							</td>
							<td colspan="4" class="text-center"
								style="border: 1px solid black;">

								<div class="form-group ">${prescription.dose1 }</div>
							</td>
						</tr>
						<tr>
							<td colspan="8" class="text-center"
								style="border: 1px solid black;">

								<div class="form-group ">${prescription.drug2 }</div>
							</td>
							<td colspan="4" class="text-center"
								style="border: 1px solid black;">

								<div class="form-group ">${prescription.unit2 }</div>
							</td>
							<td colspan="4" class="text-center"
								style="border: 1px solid black;">

								<div class="form-group ">${prescription.dose2 }</div>
							</td>
						</tr>
					</table>
					<br>
					<div>
						<h5>Tests</h5>
						<h6 class="card-text">
							<b>Test 1: </b> ${prescription.test1 }
						</h6>
						<h6 class="card-text">
							<b>Test 2: </b> ${prescription.test2 }
						</h6>
					</div>
				</div>
			</div>
			<br>
		</c:forEach>
	</div>
</body>
</html>