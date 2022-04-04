<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="css/HospitalList.css" rel="stylesheet" type="text/css">
<script src="css/searchOpt.js" type="text/javascript"></script>
</head>
<body>
<div>

<!-- Tab links -->
<div class="tab">
  <button class="tablinks" onclick="openCity(event, 'London')">Search By doctors</button>

 
</div>

<!-- Tab content -->
<div id="London" class="tabcontent">
<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names..">

<ul id="myUL">
  <li><a href="#">Adele</a></li>
  <li><a href="#">Agnes</a></li>

  <li><a href="#">Billy</a></li>
  <li><a href="#">Bob</a></li>

  <li><a href="#">Calvin</a></li>
  <li><a href="#">Christina</a></li>
  <li><a href="#">Cindy</a></li>
</ul>
</div>




</div>
</body>
</html>