<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="common-css-js.jsp"%>
<jsp:include page="common-header-doctor.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Logged</title>



</head>

<%
/* response.setHeader("cache-control", "no-cache, no-store, must-revalidate");
response.setHeader("pragma", "no-cache");
response.setDateHeader("Expires", 0); */

response.setHeader("Pragma", "no-cache, must-revalidate");
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

<body class="bg-image">
	<div>

		<c:if test="${addPrecWindow==1 }">
			<br>
			<br>
			<br>
			<div class="row" style="height:">

				<div class="col-4"></div>
				<div class="col-4">
					<c:if test="${precReg==1 }">
						<div class="alert alert-success">Prescription generated
							Successfully...</div>
					</c:if>
					<c:if test="${precReg==0 }">
						<div class="alert alert-warning">
							Prescription generation Failed... <br>
						</div>


					</c:if>
					<c:if test="${precReg==2 }">
						<form action="addPrec" method="post" class="forshadow"
							style="border: 2px solid black; background: white; padding: 20px; border-radius: 20px">
							<input type="hidden" name="ptId" value="${patient.ptId}" readonly />
							<input type="hidden" name="drId" value="${doctor.drId}" readonly />
							<input type="hidden" name="aptId" value="${appointment.aptId}"
								readonly />
							<table width="385">
								<tr>
									<td class="text-center" colspan="16"><i
										class="fa-solid fa-user-doctor"></i>
										<h6>
											<b> Medical Prescription</b>
										</h6></td>
								</tr>
								<tr>
									<td colspan="12">
										<div class="form-group ">
											<b>Patients' ID:</b> ${patient.ptId}
										</div>
									</td>
									<td colspan="4">
										<div class="form-group ">
											<b>Date:</b> ${appointment.aptDate} <input type="hidden"
												name="dateTime" class="date" value="${appointment.aptDate}"
												readonly />
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="16">
										<div class="form-group ">
											<i class="fas fa-hospital-user"></i><b> Patient's Name:</b>
											${patient.ptName}
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="16">
										<div class="form-group ">
											<b>Diagnosed With:</b> <input name="diagnosedWith"
												class="form-control form-control-sm" rows="2" cols="50"
												type="text" placeholder="Enter text Here" required/>
										</div>
									</td>
								</tr>


								<tr>
									<td colspan="8" class="text-center">
										<div class="form-group ">
											<b> Blood Pressure</b> <input name="bloodPressure"
												class="form-control form-control-sm" type="number"
												placeholder="BP" />
										</div>
									</td>
									<td colspan="4" class="text-center">
										<div class="form-group ">
											<b> Pulse Rate</b> <input name="pulseRate"
												class="form-control form-control-sm" type="number"
												placeholder="Pulse Rate" />
										</div>
									</td>
									<td colspan="4" class="text-center">
										<div class="form-group ">
											<b> Weight</b> <input name="weight"
												class="form-control form-control-sm" type="number"
												placeholder="Weight" />
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="16">
										<div class="form-group ">
											<b> Allergies</b> <input name="allergies"
												class="form-control form-control-sm" type="text"
												placeholder="Allergies" />
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="16">
										<div class="form-group ">
											<b> Disabilities</b> <input name="disabilities"
												class="form-control form-control-sm" type="text"
												placeholder="disabilities If any" />
										</div>
									</td>
								</tr>
								<tr>
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
											<td colspan="8">
												<div class="form-group ">
													<input name="drug1" class="form-control form-control-sm"
														type="text" placeholder="drug1" />
												</div>
											</td>
											<td colspan="4">
												<div class="form-group ">
													<input name="unit1" class="form-control form-control-sm"
														type="text" placeholder="Unit1" />
												</div>
											</td>

											<td colspan="4">
												<div class="form-group ">
													<input name="dose1" class="form-control form-control-sm"
														type="text" placeholder="Dose1" />
												</div>
											</td>
										</tr>
										<tr>
											<td colspan="8">
												<div class="form-group ">
													<input name="drug2" class="form-control form-control-sm"
														type="text" placeholder="drug2" />
												</div>
											</td>
											<td colspan="4">
												<div class="form-group ">
													<input name="unit2" class="form-control form-control-sm"
														type="text" placeholder="Unit2" />
												</div>
											</td>

											<td colspan="4">
												<div class="form-group ">
													<input name="dose2" class="form-control form-control-sm"
														type="text" placeholder="Dose2" />
												</div>
											</td>
										</tr>
									</table>
								</tr>


								<tr>
									<table style="border: 1px solid black;" width="385">
										<tr style="border: 1px solid black;">


											<td colspan="4" class="text-center">
												<div class="form-group ">
													<b> Medical tests </b>
												</div>
											</td>
										</tr>
										<tr>
											<td colspan="16">
												<div class="form-group ">
													<input name="test1" class="form-control form-control-sm"
														type="text" placeholder="tests if required" />
												</div>
											</td>
										</tr>
										<tr>
											<td colspan="16">
												<div class="form-group ">
													<input name="test2" class="form-control form-control-sm"
														type="text" placeholder="tests if required" />
												</div>
											</td>
										</tr>
									</table>
								</tr>
								<tr>
									<td colspan="16">
										<div class="form-row mt-3">
											<input class="btn btn-outline-secondary btn-sm col-md-6"
												type="submit" value="Submit" /> <input
												class="btn btn-outline-secondary btn-sm col-md-6"
												type="reset" value="Clear" />
										</div>
									</td>
								</tr>
							</table>


							<div>
								<br> <br>
								<h6>
									<b><i class="far fa-user-md"></i> Dr. ${doctor.drName}</b>
								</h6>
							</div>

						</form>

					</c:if>
				</div>
			</div>

		</c:if>
	</div>
</body>
</html>