<?php session_start(); ?>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<meta http-equiv="Content-Type"content="text/html; charset=utf-8" /> 
</head>
<body>
<div id="content">
<?php
require 'connect.inc.php';
require 'core.inc.php';

include 'fejlec.php';


?>
<?php
require 'loginform.php';
if(isset($_POST['felhnev'])&&isset($_POST['jelszo'])&&isset($_POST['tipus'])){
	$username = $_POST['felhnev'];
	$password = $_POST['jelszo'];
	$tipus = $_POST['tipus'];
	if($tipus == 'szaki') {
	$query = "SELECT * FROM SZAKI WHERE FELHASZNALONEV = '" . $username . "' and JELSZO='".$password."'";
	} else if($tipus == 'felhasz') {
	$query = "SELECT * FROM FELHASZNALO WHERE FELHASZNALONEV = '" . $username . "' and JELSZO='".$password."'";
	}
	
	$stid = oci_parse($conn, $query);
	oci_execute($stid);
	$tmpcount = OCIFetch($stid);
	if ($tmpcount==1){
	 $count = OCIRowCount($stid);
	   if ($count == 1) {
		   $_SESSION['user'] = $username;
			header('Location: index.php'); 
	   } 
	}else {echo 'Hibás jelszó vagy felhasználó név vagy rossz típus választás';}
}
?>
</div>
</body>
</html>