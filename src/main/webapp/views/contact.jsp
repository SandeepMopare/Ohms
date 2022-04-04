<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ include file="common-css-js.jsp" %> 
<jsp:include page="common-header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<title>Contact Us</title>

<meta charset="ISO-8859-1">

<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
</head>



 <style>
  .contentabc {
  background: rgb(0, 0, 0);  
  background: rgba(0, 0, 0, 0.5); 
  color: white;
} 

.bg-image {
  /* The image used */
  background-image: url("");
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


<body class="bg-image">
<div class="container  bg-light">
<!--Section: Contact v.2-->
<section class="mb-4">

    <!--Section heading-->
    <h2 class="h1-responsive font-weight-italic text-center my-4">Contact us</h2>
    <!--Section description-->
    <p class="text-center w-responsive mx-auto mb-5">Do you have any questions? Please do not hesitate to contact us directly. Our team will come back to you within
        a matter of hours to help you.</p>

    <div class="row ">

        <div class="col-md-9 mb-md-0 mb-5">
            <form  action="createcont" method="post">
 
                <div class="row">
                    <div class="col-md-6">
                        <div class="md-form mb-0">
                        <label for="name" class="">Your name</label>
                            <input type="text" name="ctName" class="form-control" pattern="^[a-zA-z]+([\s][a-zA-Z]+)*$"  required autocomplete="off" title="Only characters are allowed..">
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="md-form mb-0">
                             <label for="email" class="">Your email</label>
                            <input type="email"  name="ctEmail" class="form-control" pattern="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z]{5})\.([a-zA-Z]{3})$" required autocomplete="off" title="Enter valid email..">
                            
                        </div>
                    </div>
                    
                </div>
                
                <div class="row">
                    <div class="col-md-6">
                        <div class="md-form mb-0">
                         <label for="subject" class="">Subject</label>
                            <input type="text"  name="ctSubject" class="form-control" pattern="[A-Za-z0-9\s]{1,50}" required autocomplete="off" title="subject only contains characters & numbers..">                          
                       </div>
                    </div>
                
                
                 <div class="col-md-6">
                        <div class="md-form mb-0">
                             <label for="mobile" class="">Mobile</label>
                            <input type="text"  name="ctMobile" class="form-control" Pattern= "[789][0-9]{9}" required autocomplete="off" title="Mobile number should be 10 digit..">
                            
                        </div>
                    </div>
                   </div>
                    
                <div class="row">
                    <div class="col-md-12">
                        <div class="md-form">
                         <label for="message">Your message</label>
                            <input type="text"  name="ctMessage"  id="todaydate" class="form-control md-textarea"  minlength="5" maxlength="200" pattern="^[a-zA-z0-9]+([\s][a-zA-Z0-9]+)*$" required autocomplete="off" title="message only contains characters & numbers.."/>                       
                        </div>

                    </div>
                    
                   <%--  <input type="hidden" name="ctDate" id="today" value="${today}"/>
                    
                    <script type="text/javascript">
                    document.getElementById('today').value = moment().format('YYYY-MM-DD');
                    </script> --%>
                   <!--  
                    <script>
                      if ( window.history.replaceState ) {
                       window.history.replaceState( null, null, window.location.href );
                      }
                 	</script> -->
                    
                </div>
                 <div class="text-center text-md-left mt-3">         
									<button class="btn btn-md btn-info" type="submit">Send</button>
            </div>
            <br>
            <div>
            <c:if test="${contdone==1 }"><h5><i>Thank you for contacting us...!</i></h5></c:if>
            </div>
            </form>

            
        </div>
        <div class="col-md-3 text-center">
            <ul class="list-unstyled mb-0">
                <li><i class="fas fa-map-marker-alt fa-2x"></i>
                    <p>Team 25, CDAC MUMBAI</p>
                </li>

                <li><i class="fas fa-phone mt-4 fa-2x"></i>
                    <p>+ 01 234 567 89</p>
                </li>

                <li><i class="fas fa-envelope mt-4 fa-2x"></i>
                    <p>doctor0hub@gmail.com</p>
                </li>
            </ul>
        </div>

    </div>

</section>




</div>

</body>
</html>