<?php

function getStates()
{
    $serverName = "localhost";
    $userName = "root";
    $database = "geipan";
    $userPassword = "";
    
    $conn = new PDO("mysql:host=$serverName;dbname=$database", $userName, $userPassword);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    $requeteState = $conn->prepare("SELECT * FROM states");
    $requeteState -> execute();
    $resultatState = $requeteState->fetchAll(PDO::FETCH_ASSOC);
    
        $html = "<select name='states[]'>";
        for ($i = 0 ; $i < count($resultatState) ; $i++) {
            
            $html .= "<optgroup label='" . $resultatState[$i]['stateNumber'] . "'>";
            $html .= "<option value='" . $resultatState[$i]['stateLabel'] . "'>";           
            $html .= "</option>";
            $html .= "</optgroup>";
        }
        $html .= "</select>";
        return $html;
}