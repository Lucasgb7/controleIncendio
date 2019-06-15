<?php
    include 'database.php';

    $id = $_POST['id_cliente'];
    $nome = $_POST['nome'];
    $tipo_pessoa = $_POST['pessoa'];
    $cpf = $_POST['cpf'];
    $cnpj = $_POST['cnpj'];
    session_start();
    $servico_id = $_SESSION['id_servico_seguranca'];

    //editar um cliente existente
    if(strlen($id)>0){
        $query = "UPDATE cliente_final SET nome = '$nome', tipo_pessoa = '$tipo_pessoa' WHERE id = $id";
        $result = pg_query($connection, $query) or die (pg_last_error());
        if($tipo_pessoa == 'f'){
            $query = "UPDATE pessoa_fisica SET cpf = '$cpf' WHERE cliente_id = $id";
            $result = pg_query($connection, $query) or die (pg_last_error());
        }else{
            $query = "UPDATE pessoa_juridica SET cnpj = '$cnpj' WHERE cliente_id = $id";
            $result = pg_query($connection, $query) or die (pg_last_error());
        }

        if($result){
            header('location:index.php?pagina=home&sucessoEditar');
        }else{
            header('location:index.php?pagina=home&erroEditar');
        }
    }else{ //cadastrar um novo cliente
        $query = "INSERT INTO cliente_final (nome, servico_seguranca_id, tipo_pessoa)
        VALUES ('$nome', $servico_id, '$tipo_pessoa')";
        $result = pg_query($connection, $query) or die (pg_last_error());

        if($result){
            $query = "SELECT id FROM cliente_final WHERE nome = '$nome'";
            $result = pg_query($connection, $query) or die (pg_last_error());
            $id_cliente = pg_fetch_array($result, 0)['id'];

            if($tipo_pessoa == 'f'){
                $query = "INSERT INTO pessoa_fisica (cliente_id, cpf)
                            VALUES ($id_cliente, '$cpf')";
                $result = pg_query($connection, $query) or die (pg_last_error());
            }else{
                $query = "INSERT INTO pessoa_juridica (cliente_id, cnpj)
                            VALUES ($id_cliente, '$cnpj')";
                $result = pg_query($connection, $query) or die (pg_last_error());
            }

            if($result){
                header('location:index.php?pagina=home&sucessoCadastrar');
            }else{
                header('location:index.php?pagina=home&erroCadastrar');
            }
        }
    }
    