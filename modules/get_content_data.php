<?php
include("../connect.php");


$table = $_POST["table"];

if ($_POST["filter"] != "") {
    $active_filter = " where ".$_POST["filter"];
} else $active_filter = "";

// Kapcsolatok (JOIN-ok)
$foreign_joins = [];
if (isset($_POST["foreignJoins"])) {
    $foreign_joins = json_decode($_POST["foreignJoins"], true);
}

// Az SQL SELECT és JOIN részekhez szükséges változók
$select_fields = $table.".*";   // Kezdés: a fő tábla összes mezője
$joins = "";                  // Ide gyűjtjük a JOIN utasításokat

// Végigmegyünk az összes kapcsolaton
foreach ($foreign_joins as $join) {

    // Táblák és kulcsok nevei
    $foreign_table = $join["foreignTable"];
    $foreign_field = $join["foreignFieldName"];
    $foreign_id = $join["foreignId"];
    $fields = $join["fields"];

    // Összekapcsolás (JOIN)
    $joins .= " left join " . $foreign_table . " on " . $table . "." . $foreign_field . " = " . $foreign_table . "." . $foreign_id;

    // A csatlakozott tábla mezőinek hozzáadása a SELECT részhez
    foreach ($fields as $field) {
        $select_fields .= ", " . $foreign_table . "." . $field;
    }
}


$query = "select " . $select_fields . " from " . $table . $joins . $active_filter;

$data = $connect->query($query);

$response = [];

while ($row = mysqli_fetch_assoc($data)) {
    $response[] = $row;
}


echo json_encode($response);

?>