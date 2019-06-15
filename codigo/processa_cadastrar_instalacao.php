<?php
    include 'database.php';

    $data_instalacao = $_POST['data_instalacao'];
    $cliente_nome = $_POST['cliente_nome'];
    $numero_dispositivo = $_POST['numero_dispositivo'];
    $cep = $_POST['cep'];
    $logradouro = $_POST['logradouro'];
    $complemento = $_POST['complemento'];
    $referencia = $_POST['referencia'];
    $bairro = $_POST['bairro'];
    $cidade = $_POST['cidade'];
    $uf = $_POST['uf'];

    $query = "INSERT INTO endereco (cep, logradouro, numero, referencia, bairro, municipio, uf)
              VALUES ('$cep','$logradouro','$complemento','$referencia','$bairro','$cidade','$uf')";
    $inserir_endereco = pg_query($connection, $query) or die (pg_last_error());

    $query = "SELECT id FROM endereco WHERE logradouro = '$logradouro' AND numero = '$complemento'";
    $selecionar_endereco = pg_query($connection, $query) or die (pg_last_error());
    $id_endereco = pg_fetch_array($selecionar_endereco, 0)['id'];

    $query = "SELECT id FROM cliente_final WHERE nome = '$cliente_nome'";
    $selecionar_cliente = pg_query($connection, $query) or die (pg_last_error());
    $id_cliente = pg_fetch_array($selecionar_cliente, 0)['id'];

    $query = "INSERT INTO instalacao (data_instalacao, cliente_final_id, endereco_id, dispositivo)
              VALUES ('$data_instalacao',$id_cliente,$id_endereco,$numero_dispositivo)";
    $inserir_instalacao = pg_query($connection, $query) or die (pg_last_error());

    if($inserir_instalacao){
        header('location:index.php?pagina=home&sucessoCadastrar');
    }else{
        header('location:index.php?pagina=home&erroCadastrar');
    }
    