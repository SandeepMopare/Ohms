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





<body class="bg-image">

	<c:if test="${appointPatientlist==1 }">
		<br>
		<div class="row">

			<div class=" mx-auto">

				<c:if test="${aptCancelByDr==1 }">
					<div class="alert alert-success">Appointment cancelled
						Successfully.</div>
				</c:if>

				<c:if test="${aptCancelByDr==0 }">
					<div class="alert alert-warning">Appointment not cancelled.
						Try again</div>
				</c:if>

				<c:if test="${aptCloseByDr==1 }">
					<div class="alert alert-success">Appointment Closed
						Successfully.</div>
				</c:if>

				<c:if test="${aptCloseByDr==0 }">
					<div class="alert alert-warning">Appointment not Closed. Try
						again</div>
				</c:if>



				<center>
					<h4 style="color: white">Appointment List</h4>
				</center>
				<table
					class="table  border-dark table-bordered bg-tableHspListcontact">
					<tr>
						<th>Sr.No</th>
						<th>Patient Name</th>
						<th>Status</th>
						<th>Appointment Date</th>
						<th>Close Action</th>
						<th>Cancel Action</th>
						<th>Add Prescription</th>
						<th>Medical History</th>
					</tr>

					<c:forEach var="item" items="${Appointpatientlist}" begin="0"
						end="100" varStatus="srno">
						<tr>
							<td><center>${srno.index+1 }</center></td>

							<td><c:forEach var="singlePt" items="${patientList}">
									<c:if test="${singlePt.ptId==item.ptId}"> ${singlePt.ptName} </c:if>
								</c:forEach></td>

							<td>${item.aptStatus}</td>
							<td>
								<center>${item.aptDate}<center>
							</td>

							<td>
								<form action="AptCloseByDr" method="get">
									<input type="hidden" name="ptid" value="${item.ptId}" readonly />
									<input type="hidden" name="drid" value="${doctor.drId}"
										readonly />
									<button class="btn btn-sm btn-success" type="submit">
										<i class="fas fa-check"></i> Close
									</button>
								</form>
							</td>

							<td>
								<form action="AptCancelByDr" method="get">
									<input type="hidden" name="ptid" value="${item.ptId}" readonly />
									<input type="hidden" name="drid" value="${doctor.drId}"
										readonly />
									<button class="btn btn-sm btn-warning" type="submit">
										<i class="fas fa-times"></i> Cancel
									</button>
								</form>
							</td>
							<td>
								<form action="addPrescription" method="get">
									<input type="hidden" name="ptid" value="${item.ptId}" readonly />
									<input type="hidden" name="drid" value="${doctor.drId}"
										readonly /> <input type="hidden" name="aptId"
										value="${item.aptId}" readonly />
									<%-- <input type="hidden" name="hspId"
										value="${hospital.hspId}" readonly /> --%>
									<button class="btn btn-sm btn-primary" type="submit">
										<i class="fas fa-plus"></i> Add Prescription
									</button>
								</form>
							</td>
							<td>
								<form action="presclist" method="get">
									<input type="hidden" name="ptId" value="${item.ptId}" readonly />
									<input type="hidden" name="drId" value="${doctor.drId}"
										readonly /> <%-- <input type="hidden" name="aptId"
										value="${item.aptId}" readonly /> --%>
									
									<button class="btn btn-sm btn-secondary" type="submit">
										<i class="fas fa-clipboard"></i> Old Records
									</button>
								</form>
							</td>

						</tr>

					</c:forEach>

				</table>

			</div>
		</div>
	</c:if>


	<c:if test="${allPatAptlist==1 }">
		<br>
		<div class="row">

			<div class=" mx-auto">
				<center>
					<h4 style="color: white">All Patient List</h4>
				</center>
				<table
					class="table  border-dark table-bordered bg-tableHspListcontact">
					<tr>
						<th>Sr.No</th>
						<th>Patient Name</th>
						<th>Age</th>
						<th>Mobile</th>
						<th>Status</th>
						<th>Appointment Date</th>
					</tr>

					<c:forEach var="item" items="${AllpatAptlist}" begin="0" end="10"
						varStatus="srno">
						<tr>
							<td><center>${srno.index+1 }</center></td>

							<td><c:forEach var="singlePt" items="${patientList}">
									<c:if test="${singlePt.ptId==item.ptId}"> ${singlePt.ptName} </c:if>
								</c:forEach></td>

							<td><c:forEach var="singlePt" items="${patientList}">
									<c:if test="${singlePt.ptId==item.ptId}"> ${singlePt.ptAge} </c:if>
								</c:forEach></td>

							<td><c:forEach var="singlePt" items="${patientList}">
									<c:if test="${singlePt.ptId==item.ptId}"> ${singlePt.ptMobile} </c:if>
								</c:forEach></td>


							<td>${item.aptStatus}</td>
							<td><center>${item.aptDate}</center></td>

						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</c:if>

</body>
</html>