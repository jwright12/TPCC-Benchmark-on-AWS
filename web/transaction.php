<?php
    include 'db-connect.php';
    $q = $pdo->query('SELECT * FROM warehouse');
    echo "OK";
?>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>TPCC Benchmark on AWS Elastic Beanstalk and RDS</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../web/assets/css/bootstrap.min.css" rel="stylesheet">
        <style>body {margin-top: 40px; background-color: #333;}</style>
        <link href="../web/assets/css/bootstrap-responsive.min.css" rel="stylesheet">
        <!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    </head>

    <body>
            <?php
		        echo $_POST["warehouseID"];
		 
	        ?>
    </body>

</html>
