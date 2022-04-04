<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="common-css-js.jsp"%>
<jsp:include page="common-header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor list</title>



 <style>
  .contentabc {
  background: rgb(0, 0, 0);  
  background: rgba(0, 0, 0, 0.5); 
  color: white;
} 

.bg-image {
  /* The image used */
  background-image: url("https://images.unsplash.com/photo-1584982751601-97dcc096659c?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=752&q=80");
  /* Add the blur effect */
  
 /* background-color: transparent;*/
   background-size: cover; 
}

.bg-tableHspListcontact{
 background-color:white;
 filter: drop-shadow(5px 5px 5px #222); 
  opacity: 1;
}

.forshadow{
filter: drop-shadow(5px 5px 5px #222); 
}

</style>



</head>
<body class="bg-image">
               <br>
				
				<div class="row">					
					<div class="mx-auto">
				   <center><h3>Doctors List</h3></center>	
				   
				  
						<table class="table  border-dark table-bordered bg-tableHspListcontact" >
						
					<tr>
					<th colspan="3">	Hospital - ${hospital.hspName} </th>
					<th colspan="3">	Address - ${hospital.hspAdd}</th>
						
					
						
					</tr>
						
							<tr>
							
								<th>Sr.No</th>
								<th>Doctor Name</th>
								<th>Speciality</th>
								<th>Email</th>
								<th>Mobile</th>
								<th>Status</th>
							</tr>

							<c:forEach var="item" items="${drList}" begin="0" end="100"
								varStatus="srno">
								<tr> 
						
						
									<td>${srno.index+1 }</td>
									<td>Dr. ${item.drName}</td>
									<td>${item.drSpec}</td>
									<td>${item.drEmail}</td>
									<td>${item.drMobile}</td>

									<td><c:if test="${item.drStatus==true}"> Available</c:if>
										<c:if test="${item.drStatus==false}"> Not Available</c:if></td>
								</tr>
							</c:forEach>

						</table>

					</div>

				</div>

</body>
</html>