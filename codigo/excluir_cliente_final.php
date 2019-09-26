<?php
    include 'database.php';

    $id_cliente = $_GET['id'];

    $result = pg_query($connection, "UPDATE instalacao SET ativo = false WHERE cliente_final_id = $id_cliente") or die(pg_last_error());
    $result = pg_query($connection, "UPDATE cliente_final SET ativo = false WHERE id = $id_cliente") or die(pg_last_error());

    if($result){
        header('location:index.php?pagina=home&sucessoExcluir');
    }else{
        header('location:index.php?pagina=home&erroExcluir');
    }