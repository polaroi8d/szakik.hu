	<!--google font importálás-->
<link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
 	<!--bootstrap importálás-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>		
	<!--karakterkódolás-->
<meta http-equiv="Content-Type"content="text/html; charset=utf-8" />
	<!--main css importálás-->
<link rel="stylesheet" type="text/css" href="assets/css/style.css">
<title> Szakik.hu - Ki ne akarna egy jó szakembert? </title>
<?php
  $bg = array('bg-01.jpg', 'bg-02.jpg', 'bg-03.jpg', 'bg-04.jpg', 'bg-05.jpg', 'bg-06.jpg', 'bg-07.jpg' ); 
  $i = rand(0, count($bg)-1); 
  $selectedBg = "$bg[$i]"; 
?>
<style type="text/css">
body {
	background: url(assets/img/<?php echo $selectedBg; ?>) no-repeat;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    background-size: cover;
    -o-background-size: cover;
}

#miertreg {
	background-color: rgba(255,255,255,0.7);
	padding: 30px;
	margin: 10px;
		border-radius: 10px;
}

.col-sm-8 {
	background-color: white;
	margin: 10px;
}

.navbar-form {
	background-color:  rgba(255,255,255,0.8);
	padding: 30px;
	border-radius: 10px;
	width: 300px;
}
nav {
	background-color: blue;
}

#leftbar {
	background-color:  rgba(255,255,255,0.8);
	border-radius: 5px;
	margin: 10px;
}

#main {
	background-color:  rgba(255,255,255,0.8);
	border-radius: 5px;
	margin: 10px;
	padding: 30px;
}

#myNavbar {
	margin-top: -19px;
	background-color: rgba(255,255,255,0.8);
}
</style>