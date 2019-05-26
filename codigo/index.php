<?php
session_start();
include 'database.php';

if($_SESSION['login']){
    $pagina = $_GET['pagina'];
}else{
    if($_GET['pagina'] == 'esqueceuSenha')
        $pagina = 'esqueceuSenha';
    else
        $pagina = 'login';
}

if($pagina != 'login' && $pagina != 'esqueceuSenha')
    include 'header.php';

//controle qual pagina estao aberta
switch($pagina){
    case 'home': include 'view/home.php'; break;
    default: include 'view/login.php'; break;
}

include 'footer.php';