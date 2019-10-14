app.config(function($routeProvider, $locationProvider){

    $routeProvider

    .when('/', {
        templateUrl : 'app/views/login.html',
        controller  : 'LoginCtrl',
    })

    .when('/home', {
        templateUrl : 'app/views/home.html',
        controller     : 'HomeCtrl',
    })
    

    .when('/instalacoes', {
        templateUrl : 'app/views/instalacoes.html',
        controller  : 'InstalacoesCtrl',
    })

    .when('/ocorrencias', {
        templateUrl : 'app/views/ocorrencias.html',
        controller  : 'OcorrenciasCtrl',
    })

    .when('/cadastrarCliente', {
        templateUrl : 'app/views/cadastrarCliente.html',
        controller  : 'CadastrarClienteCtrl',
    })

    .when('/cadastrarInstalacao', {
        templateUrl : 'app/views/cadastrarInstalacao.html',
        controller  : 'CadastrarInstalacaoCtrl',
    })

    .otherwise ({ redirectTo: '/' });
});