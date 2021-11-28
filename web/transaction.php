<?php
    include 'db-connect.php';
    /*
        1). Start a timer
        2). Query the warehouse table using W_ID from user to get the W_TAX
        3). Query district table using W_ID and D_ID from user to get D_TAX and D_NEXT_O_ID. Increment D_NEXT_O_ID by one
        4). Query customer table using W_ID, D_ID, and C_ID from user and get records
        5). Insert into NEW ORDER and ORDER table

        For each item in the order line:
        1). Get some data from the item table
        2). Use W_ID, D_ID to get data from stock table
        3). Might need to updae the stock quantity
        4). Calculate some information and insert to ORDER LINE table

        Need to output data based on if the transaction commited or roll back

    */
   

   //2 Takes WarehouseID from input (W_ID), later function grabs W_TAX
   $wid = $_POST["warehouseID"];

   //3 Takes District ID from input (D_ID), later functions grabs D_TAX ?? D_NEXT_O_ID ??
   $did = $_POST["districtID"];

   //4 Takes Customer ID from input (C_ID) to query customer table using W_ID and D_ID to get information
   $cid = $_POST["customerID"];


   // This SQL query retrieves all revelant information from Steps 2-4 and prepares for Order
   try {

    $cid = $_POST["customerID"];

    $sqlc = "SELECT customer.C_LAST, customer.C_CREDIT, customer.C_DISCOUNT, warehouse.W_TAX, district.D_TAX 
               FROM customer
               JOIN warehouse
               ON warehouse.W_ID = customer.C_W_ID
               JOIN district
               ON district.D_ID = customer.C_D_ID
               WHERE C_ID ='".$cid."';
            ";

    $c = $pdo->query($sqlc);
    
    if ($c === false){
        die("Error");
    }
} catch (PDOException $e){
    echo $e->getMessage();
}


// This SQL query retrieves all relevant item information to prepare for order  
try {
    $sqld = "SELECT item.I_ID, item.I_NAME, item.I_DATA, item.I_PRICE, stock.S_QUANTITY, stock.S_DIST_01
               FROM item
               JOIN stock
               ON stock.S_I_ID = item.I_ID
               WHERE I_ID = '1';
            ";

    $d = $pdo->query($sqld);
    
    if ($d === false){
        die("Error");
    }
} catch (PDOException $e){
    echo $e->getMessage();
}

  // This SQL query inserts data based on user input into the customer_order table
  try {
    
    $sqlf = "INSERT INTO `customer_order` (O_ID, O_D_ID, O_W_ID, O_C_ID, O_ENTRY_D, O_CARRIER_ID, O_OL_CNT, O_ALL_LOCAL)
    VALUES (:O_ID, :O_D_ID, :O_W_ID, :O_C_ID, :O_ENTRY_D, :O_CARRIER_ID, :O_OL_CNT, :O_ALL_LOCAL)";
    
    $stmt = $pdo->prepare($sqlf);
    $stmt->bindParam(':O_ID', $c1);
    $stmt->bindParam(':O_D_ID', $c2);
    $stmt->bindParam(':O_W_ID', $c3);
    $stmt->bindParam(':O_C_ID', $c4);
    $stmt->bindParam(':O_ENTRY_D', $c5);
    $stmt->bindParam(':O_CARRIER_ID', $c6);
    $stmt->bindParam(':O_OL_CNT', $c7);
    $stmt->bindParam(':O_ALL_LOCAL', $c8);
    
    $c1 = null;
    $c2 = $_POST["districtID"];  
    $c3 = $_POST["warehouseID"];  
    $c4 = $_POST["customerID"];
    $c5 = "4";
    $c6 = "4";
    $c7 = "4";
    $c8 = "4";

   $stmt->execute();
    
    } catch(PDOException $e) {
        echo "Error: " . $e->getMessage();
      }


      // This SQL query inserts data based on user input and order information into order_line table
      try {
    
        $sqlg = "INSERT INTO `order_line` (OL_O_ID, OL_D_ID, OL_W_ID, OL_NUMBER, OL_I_ID, OL_SUPPLY_W_ID, OL_DELIVERY_D, OL_QUANTITY, OL_AMOUNT, OL_DIST_INFO)
        VALUES (:OL_O_ID, :OL_D_ID, :OL_W_ID, :OL_NUMBER, :OL_I_ID, :OL_SUPPLY_W_ID, :OL_DELIVERY_D, :OL_QUANTITY, :OL_AMOUNT, :OL_DIST_INFO)";
        
        $stmt = $pdo->prepare($sqlg);
        $stmt->bindParam(':OL_O_ID', $o1);
        $stmt->bindParam(':OL_D_ID', $o2);
        $stmt->bindParam(':OL_W_ID', $o3);
        $stmt->bindParam(':OL_NUMBER', $o4);
        $stmt->bindParam(':OL_I_ID', $o5);
        $stmt->bindParam(':OL_SUPPLY_W_ID', $o6);
        $stmt->bindParam(':OL_DELIVERY_D', $o7);
        $stmt->bindParam(':OL_QUANTITY', $o8);
        $stmt->bindParam(':OL_AMOUNT', $o9);
        $stmt->bindParam(':OL_DIST_INFO', $o10);
        
        $o1 = null;
        $o2 = $_POST["districtID"];
        $o3 = $_POST["warehouseID"];
        $o4 = "3";
        $o5 = "4";
        $o6 = "1";
        $o7 = "4";
        $o8 = "4";
        $o9 = "4";
        $o10 = "Good";
    
        $stmt->execute();
        
        } catch(PDOException $e) {
            echo "Error: " . $e->getMessage();
          }
    

