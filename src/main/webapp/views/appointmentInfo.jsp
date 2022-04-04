<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="common-css-js.jsp"%>
<jsp:include page="common-header-patient.jsp"></jsp:include>

<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointment Info</title>
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



	<div class="row">
		
		<div class="mx-auto">

              <br><br>
			<c:if test="${c==1}">
				<div class="alert alert-warning mt-2">Appointment cancelled</div>
			</c:if>
			<c:if test="${c==0}">
				<div class="alert alert-warning mt-2">Appointment not
					cancelled. Try again...</div>
			</c:if>

		</div>
	</div>



	<!-- display appointment list for cancel appointment-->

	<c:if test="${APTLIST==1 }">


		<div>
			<center>
				<h4 style="color:white">Appointment Info</h4>
		</div>
		</center>
		<div class="row">
			<div class="mx-auto">
				<table class="table border-dark table-bordered bg-tableHspListcontact">
					<tr>
						<th>Sr.No</th>
						<th>Doctor Name
						 </th>
						<th>
						Hospital Name</th>
						<th>Appointment Status</th>
						<th>Appointment Date</th>
						<th>For Payment</th>
						<th>Cancel Appointment</th>

					</tr>

					<c:forEach var="item" items="${aptList}" begin="0" end="100"
						varStatus="srno">
						<tr>
							<td><center> ${srno.index+1 } </center></td>
							
							
							    <td>
							    <c:forEach var="singledr" items="${drList}">
									<c:if test="${singledr.drId==item.drId}"> Dr. ${singledr.drName} 
								</td>
								<td>	
									 <c:forEach var="singlehsp" items="${hspList}">
									<c:if test="${singlehsp.hspId==singledr.hspId}"> ${singlehsp.hspName} </c:if>
								   </c:forEach>
																										
									</c:if>
									
									
								 </c:forEach>
								</td>

							<td>${item.aptStatus}</td>
							<td><center> ${item.aptDate} </center></td>

							<td>
								<form action="patientPayOPt" method="get">
									<div>
										<input type="hidden" name="ptid" value="${patient.ptId}" readonly />
										<input type="hidden" name="drid" value="${item.drId}" readonly />
										<c:if test="${item.aptStatus=='BOOKED'}" >
										<button class="btn btn-sm btn-info" type="submit"><i class="far fa-credit-card"></i> Payment</button>
										</c:if>
									</div>
								</form>
							</td>
							<td>
								<form action="aptCancel" method="get">
									<input type="hidden" name="drid" value="${item.drId}" readonly />
									<input type="hidden" name="ptid" value="${patient.ptId}"
										readonly />
									<c:if test="${item.aptStatus=='BOOKED' || item.aptStatus=='CONFIRMED'}" >
										<button class="btn btn-sm btn-warning" type="submit"><i class="fas fa-times"></i> Cancel
											Appointment</button>
									</c:if>

								</form>
							</td>

						</tr>
					</c:forEach>

				</table>
			</div>
		</div>

	</c:if>







</body>
</html>