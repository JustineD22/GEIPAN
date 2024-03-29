<?php

if(isset($_SESSION['login']) && $_SESSION['login'] === true) {
    $bienvenue = "<p>";
    $bienvenue .= "Bonjour ";
    $bienvenue .= $_SESSION['firstname'];
    $bienvenue .= " ";
    $bienvenue .= $_SESSION['name'];
    $bienvenue .= "</p>";
    echo $bienvenue;
}
else {

?>

<h1>Bienvenue sur Geipan</h1>
<p>Pour mettre une observation</p>
<br>
<form action="index.php?page=home" method="post" >
    <ul>
        <li> 
            <label for="email"> E-mail :</label> 
            <input type="text" id="email" name="email" />
        </li>
        <li> 
            <label for="states"> Votre Département :</label> 
            <?php echo getStates();?>
        </li>
        <li> 
            <label for="dateEvenement"> Date de l'évenement :</label> 
            <input type="date" name="dateEvenement" id="dateEvenement">
        </li>
        <li> 
            <label for="timeEvenement"> Heure de l'évenement :</label> 
            <input type="time" name="timeEvenement" id="timeEvenement">
        </li>
        <li> 
            <label for="duration"> Durée de l'évenement :</label> 
            <input type="text" name="duration" id="duration">
        </li>
        <li> 
            <label for="direction"> Sa Direction :</label> 
            <select name="direction">
                <option value="Nord">Nord</option>
                <option value="Sud">Sud</option>
                <option value="Est">Est</option>
                <option value="Ouest">Ouest</option>
            </select>
        </li>
        <li>
        <label for="meteo"> La condition météorologique :</label> 
            <select name="meteo">
                <option value="Soleil">Soleil</option>
                <option value="Nuageux">Nuageux</option>
                <option value="Pluie">Pluie</option>
                <option value="Vent">Vent</option>
            </select>
        </li>
        <li>
        <label for="description">Description Evenement</label>
        <input type="text" id="description" name="description">
        </li>
        <li>
            <input type="reset" value="Effacer" />
        </li>
        <li>
            <input type="submit" value="Confirmer" name="confirmer" />
        </li>
    </ul>
</form>

<?php
    $serverName = "localhost";
    $userName = "root";
    $database = "geipan";
    $userPassword = "";

    if (isset($_POST['confirmer'])) {
        $email = $_POST['email'] ?? '';
        $states = $_POST['states'] ?? '';
        $dateEv = $_POST['dateEvenement'] ?? '';
        $timeEv = $_POST['timeEvenement'] ?? '';
        $duration = $_POST['duration'] ?? '';
        $direction = $_POST['direction'] ?? '';
        $meteo = $_POST['meteo'] ?? '';
        $description = $_POST['description'] ?? '';
        

      
        $erreur = array();

        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            array_push($erreur, "Veuillez saisir un e-mail valide");
        }
        if ($dateEv === 0) {
            array_push($erreur, "Veuillez saisir une date");
        }
        if ($timeEv === 0) {
            array_push($erreur, "Veuillez saisir une heure");
        }
        if ($duration === 0) {
            array_push($erreur, "Veuillez saisir un temps");
        }
        if ($direction === 0) {
            array_push($erreur, "Veuillez saisir une direction");
        }
        if ($meteo === 0) {
            array_push($erreur, "Veuillez saisir une condition météorologique");
        }

        if (count($erreur) === 0) {

            try {
                $conn = new PDO("mysql:host=$serverName;dbname=$database", $userName, $userPassword);
                $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);                
                $requete = $conn->prepare("SELECT * FROM users WHERE userMail='$email'");
                $requete->execute();
                $resultat = $requete->fetchAll(PDO::FETCH_OBJ);
            
                if(count($resultat) !== 0) {
                    $queryobservation1 = $conn->prepare("
                    INSERT INTO observations(obsDateTime, obsDuration, obsLocation, obsCardinalPoint, obsWeather, obsDescription, id_state)
                    VALUES (:datetime, :duration, :location, :direction, :meteo, :description, :id_state)
                    ");

                    $queryobservation1->bindParam(':datetime', $dateEv);
                    $queryobservation1->bindParam(':duration', $duration);
                    $queryobservation1->bindParam(':location', $states);
                    $queryobservation1->bindParam(':direction', $direction);
                    $queryobservation1->bindParam(':meteo', $meteo);
                    $queryobservation1->bindParam(':description', $description);
                    $queryobservation->bindParam(':id_state', $idstate);
                    

                    $queryobservation1->execute();
                    
                    echo "<p>Votre Observation à été envoyé</p>";
                }

                else {
                    $queryuser = $conn->prepare("
                    INSERT INTO users(id_role, userMail)
                    VALUES (:id_role, :usermail)
                    ");

                    $id = 1;
                    $queryuser->bindParam(':id_role', $id);
                    $queryuser->bindParam(':usermail', $email, PDO::PARAM_STR_CHAR);
                    $queryuser->execute();

                    $queryobservation = $conn->prepare("
                    INSERT INTO observations(obsDateTime, obsDuration, obsLocation, obsCardinalPoint, obsWeather, obsDescription)
                    VALUES (:datetime, :duration, :location, :direction, :meteo, :description)
                    ");

                    $queryobservation->bindParam(':datetime', $dateEv);
                    $queryobservation->bindParam(':duration', $duration);
                    $queryobservation->bindParam(':location', $states);
                    $queryobservation->bindParam(':direction', $direction);
                    $queryobservation->bindParam(':meteo', $meteo);
                    $queryobservation->bindParam(':description', $description);
                    // $queryobservation->bindParam(':id_state', $idstate);
                    

                    $queryobservation->execute();
                    
                    echo "<p>Votre Observation à été envoyé</p>";
                }
            } catch (PDOException $e) {
                die("Erreur :  " . $e->getMessage());
            }

            $conn = null;
        } else {
            $messageErreur = "<ul>";
            $i = 0;
            do {
                $messageErreur .= "<li>" . $erreur[$i] . "</li>";
                $i++;
            } while ($i < count($erreur));

            $messageErreur .= "</ul>";

            echo $messageErreur;
        }
    } else {
        echo "<h2>Merci de renseigner le formulaire&nbsp;:</h2>";
        $emai = $dateEv = $timeEv  = '';
    }

}