// This SQL query inserts information into new_order table
// Takes D_ID and W_ID from user input, and creates/increments the O_ID

// need to find a way to increment the order id
try {
    
    $sqle = "INSERT INTO `new_order` (NO_O_ID, NO_D_ID, NO_W_ID)
    VALUES (:NO_O_ID, :NO_D_ID, :NO_W_ID)";
    
    $stmt = $pdo->prepare($sqle);
    $stmt->bindParam(':NO_O_ID', $oid);
    $stmt->bindParam(':NO_D_ID', $did);
    $stmt->bindParam(':NO_W_ID', $wid);
 
    $oid = null;                  
    $did = $_POST["districtID"];               
    $wid = $_POST["warehouseID"]; 
    
    $stmt->execute();
    
    } catch(PDOException $e) {
        echo "Error: " . $e->getMessage();
      }



    // Timer? (Not completely working)
    // starting time
    $time_start = microtime(true);
    echo "OK";
    $date = date("Y/m/d");
    
/**
 * Simple function to replicate PHP 5 behaviour
 */
function microtime_float()
{
    list($usec, $sec) = explode(" ", microtime());
    return ((float)$usec + (float)$sec);
}

$time_start = microtime_float();

// Sleep for a while
usleep(100);

$time_end = microtime_float();
$time = $time_end - $time_start;

?>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>TPCC Benchmark on AWS Elastic Beanstalk and RDS</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <style>body {margin-top: 40px; background-color: #333;}</style>
        <link href="assets/css/bootstrap-responsive.min.css" rel="stylesheet">
        <!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    </head>

    <body>
        <div class="container">
            <div class="hero-unit">
                <table class="table table-bordered table-dark" name="order_header">
                    <thead>
                        <tr>
                        <th scope="col">Order Summary</th>
                        
                        </tr>
                    </thead>
                    <tbody>
                   
                        <tr>
                            <!-- This part of the code is using information from previous webpage,
                                    not querying database for information

                                    (Includes C_ID using customerID)               -->
                        <td>W_ID <?php echo $_POST["warehouseID"]; ?></th>
                        <td colspan="2">D_ID <?php echo $_POST["districtID"]; ?></td>
                        <td colspan="2">Date <?php echo $date ?></td>
                        </tr>
                        <tr>
                            <!-- This part of the code uses the customer query to display information from MySQL -->
                        <?php while($row = $c->fetch(PDO::FETCH_ASSOC)) : ?>

                        <td>C_ID <?php echo $_POST["customerID"]; ?></th>
                        <td colspan="2">C_Last_Name <?php echo htmlspecialchars($row['C_LAST']); ?> </td>
                        <td>C_Credit <?php echo htmlspecialchars($row['C_CREDIT']); ?></td>
                        <td>C_Discount <?php echo htmlspecialchars($row['C_DISCOUNT']); ?></td>
                        
                        </tr>
                        <tr>
                        
                        <td>O_ID 1</th>
                        <td colspan="2">O_Count <?php echo $_POST["order_Count"]; ?></td>
                        <td>W_Tax <?php echo htmlspecialchars($row['W_TAX']); ?></td>     
                        <td>D_Tax <?php echo htmlspecialchars($row['D_TAX']); ?></td>
                        <?php endwhile; ?>
                        </tr>
                      
                    </tbody>
                </table>

                <br>
                <!-- This part of the code uses the item query to display information from MySQL -->
                <?php while($row = $d->fetch(PDO::FETCH_ASSOC)) : ?>
                <table class="table table-bordered table-dark" name="line_summary">
                    <thead>
                        <tr>
                      
                        <th scope="col">Supp_W_ID</th>
                        <th scope="col">I_ID</th>
                        <th scope="col">I_Name</th>
                        <th scope="col">I_Quant</th>
                        <th scope="col">I_Stock</th>
                        <th scope="col">I_Brand</th>
                        <th scope="col">I_Price </th>
                        <th scope="col">I_Total</th>


              
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                        <td><?php echo $_POST["OL_SUPPLY_W_ID_1"]; ?></td>
                        <td><?php echo $_POST["OL_I_ID_1"]; ?> </td>
                        <td><?php echo htmlspecialchars($row['I_NAME']); ?></td>
                        <td><?php echo htmlspecialchars($row['S_QUANTITY']); ?></td>
                        <td><?php echo htmlspecialchars($row['S_DIST_01']); ?></td>
                        <td><?php echo htmlspecialchars($row['I_DATA']); ?></td>
                        <td><?php echo htmlspecialchars($row['I_PRICE']); ?></td>
                        <td><?php echo $_POST["OL_QUANTITY_1"]; ?></td>
                        </tr>
                        <tr>
                        <td colspan="3" name="Status">Order status: Success</th>
                        <td colspan="3"></th>
                        <td colspan="2">Order Total: $<?php echo htmlspecialchars($row['I_PRICE']); ?></th>
                        </tr>
                        <tr>
                        <td colspan="4"></th>
                        <td colspan="4" name="Processing_Time">Transaction Time: <?php echo $time ?> seconds</th>
                        <?php $time_start = "0"; ?>
                        </tr>
                        <?php endwhile; ?>
                    </tbody>
                </table>
            </div>
        </div>

    </body>
</html>