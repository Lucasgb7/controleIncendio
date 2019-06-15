<?php
    include 'database.php';

    //get the q parameter from URL
    $q=$_GET["q"];
    $id_input="'".$_GET['id']."'";

    if(substr($_GET['id'],0,1) == "c"){
        $query = "SELECT nome from cliente_final WHERE nome ILIKE '$q%' LIMIT 5";
    }

    $result = pg_query($connection, $query);

    $hint = "";
    $i=0;
    while($linha = pg_fetch_array($result, $i)){
        $hint = $hint.'<input type="button" class="autocompleteBtn" value="'.$linha['nome'].'" onclick="selecionaComplete(this.value,'.$id_input.')"><br>';
        $i++;
    }

    // Set output to "no suggestion" if no hint was found
    // or to the correct values
    if ($hint=="") {
    $response="Cliente não encontrado.";
    } else {
    $response=$hint;
    }

    //output the response
    echo $response;
?>