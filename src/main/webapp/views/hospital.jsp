<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="common-css-js.jsp"%>
<jsp:include page="common-header-hospital.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hospital Logged</title>

<style>
</style>

</head>

<%
/* response.setHeader("cache-control", "no-cache, no-store, must-revalidate");
response.setHeader("pragma", "no-cache");
response.setDateHeader("Expires", 0); */

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

	<c:if test="${DRLIST==1 }">
        <br>
		<div class="row">

			<div class="mx-auto">
				<center>
					<h3 style="color: white">Doctor's Info</h3>
				</center>
				<table class="table  border-dark table-bordered bg-tableHspListcontact" style="color:black">

					<tr>
						<th>Sr.No</th>
						<!--  <th>Dr.Id</th>  -->
						<th>Name</th>
						<th>Speciality</th>
						<th>Email</th>
						<th>Mobile</th>
						<th>Available Status</th>
						<th>Change Status</th>
						<th>Edit Action</th>
						<th>Delete Action</th>
					</tr>

					<c:forEach var="item" items="${drList}" begin="0" end="100"
						varStatus="srno">
						<tr>
							<td>${srno.index+1 }</td>
							<%--  <td>${item.drId}</td>  --%>
							<td>${item.drName}</td>
							<td>${item.drSpec}</td>
							<td>${item.drEmail}</td>
							<td>${item.drMobile}</td>
							<td><c:if test="${item.drStatus==true}"> Available</c:if> <c:if
									test="${item.drStatus==false}"> Not Available</c:if></td>
							<td>
								<form action="editDrStatus" method="get">
									<input type="hidden" name="drId" value="${item.drId}" readonly />
									<input type="hidden" name="hspId" value="${hospital.hspId}"
										readonly />
									<button class="btn btn-sm btn-info" type="submit"><i class="fas fa-exchange-alt"></i> Change</button>
								</form>
							</td>

							<td>
								<form action="editDrOpt" method="get">
									<input type="hidden" name="drId" value="${item.drId}" readonly />
									<input type="hidden" name="hspId" value="${hospital.hspId}"
										readonly />
									<button class="btn btn-sm btn-success" type="submit"><i class="fas fa-edit"></i> Edit</button>
								</form>
							</td>

							<td>
								<form action="delDr" method="get">
									<input type="hidden" name="drId" value="${item.drId}" readonly />
									<input type="hidden" name="hspId" value="${hospital.hspId}"
										readonly />
									<button class="btn btn-sm btn-warning" type="submit"><i class="far fa-trash-alt"></i> Delete</button>
								</form>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</c:if>


	<c:if test="${editHspProf==1 }">
		<br>
		<div class="row">
             
			<div class=" mx-auto">
			
			<br><br><br>
				<c:if test="${hspprofile==1 }">
					<div class="alert alert-success">Bed count Updated Successfully...</div>
				</c:if>

				<c:if test="${hspprofile==0 }">
					<div class="alert alert-warning">Bed count Updatation Failed...</div>
				</c:if>

				<c:if test="${hspprofile==2 }">

					<form action="updateHspBedcount" method="post" class="" style="border: 2px solid black; background-color: white; padding: 20px; border-radius: 20px">

						<div>
							<input name="hspId" type="hidden" value="${hospital.hspId}"
								readonly />
						</div>

						<table class="table table-striped border-dark table-bordered">
							<br>
							<center>
								<h6>Update Bed Count</6>
							</center>
							<br>
							<tr>
								<td>Last count</td>
								<td><input name="hspBNoOld"
									class="form-control form-control-sm" type="text"
									placeholder="${hospital.hspBNo }" readonly Pattern="[0-9]{1,4}"
									required autocomplete="off" title="enter valid mobile no" /></td>
							</tr>
							<tr>
								<td>New count</td>
								<td><input name="hspBNo"
									class="form-control form-control-sm" type="text"
									value="${hospital.hspBNo }" Pattern="[0-9]{1,4}" required
									autocomplete="off" title="enter valid no" /></td>

							</tr>
							<tr>
								<td>
									<div class="mt-1">
										<input class="btn btn-outline-secondary btn-sm btn-block" type="reset"
											value="Clear" />
									</div>
								</td>
								
								<td>
								<div class="mt-1"><input class="btn btn-outline-secondary btn-sm btn-block"
									type="submit" value="Update" />
									</div>
									</td>
								
							</tr>
						</table>

					</form>
				</c:if>
			</div>
		</div>
	</c:if>


	<c:if test="${editDrProf==1 }">
		
		<div class="row mt-3" style="height:">
           <div class="mx-auto ">
                 <br> <br>
				<c:if test="${drprofile==1 }">				
					<div class="alert alert-success">Doctor Profile Updated Successfully...</div>
				</c:if>

				<c:if test="${drprofile==0 }">				    
					<div class="alert alert-warning">Doctor Profile Updatation Failed...<br>
					               <small>username/password already used. Try with different credentials.</small></div>
				</c:if>

                     
				<c:if test="${drprofile==2 }">
				
                   
					<form action="updateDr" method="post" class=" mt-0"
						style="border: 2px solid black; background-color: white; padding: 20px; border-radius: 20px">

						<div class="mt-1">
							<center>
								<h6>
									Update Doctor Profile
								</h6>
								</center>
						</div>
						
						<br>


						<div>
							<input name="hspId" type="hidden" value="${hospital.hspId}"
								readonly />
						</div>
						<div>
							<input name="id" type="hidden" value="${drOldInfo.drId}" readonly />
						</div>


						<%-- <div class="form-group row"> 
					<label for="drname" class="col-sm-3 col-form-label"> Doctor Name</label> 
					     
					      <div class="col-sm-8"> <input name="drName" class="form-control form-control-sm"
							type="text" value="${drOldInfo.drName}"  pattern="[A-Za-z\s]{1,40}" required autocomplete="off" title="only characters are allowed"/>
							</div>
					</div> --%>

                          <div class="form-row">
							<div class="form-group  field-wrap col-md-12">
								<label for="inputname">Doctor Name</label> <input name="drName"
								class="form-control form-control-sm" type="text"
								value="${drOldInfo.drName}" pattern="^[a-zA-z]+([\s][a-zA-Z]+)*$"  required
								autocomplete="off" title="only characters are allowed" />
							</div>
						</div>
						
                       <div class="form-row">
							<div class="form-group field-wrap col-md-12">
								<label for="inputspec">Speciality</label> <input name="drSpec"
								class="form-control form-control-sm" type="text"
								value="${drOldInfo.drSpec}" pattern="^[a-zA-z]+([\s][a-zA-Z]+)*$" required
								autocomplete="off" title="only characters are allowed" />
							</div>
						</div>
						
						<div class="form-row">
							<div class="form-group field-wrap col-md-6">
								<label for="inputemail">Email</label> <input name="drEmail" class="form-control form-control-sm"
								type="email" value="${drOldInfo.drEmail}"
								pattern="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z]{5})\.([a-zA-Z]{3})$" required
								autocomplete="off" title="enter valid email" />
							</div>
					        <div class="form-group  field-wrap col-md-6">
								<label for="inputmob">Mobile</label> <input name="drMobile"
								class="form-control form-control-sm" type="text"
								value="${drOldInfo.drMobile}" Pattern= "[789][0-9]{9}" required
								autocomplete="off" title="enter valid mobile no" />
							</div>
						</div>
						
						
						<div class="form-row">
							<div class="form-group  field-wrap col-md-6">
								<label for="inputUsername">Username</label> <input name="drUsername"
								class="form-control form-control-sm" type="text"
								value="${drOldInfo.drUsername}" pattern="[A-Za-z0-9]{1,15}"
								required autocomplete="off"
								title="only 15 characters & numbers allowed" />
							</div>
							<div class="form-group  field-wrap col-md-6">
								<label for="inputPassword">Password</label> <input name="drPassword"
								class="form-control form-control-sm" type="password"
								value="${drOldInfo.drPassword}" pattern="[A-Za-z0-9]{1,10}"
								required autocomplete="off"
								title="only 10 characters & numbers allowed" />
						    </div>
					    </div>
						
							
							<div class="form-row mt-3">
							  <input class="btn btn-outline-secondary btn-sm col-md-6" type="submit"
									value="Save" />
							 
								 <input class="btn btn-outline-secondary btn-sm col-md-6"
									type="reset" value="Clear" />
                                </div>																				

					</form>
					
				</c:if>
			</div>
		</div>
	</c:if>

	<c:if test="${addDrWindow==1 }">

		<div class="row mt-3" style="height:">
			<!-- <div class="col-3"></div> -->
             
			<div class="mx-auto ">
			 <br> <br>
				<c:if test="${drReg==1 }">
					<div class="alert alert-success">Doctor Registration Successfully...</div>
				</c:if>
				<c:if test="${drReg==0 }">
					<div class="alert alert-warning">Doctor Registration Failed...<br>
					               <small>username/password already used. Try with different credentials.</small></div>
				</c:if>

				<c:if test="${drReg==2 }">
					<form action="addDr" method="post" class=" mt-0"
						style="border: 2px solid black; background-color: white; padding: 20px; border-radius: 20px">
						<br>
						<div>
							<center>
								<h6 >Add Doctor</h6>
							</center>
						</div>
						
						<div class="form-row">
							<div class="form-group  field-wrap col-md-12">
								<label for="inputname">Doctor Name</label> <input name="drName"
									class="form-control form-control-sm" type="text"
									placeholder="Name" pattern="^[a-zA-z]+([\s][a-zA-Z]+)*$"  required
									autocomplete="off" title="only characters are allowed" />
							</div>
						</div>
						<div class="form-row">
							<div class="form-group field-wrap col-md-12">
								<label for="inputspec">Speciality</label> <input name="drSpec"
									class="form-control form-control-sm" type="text"
									placeholder="Speciality" pattern="^[a-zA-z]+([\s][a-zA-Z]+)*$"  required
									autocomplete="off" title="only characters are allowed" />
							</div>
						</div>
						<div class="form-row">
							<div class="form-group field-wrap col-md-6">
								<label for="inputemail">Email</label> <input name="drEmail"
									class="form-control form-control-sm" type="email"
									placeholder="Email"
									pattern="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z]{5})\.([a-zA-Z]{3})$" required
									autocomplete="off" title="enter valid email" />
							</div>
							<div class="form-group  field-wrap col-md-6">
								<label for="inputmob">Mobile</label> <input name="drMobile"
									class="form-control form-control-sm" type="text"
									placeholder="Mobile" Pattern= "[789][0-9]{9}" required
									autocomplete="off" title="enter valid mobile no" />
							</div>
						</div>

						<div class="form-row">
							<div class="form-group  field-wrap col-md-6">
								<label for="inputUsername">Username</label> <input
									name="drUsername" class="form-control form-control-sm"
									type="text" placeholder="Username" pattern="[A-Za-z0-9]{1,15}"
									required autocomplete="off"
									title="only 15 characters & numbers allowed" />
							</div>
							<div class="form-group  field-wrap col-md-6">
								<label for="inputPassword">Password</label> <input
									name="drPassword" class="form-control form-control-sm"
									type="password" placeholder="Password"
									pattern="[A-Za-z0-9]{1,10}" required autocomplete="off"
									title="only 10 characters & numbers allowed" />
							</div>
						</div>
						<div class="mt-1 field-wrap">
							<input name="hspId" type="hidden" value="${hospital.hspId}"
								readonly />
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

</body>
</html>