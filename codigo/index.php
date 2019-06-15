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
    case 'ocorrencias': include 'view/ocorrencias.php'; break;
    case 'instalacoes': include 'view/instalacoes.php'; break;
    case 'chamados': include 'view/chamados.php'; break;
    case 'cadastrar_cliente_final': include 'view/cadastrar_cliente_final.php'; break;
    case 'editar_cliente_final': include 'view/editar_cliente_final.php'; break;
    case 'cadastrar_instalacao': include 'view/cadastrar_instalacao.php'; break;
    default: include 'view/login.php'; break;
}

include 'footer.php';