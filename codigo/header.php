<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
    <link rel= "stylesheet" type="text/css" href="css/main.css">
    <title>Controle de incêndio</title>
</head>
<body>
    <div ng-app="myApp" ng-controller="myCtrl">
    <header>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Nome agencia</a>
                </div>
                <ul class="nav navbar-nav navbar-right">
                    <li>usuario_nome</li>
                    <li><img src="" alt=""></li>
                </ul>
            </div>
        </nav>
    </header>

    <!-- aq vai os elementos q aparecem em todas as paginas da aplicacao. ex: menu -->
    <div class="container">
    <div class="jumbotron">
        <ul>
            <li><a href="">Monitoramento</a></li>
            <li><a href="">Clientes</a></li>
            <li><a href="">Ocorrencias</a></li>
            <li><a href="">Instalações</a></li>
            <li><a href="">Chamados</a></li>
        </ul>
    </div>
    </div>

    <div id="conteudo" class="container">