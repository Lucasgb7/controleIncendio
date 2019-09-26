<?php
    include 'database.php';

    $id_instalacao = $_GET['id'];

    $result = pg_query($connection, "UPDATE instalacao SET ativo = false WHERE id = $id_instalacao RETURNING endereco_id") or die(pg_last_error());

    $id_endereco = pg_fetch_array($result, 0)['endereco_id'];
    $result = pg_query($connection, "UPDATE endereco SET ativo = false WHERE id = $id_endereco") or die(pg_last_error());

    if($result){
        header('location:index.php?pagina=instalacoes&sucessoExcluir');
    }else{
        header('location:index.php?pagina=instalacoes&erroExcluir');
    }