<?php
$servername = "3.110.179.14";
$username = "rajasekhar";
$password = "rajasekhar";
$dbname = "ecommerce_db";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
	    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * FROM products";
$result = $conn->query($sql);

$products = [];
if ($result->num_rows > 0) {
	    while ($row = $result->fetch_assoc()) {
		            $products[] = $row;
			        }
}

echo json_encode($products);

$conn->close();
?>

