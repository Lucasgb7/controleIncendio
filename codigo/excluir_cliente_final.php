<?php
    include 'database.php';

    $id_cliente = $_GET['id'];
    
    $result = pg_query($connection, "SELECT tipo_pessoa FROM cliente_final WHERE id = $id_cliente");
    $tipo_pessoa = pg_fetch_array($result, 0)['tipo_pessoa'];

    if($tipo_pessoa == 'f'){
        $result = pg_query($connection, "DELETE FROM pessoa_fisica WHERE cliente_id = $id_cliente") or die(pg_last_error());
    }else{
        $result = pg_query($connection, "DELETE FROM pessoa_juridica WHERE cliente_id = $id_cliente") or die(pg_last_error());
    }

    $result = pg_query($connection, "DELETE FROM cliente_final WHERE id = $id_cliente") or die(pg_last_error());

    if($result){
        header('location:index.php?pagina=home&sucessoExcluir');
    }else{
        header('location:index.php?pagina=home&erroExcluir');
    }