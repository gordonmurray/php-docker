<?php

echo "Hello World From Kubernetes";

?>

<hr >

<?php

// Example use of getenv()
$database_user = getenv('database_user');

echo "Database username: " . $database_user;

