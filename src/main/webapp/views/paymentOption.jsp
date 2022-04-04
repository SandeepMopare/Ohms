<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ include file="common-css-js.jsp"%>
<jsp:include page="common-header-patient.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment</title>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
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
<div class="container-fluid">
    <div class="row d-flex justify-content-center">
        <br><br>
        <div class="col-5">
        <br> <br> <br> <br>
            <div class="card mx-auto">
           
                                
            <c:if test="${payment==1 }">
						<div class="alert alert-success">Payment Successfully Completed. Appointment Confirmed...</div>
			</c:if>

			<c:if test="${payment==0 }">
						<div class="alert alert-warning">Payment Failed.  Appointment not confirmed. Try again...</div>
	     	</c:if>	
	     	
	     	<c:if test="${payment==2 }">
						<div class="alert alert-warning">You already done payment for this appointment.</div>
	     	</c:if>					
            
            <c:if test="${payOnce==5 }">
                   
                <center> <h4 class="heading">PAYMENT DETAILS</h4> </center>
                <form class="pl-3" action="patientpay" method="post">
                    <div class="form-group mb-0">
                        <p class="mb-0">Card Number</p> <input type="text" name="cardnum" placeholder="1234 5678 9012 3457"  Pattern= "[0-9]{12}" required autocomplete="off" title="Card number should have 12 digits.."> <img src="https://img.icons8.com/color/48/000000/visa.png" width="64px" height="60px" />
                    </div>
                    <div class="form-group">
                        <p class="mb-0">Cardholder's Name</p> <input type="text" name="name" placeholder="Name" pattern="[A-Za-z\s]{1,40}"  required autocomplete="off" title="Only characters are allowed..">
                    </div>
                    <div class="form-group pt-2">
                        <div class="row d-flex">
                            <div class="col-5">
                                <p class="mb-0">Expiration</p> <input type="text" name="exp" placeholder="MM/YY" id="exp" required  title="Only digits allowed">
                            </div>
                            <div class="col-4">
                                <p class="mb-0">Cvv</p> <input type="password" name="cvv" placeholder="&#9679;&#9679;&#9679;" required pattern="[0-9]{3}" title="Only 3 digits allowed">
                            </div>
                            <div class="col-2 pt-0 mt-3 ml-2"> <button type="submit" class="btn btn-primary"><i class="fas fa-arrow-right px-3 py-1"></i></button> </div>
                        </div>
                    </div>
                    
                     <div>
                        <input name="ptid" type="hidden" value="${patient.ptId}" readonly/>
                    </div> 
                    
                     <div>
                    <input type="hidden" name="drid" value="${doctor.drId}" readonly />
                    </div> 
                </form>
                </c:if>	
            </div>
        </div>
    </div>
</div>
</body>
</html>