<?php

//load.php

$connect = new PDO('mysql:host=localhost;dbname=rikimotor', 'root', '');

$data = array();

$query = "SELECT * FROM service_requests";

$statement = $connect->prepare($query);

$statement->execute();

$result = $statement->fetchAll();

foreach($result as $row)
{
 $data[] = array(
  'id'   => $row["id"],
  'title'   => $row["title"],
  'start'   => $row["date_created"],
 );
}

echo json_encode($data);

?>