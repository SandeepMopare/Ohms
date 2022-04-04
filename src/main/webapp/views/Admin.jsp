<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="common-css-js.jsp"%>
<jsp:include page="common-header-admin.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin logged</title>



</head>

<%
/* response.setHeader("cache-control", "no-cache, no-store, must-revalidate");
response.setHeader("pragma", "no-cache");
response.setDateHeader("Expires", 0); */

response.setHeader("Pragma","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Expires","0");
response.setDateHeader("Expires",-1);

if(session.getAttribute("my-admin")==null)
{
	response.sendRedirect("http://localhost:8080/admin/login");
	return;
}
%> 

 



<body class="bg-image">
<div >



	<!--  hospital -->
	<c:if test="${HSPLIST==1 }">
		<div class="row " >

			<div class="mx-auto ">
			<br>
			
				<center><h4 style="color:black" >Hospital Details</h4></center>
				<table class="table  border-dark table-bordered bg-tableHspListcontact" style="color:black">
					<tr>
						<th>Sr.No</th>
						<!-- <th>Hospital Id</th> -->						
						<th><i class="fas fa-hospital"></i> Hospital Name</th>
						<th><i class="fas fa-map-marker-alt"></i> Hospital Address</th>
						<th><i class="fas fa-edit"></i></i> Edit Action</th>
						<th><i class="fas fa-minus-circle"></i> Delete Action</th>
					</tr>

					<c:forEach var="item" items="${hspList}" begin="0" end="100"
						varStatus="srno">
						
						
						<tr >
							<th style="text-align:center">${srno.index+1 }</th>
							<%-- <th>${item.hspId}</th> --%>
							<th >${item.hspName}</th>
							<th style="text-align:center">${item.hspAdd}</th>

							<th style="text-align:center">
								<form action="editHspOpt" method="get">
									<input type="hidden" name="id" value="${item.hspId}" readonly />
									<button class="btn btn-sm btn-success" type="submit"><i class="fas fa-edit"></i> Edit</button>

								</form>
							</th>

							<th style="text-align:center">
								<form action="deleteHsp" method="get">
									<input type="hidden" name="id" value="${item.hspId}" readonly />
									<button class="btn btn-sm btn-warning" type="submit"><i class="fas fa-minus-circle"></i> Delete</button>
								</form>
							</th>
						</tr>
					</c:forEach>

				</table>
			</div>
		</div>
	</c:if>


	<c:if test="${addHspWindow==1 }">
		<br>
		<br>
		<br>
		<div class="row" style="height:">

             <div class="col-4"></div>
			<div class="col-4">
				<c:if test="${hspReg==1 }">
					<div class="alert alert-success">Hospital Registration Successful...</div>
				</c:if>
				<c:if test="${hspReg==0 }">
					<div class="alert alert-warning">Hospital Registration Failed... <br> 
					                                 <small>username/password already used. Try with different credentials.</small></div>
				</c:if>
				<c:if test="${hspReg==2 }">
					
						<form action="addHsp" method="post" class="forshadow"
							style="border: 2px solid black; background:white; padding: 20px; border-radius: 20px">
							
                  <center>
                        <h6>Hospital Registration</h6></center>
                        <br>
                        
							<div class="form-group ">
								Hospital Name<input name="hspName"
									class="form-control form-control-sm" type="text"
									placeholder="Enter Name Here..." pattern="^[a-zA-z]+([\s][a-zA-Z]+)*$"
									required autocomplete="off" title="only characters are allowed" />
							</div>

							<div class="form-group">
								Hospital Address<input name="hspAdd"
									class="form-control form-control-sm" type="text"
									placeholder="Enter Address Here..."   pattern="^[A-Za-z0-9\s]{1,30}"
									required autocomplete="off" title="only contains characters & numbers.." />
							</div>
							<div class="from-group ">
								<input name="hspBNo" class="form-control form-control-sm"
									type="hidden" placeholder="No of beds available"
									Pattern="[0-9]{1,4}" required autocomplete="off"
									title="enter valid mobile no" />
							</div>
							<div class="form-group ">
								Username<input name="hspUsername"
									class="form-control form-control-sm" type="text"
									placeholder="Enter Username Here..."
									pattern="[A-Za-z0-9]{1,15}" required autocomplete="off"
									title="only 15 characters & numbers allowed" />
							</div>
							<div class="form-group ">
								Password<input name="hspPassword"
									class="form-control form-control-sm" type="password"
									placeholder="Enter Password Here..."
									pattern="[A-Za-z0-9]{1,10}" required autocomplete="off"
									title="only 10 characters & numbers allowed" />
							</div>
							
							  <div class="form-row mt-3">
							  <input class="btn btn-outline-secondary btn-sm col-md-6" type="submit"
									value="Register" />
							 
								 <input class="btn btn-outline-secondary btn-sm col-md-6"
									type="reset" value="Clear" />
                                </div>

							

						</form>
					
				</c:if>
			</div>
		</div>

	</c:if>





	<c:if test="${editHspProf==1 }">
		<br>
		<br>
		<br>
		<div class="row" style="height:">

             <div class="col-4"></div>
			<div class="col-4">


				<c:if test="${hspprofile==1 }">
					<div class="alert alert-success">Hospital Profile Updated Successfully...</div>
				</c:if>

				<c:if test="${hspprofile==0 }">
					<div class="alert alert-warning">Hospital Profile Updatation Failed...<br>
			                    <small>username/password already used. Try with different credentials.</small></div>
				</c:if>


				<c:if test="${hspprofile==2 }">

					<form action="updateHsp" method="post" class="mx-auto forshadow" 
					style="border: 2px solid black; background:white;  padding: 20px; border-radius: 20px">

						 <center>
                        <h6>Update Hospital Details</h6></center>
                        <br>
						<div>
							<input name="id" type="hidden" value="${hspOldInfo.hspId}"
								readonly />
						</div>
						<div class="form-group">
							Hospital Name<input name="hspName"
								class="form-control form-control-sm" type="text"
								value="${hspOldInfo.hspName }" pattern="^[a-zA-z]+([\s][a-zA-Z]+)*$"
								required autocomplete="off" title="only characters are allowed" />
						</div>
						<div class="form-group">
							Hospital Address<input name="hspAdd"
								class="form-control form-control-sm" type="text"
								value="${hspOldInfo.hspAdd }" pattern="^[A-Za-z0-9\s]{1,30}"
								required autocomplete="off" title="only contains characters & numbers.." />
						</div>
						<div class="form-group">
							<input name="hspBNo" class="form-control form-control-sm"
								type="hidden" value="${hspOldInfo.hspBNo }" Pattern="[0-9]{1,4}"
								required autocomplete="off" title="enter valid mobile no" />
						</div>
						<div class="form-group">
							Username<input name="hspUsername"
								class="form-control form-control-sm" type="text"
								value="${hspOldInfo.hspUsername }" pattern="[A-Za-z0-9]{1,15}"
								required autocomplete="off"
								title="only 15 characters & numbers allowed" />
						</div>
						<div class="form-group">
							Password<input name="hspPassword"
								class="form-control form-control-sm" type="password"
								value="${hspOldInfo.hspPassword }" pattern="[A-Za-z0-9]{1,10}"
								required autocomplete="off"
								title="only 10 characters & numbers allowed" />
						</div>
						<div class="form-row mt-2 ">
							<input class="btn btn-outline-secondary btn-sm col-md-6" type="submit"
								value="Save" />
						
							<input class="btn btn-outline-secondary btn-sm col-md-6" type="reset"
								value="Clear" />
						</div>

					</form>
				</c:if>
			</div>
		</div>
	</c:if>
	
	
	
	<!--  hospital -->
	<c:if test="${CONTACTLIST==1 }">
		<div class="row">
            <div class="col-1"></div>
			<div class="col-10">
			<br>
				<center><h4 style="color:black"  >Messages From Users</h4></center>
				<table class="table  border-dark table-bordered bg-tableHspListcontact" style="color:black;">
					<tr>
						<th style="text-align: center;">No</th>									
						<th style="text-align: center;"><i class="fas fa-user"></i> Name</th>
						<th style="text-align: center;"><i class="fas fa-envelope"></i> Email</th>
						<th style="text-align: center;"> Date </th>
						<!-- <th style="text-align: center;">Mobile</th> -->
						<th style="text-align: center;"><i class="far fa-sticky-note"></i> Subject/Topic</th>
						<th style="text-align: center;"><i class="far fa-comment-alt"></i> Message</th>
					
					</tr>	

					<c:forEach var="item" items="${contactList}" begin="0" end="100"
						varStatus="srno">
						<tr>
							<td><center>${srno.index+1 }</center></td>							
							<td>${item.ctName}</td>
							<td>${item.ctEmail}</td>
							<td><center>${item.ctDate}</center></td>
							<%-- <td>${item.ctMobile}</td> --%>
							<td>${item.ctSubject}</td>
							<td>${item.ctMessage}</td>
						</tr>
					</c:forEach>

				</table>
			</div>
		</div>
	</c:if>

</div>
</body>
</html>