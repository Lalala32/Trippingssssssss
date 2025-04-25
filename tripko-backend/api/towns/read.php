<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

try {

    $towns = [
        ["town_id" => 1, "name" => "Agno"],
        ["town_id" => 2, "name" => "Aguilar"],
        ["town_id" => 3, "name" => "Alaminos"],
        ["town_id" => 4, "name" => "Alcala"],
        ["town_id" => 5, "name" => "Anda"],
        ["town_id" => 6, "name" => "Asingan"],
        ["town_id" => 7, "name" => "Balungao"],
        ["town_id" => 8, "name" => "Bani"],
        ["town_id" => 9, "name" => "Basista"],
        ["town_id" => 10, "name" => "Bautista"],
        ["town_id" => 11, "name" => "Bayambang"],
        ["town_id" => 12, "name" => "Binalonan"],
        ["town_id" => 13, "name" => "Binmaley"],
        ["town_id" => 14, "name" => "Bolinao"],
        ["town_id" => 15, "name" => "Bugallon"],
        ["town_id" => 16, "name" => "Burgos"],
        ["town_id" => 17, "name" => "Calasiao"],
        ["town_id" => 18, "name" => "Dasol"],
        ["town_id" => 19, "name" => "Dagupan"],
        ["town_id" => 20, "name" => "Infanta"],
        ["town_id" => 21, "name" => "Labrador"],
        ["town_id" => 22, "name" => "Lingayen"],
        ["town_id" => 23, "name" => "Mabini"],
        ["town_id" => 24, "name" => "Malasiqui"],
        ["town_id" => 25, "name" => "Manaoag"],
        ["town_id" => 26, "name" => "Mangaldan"],
        ["town_id" => 27, "name" => "Mangatarem"],
        ["town_id" => 28, "name" => "Mapandan"],
        ["town_id" => 29, "name" => "Natividad"],
        ["town_id" => 30, "name" => "Pozorrubio"],
        ["town_id" => 31, "name" => "Rosales"],
        ["town_id" => 32, "name" => "San Carlos"],
        ["town_id" => 33, "name" => "San Fabian"],
        ["town_id" => 34, "name" => "San Jacinto"],
        ["town_id" => 35, "name" => "San Manuel"],
        ["town_id" => 36, "name" => "San Nicolas"],
        ["town_id" => 37, "name" => "San Quintin"],
        ["town_id" => 38, "name" => "Santa Barbara"],
        ["town_id" => 39, "name" => "Santa Maria"],
        ["town_id" => 40, "name" => "Santo Tomas"],
        ["town_id" => 41, "name" => "Sison"],
        ["town_id" => 42, "name" => "Sual"],
        ["town_id" => 43, "name" => "Tayug"],
        ["town_id" => 44, "name" => "Umingan"],
        ["town_id" => 45, "name" => "Urbiztondo"],
        ["town_id" => 46, "name" => "Urdaneta"],
        ["town_id" => 47, "name" => "Villasis"]
    ];

    echo json_encode(["records" => $towns]);
} catch(Exception $e) {
    http_response_code(500);
    echo json_encode(["message" => $e->getMessage()]);
}
?>