<?php
    include 'database.php';

    $id_instalacao = $_GET['id'];

    $result = pg_query($connection, "SELECT endereco_id FROM instalacao WHERE id = $id_instalacao");
    $id_endereco = pg_fetch_array($result, 0)['endereco_id'];

    $result = pg_query($connection, "DELETE FROM instalacao WHERE id = $id_instalacao") or die(pg_last_error());

    $result = pg_query($connection, "DELETE FROM endereco WHERE id = $id_endereco") or die(pg_last_error());

    if($result){
        header('location:index.php?pagina=instalacoes&sucessoExcluir');
    }else{
        header('location:index.php?pagina=instalacoes&erroExcluir');
    }