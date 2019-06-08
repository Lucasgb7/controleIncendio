<?php
include 'database.php';

$usuario = $_POST['usuario'];
$senha = $_POST['senha'];

$query = "SELECT senha FROM servico_seguranca WHERE usuario = '$usuario'";
$result = pg_query($connection, $query);

if(!$result){
    echo pg_last_error();
}else{
    if(pg_num_rows($result) == 1){
        $linha = pg_fetch_array($result, 0);
        if($linha['senha'] === $senha){
            session_start();
            $_SESSION['login'] = true;
            header('location:index.php?pagina=home');
        }else{
            header('location:index.php?erro');
        }
    }else{
        header('location:index.php?erro');
    }
}
